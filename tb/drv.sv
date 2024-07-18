class drv extends uvm_driver #(transaction);
  `uvm_component_utils(drv);
  transaction tr;
  virtual mul_intf mif;
  function new(string name = "drv",uvm_component parent = null);
    super.new(name,parent);
  endfunction
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual mul_intf)::get(this,"","mif",mif))
      `uvm_error("drv","unable to access interface");
    //try not to create handle of tr
  endfunction
  virtual task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(tr);
      //assing tr to mif
      mif.a <= tr.a;
      mif.b <= tr.b;
      `uvm_info("DRV",$sformatf("a : %0d b : %0d y : %0d",tr.a,tr.b,tr.y),UVM_NONE);

      seq_item_port.item_done();
      #20; //because its comb circut
    end
  endtask
  
  
  
endclass
