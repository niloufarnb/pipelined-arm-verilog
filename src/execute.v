`timescale 1ns / 1ps
module execute(
input clk,
input [63:0] ALUReadData1,
input [63:0] ALUReadData2,
input [63:0] PC,
input [63:0] Immediate,
input [10:0] Opcode,
input ALUSrc,
input [1:0]ALUOp,
output zero,
output [63:0] ALUResult,
output [63:0] AddResult
    );

wire [63:0] alu_input2;
wire [3:0] ALUCnt;

assign alu_input2 = ALUSrc == 1 ? Immediate:ALUReadData2;

assign AddResult = PC + (Immediate << 2);

ALUControl instance_name (
    .opCode(Opcode), 
    .ALUOp(ALUOp), 
    .ALUCnt(ALUCnt)
    );

ALU instance_name1 (
    .input_1(ALUReadData1), 
    .input_2(alu_input2), 
    .ALUCnt(ALUCnt), 
    .zero(zero), 
    .ALU_result(ALUResult)
    );

endmodule

