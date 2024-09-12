// Sequence Detector Overlapping
// Mealy State Machine
// 1 Process Metholdology
// 1Process -> Mealy
// 2Process/3Process -> Moore
// Detecting the sequence '111'

`timescale 1ns / 1ps

module seq_dectector_overlap(
    input clk, rst, din,
    output reg dout
    );
    
// State definitions
parameter IDLE = 2'b00;
parameter S0   = 2'b01;
parameter S1   = 2'b10;
parameter S2   = 2'b11; 

reg [1:0] cur_state = IDLE;  // Current state variable

always@(posedge clk)
begin
  if(rst)
  begin
    dout <= 1'b0;
    cur_state <= IDLE;
  end
  else 
  begin
    case(cur_state)
      IDLE: 
      begin
        dout <= 1'b0;
        cur_state <= S0;
      end
      
      S0: 
      begin
        dout <= 1'b0;
        if (din)
          cur_state <= S1;
      end

      S1: 
      begin
        dout <= 1'b0;
        if (din)
          cur_state <= S2;
        else
          cur_state <= S0;
      end

      S2: 
      begin
        if (din)
        begin
          dout <= 1'b1;
          cur_state <= S2;
        end
        else
        begin
          dout <= 1'b0;
          cur_state <= S0;
        end
      end

      default: 
      begin
        dout <= 1'b0;
        cur_state <= IDLE;
      end
    endcase
  end
end
endmodule
