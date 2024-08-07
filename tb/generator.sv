class generator extends uvm_sequence#(transaction);
  `uvm_object_utils(generator);
  transaction tr;
  function new(string name = "generator");
    super.new(name);
  endfunction

  virtual task body();
    repeat(15)
      begin
        tr = transaction::type_id::create("tr");
        start_item(tr);
        assert(tr.randomize());
        `uvm_info("SEQ",$sformatf("a : %0d b : %0d y : %0d",tr.a,tr.b,tr.y),UVM_NONE);
        finish_item(tr);
      end
  endtask
endclass
