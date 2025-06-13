`timescale 1ns / 1ps

module IFID(
  input clk,
  input[63:0] pc,
  input[31:0] inst,
  input hit,
  
  output reg[63:0] pcOut,
  output reg[31:0] instOut,
  output reg hitOut
    );
   
   always @ (negedge clk) begin
    if (hit) begin
      pcOut = pc;
      instOut = inst;
      hitOut = hit;
    end
   end


endmodule

