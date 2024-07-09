class test extends uvm_test;
  //macro
  `uvm_component_utils(test)
  
  //get hanldes
  env en;
  tx item;
  
  //constructor
  function new (string name = "test", uvm_component parent);
    super.build(name,parent);
  endfunction
  
  //build Phase
  virtual function void buil_phase(uvm_phase phase);
    super.build_phase(phase);
    en = env::type_id::create("en",this);
  endfunction
  
  //Connect Phase
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction
  
  //run Phase
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    phase.raise_objection(this);
    repeat(50) begin
    item = tx::type_id::create("item");
    item.start(en.ag.sr);
    
    #10;
    end
    phase.drop_objection(this);
  endtask
endclass

    
  