class mon extends uvm_monitor;
  `uvm_component_utils(mon);
  transaction tr;
  virtual mul_intf mif;
  uvm_analysis_port#(transaction) send;
  function new(string name = "mon",uvm_component parent = null);
    super.new(name,parent);
  endfunction
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    tr = transaction::type_id::create("tr");
    if(! uvm_config_db#(virtual mul_intf)::get(this,"","mif",mif))
      `uvm_error("mon","unable to access interface");
    send = new("send",this);
  endfunction
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      #20;
      tr.a = mif.a;
      tr.b = mif.b;
      tr.y = mif.y;
      `uvm_info("MON",$sformatf("a : %0d b : %0d y : %0d",tr.a,tr.b,tr.y),UVM_NONE);
      send.write(tr);

    end
  endtask 
endclass
