class sbd extends uvm_scoreboard;
  `uvm_component_utils(sbd)
  
  //constructor
  function new(string name = "sbd", uvm_component parent=null);
    super.new(name,parent);
  endfunction
  
  //instantiate handles for seq item and scoreboard
  tx item;
  
  //have references
  bit [7:0] act_pattern;
  bit [7:0] ref_pattern;
  bit exp_out;
  
  //port def
  uvm_analysis_imp #(item,sbd) m_analysis_imp;
  
  //build Phase
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_analysis_imp = new("m_analysis_imp",this);
    if(!uvm_config_db #(bit [7:0] )::get(this,"*","ref_pattern",ref_pattern))
      begin
        `uvm_fatal("SBD","Did not ref pattern")
      end
  endfunction
  
  //function to write and check with scoreboard
  virtual function void write(item);
    act_pattern = act_pattern << 1 | item.in;
    if(item.out != exp_out)begin
      `uvm_error("SBD","ERROR PATTERNS DO NOT MATCH",UVM_HIGH)
    end else begin
      `uvm_info("SBD","ERROR PATTERNS MATCH",UVM_HIGH)
    end
    
    if(!(ref_pattern ^ act_pattern)) begin
      `uvm_info("SBD","Pattern match",UVM_LOW)
      exp_out = 1;
    end else begin
      exp = 0;
    end
  endfunction
endclass
      