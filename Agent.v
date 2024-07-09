class agnt extends uvm_agent;
  `uvm_component_utils(agnt)
  
  //instantiate required handles
  tx item;
  drv d;
  //monitor has to be declared here
  
  //constructor
  function new(string name = "agnt",uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  //build phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item = tx::type_id::create("item");
    d = drv::type_id::create("d");
    //monitor has be created here
  endfunction
  
  //Connect Phase
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    d.seq_item_port.connect(s0.seq_item_export);
  endfunction
  
endclass
