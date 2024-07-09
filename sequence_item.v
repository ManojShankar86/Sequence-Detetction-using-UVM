class tx extends uvm_sequence_item;
  //macro
  `uvm_object_utils(tx)
  
  rand bit in;
  bit out;
  
  //constructor
  function new(string name = "tx");
    super.new(name);
  endfunction
  
  //constraints if required
  constraint c1{in inside [0,1];}
endclass

  