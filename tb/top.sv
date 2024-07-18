module top;
  import pkg1::*;
  mul_intf mif();
  mul dut(.a(mif.a),.b(mif.b),.y(mif.y));
  initial begin
    $dumpfile("dumb.vcd");
    $dumpvars;
    uvm_config_db#(virtual mul_intf)::set(null,"*","mif",mif);
    run_test("test");
  end
  
endmodule
