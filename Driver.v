class drv extends uvm_driver #(tx);
  `uvm_component_utils(drv)
  
  function new (string name = "drv",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  //get interface to connect to DUT
  virtual intf vif;
  
  //Connect and Configure interfaces to DUT
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual intf)::get(this, "*", "vif",vif)))
       begin
        `uvm_error("DRIVER CLASS","FAILED TO GET VIF from config db")
       end
  endfunction
  
  //Run 
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      tx item;
      `uvm_info("DRV CLASS","Waiting for sequence",UVM_HIGH)
      seq_item_port.get_next_item(item);
      driver_item(item);
      seq_item_port.item_done();
    end
  endtask:run_phase
  
  //task to drive item
  virtual task driver_item(item);
    @(vif.cb);
    vif.cb.inp <= item.in;
  endtask:drive_item
endclass
      
      
      
      
      
     