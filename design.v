// Code your design here
//To Test 1011 sequence

module sequ(clk,rst,inp,op);
  input bit clk,rst;
  input logic inp;
  output logic op;
  
  parameter IDLE=0,S1=1,S10=2,S101=3,S1011=4;
  reg [3:0] curr_state,next_state;
  
  assign op = (curr_state == next_state)?1:0;
  
  always @(posedge clk) begin
    if(!rst) begin
      curr_state <= IDLE;
    end else begin
      curr_state <= next_state;
    end
  end
  
  always @(curr_state or inp) begin
    case(curr_state) 
      IDLE:begin
        if(in)
          next_state = S1;
        else
          next_state =IDLE;
      end
      
      S1:begin
        if(in)
          next_state = S1;
        else
          next_state = S10;
      end
      
      S10:begin
        if(in)
          next_state = S101;
        else
          next_state = IDLE;
      end
      
      S101:begin
        if(in)
          next_state = S1011;
        else
          next_state = IDLE;
      end
      
      S1011:begin
        if(in)
          next_state = S1;
        else
          next_state = S10;
      end
    endcase
  end
endmodule
  
  