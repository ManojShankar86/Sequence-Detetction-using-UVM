module top;
  
  bit clk;
  
  intf vif(.clk(clk));
  
  sequ u1(.clk(vif.clk),.rst(vif.rst),.inp(vif.inp),.op(vif.op));
  
  //Interface set at config db
  
  initial begin
    uvm_config_db #(virtual intf)::set(null,"*","vif",vif);
  end
  
  //Start the test
  initial begin
    run_test("test");
  end
  
  //clock gen
  initial begin
    clk = 0;
    #5;
    forever begin
      clk = ~clk;
      #2;
    end
  end
  
  //Mention timeout if necessary
  initial begin
    #50000;
    $display("Simulation Timed out");
    $finish;
  end
  
  //Dump waveforms
  initial begin
    $dumpfile("sequ.vcd");
    $dumpvars;
  end
  
endmodule
