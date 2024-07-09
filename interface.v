interface intf(input bit clk);
  bit rst;
  logic inp;
  logic op;
  
  clocking cb @(posedge clk);
    default input #1ns output #3ns;
    input inp;
    output op;
  endclocking
endinterface