class seq extends uvm_sequence;
  `uvm_object_utils(seq)
  
  //get seq item handle
  tx item;
  
  //constructor
  function new(string name ="seq");
    super.new(name);
  endfunction
  
  //config the total no of items that has to be sent
  rand int num;
  
  //constraint for the no of items that will be sent
  constraint c2{soft num inside [10:50];}
  
  //Body Task
  virtual task body();
    for(int i = 0; i < num; i = i + 1)begin
      item = tx::type_id::create("item");
      start_item(item);
      item.randomize();
      `uvm_info("SEQ",$sformatf("Generate new item: %s",item.convert2str()),UVM_HIGH)
      finish_item(item);
    end
    `uvm_info("SEQ""'Done Generating Item",UVM_LOW)
  endtask
endclass
              
  
    