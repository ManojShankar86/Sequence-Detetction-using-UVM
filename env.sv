class env extends uvm_env;
  
  //macros
  `uvm_component_utils(env)
  
  //get handles for sbd and agent
  agnt ag;
  sbd  sb;
  
  //constructor
  function new (string name ="env",uvm_component parent);
    super.new(name,parent);
  endfunction
  
   //build Phase
  virtual function void buil_phase(uvm_phase phase);
    super.build_phase(phase);
    ag = agnt::type_id::create("agnt");
    sb = sbd::type_id::create("sb");
  endfunction
  
  //Connect Phase
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    ag.mon.mon_port.connect(sb.scoreboard_port);
  endfunction
  
  //run Phase
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask
  
endclass