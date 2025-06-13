`timescale 1ns / 1ps
module ALU(
input [63:0] input_1,
input [63:0] input_2, 
input [3:0] ALUCnt,
output zero,
output [63:0] ALU_result
    );
assign ALU_result = ALUCnt == 4'b0010 ? (input_1 + input_2):
						  ALUCnt == 4'b0110 ? (input_1 - input_2):
						  ALUCnt == 4'b0000 ? (input_1 & input_2):
						  ALUCnt == 4'b0001 ? (input_1 | input_2):
						  ALUCnt == 4'b0111 ?  input_2 : ALU_result;
assign zero = ALU_result == 0 ? 1'b1 : 1'b0;
endmodule