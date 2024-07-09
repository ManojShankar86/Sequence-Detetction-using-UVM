class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
   //get intefaces
   virtual intf vif;
   tx item;
  
  //ports 
  uvm_analysis_port #(item) mon_port;
  
  //constructor
  function new(string name = "monitor",uvm_component parent);
    super.new(name,parent);
    `uvm_info("MONCLASS","Inside constructor",UVM_HIGH);
  endfunction
     
  //Build Phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MONCLASS","Inside Build Phase",UVM_HIGH);
    mon_port = new("mon_port",this);
    
    if(!(uvm_config_db #(virtual intf)::get(this,"*","vif",vif)))
      begin
        `uvm_fatal("MONCLASS","Inside Build Phase not able to get interfaces",UVM_HIGH);
      end
  endfunction
  
  //Connect Phase
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(uvm_phase phase);
    `uvm_info("MONCLASS","Inside Connect Phase",UVM_HIGH);
  endfunction
  
  //Task Run
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("MONCLASS","Inside Run Phase",UVM_HIGH);
    repeat(50)
      begin
        item = tx::type_id::create("item");
        wait(!vif.reset);
        
        //sample inputs
        @(posedge vif.clk);
        item.in = vif.inp;
        
        //sample outputs
        @(posedge vif.clk);
        item.out = vif.op;
        
        //item has to be send to scoreboard
        mon_port.write(item);
      end
  endtask
endclass
    
  
  
  
  
    