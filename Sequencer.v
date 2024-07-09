class sqr extends uvm_sequencer #(tx);
  `uvm_object_utils(sqr)
  
  //constructor
  function new (string name = "sqr", uvm_component parent);
    super.build(name,parent);
  endfunction
  
  //build Phase
  virtual function void buil_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
  //Connect Phase
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction
  
endclass:sqr