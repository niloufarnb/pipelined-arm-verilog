`timescale 1ns / 1ps
module IDEX(
input clk,
input hit,
input [63:0] ReadData1,
input [63:0] ReadData2,
input [63:0] SignExtendImmediate,
input ALUSrc,
input MemtoReg,
input RegWrite,
input MemRead,
input MemWrite,
input Branch,
input [1:0] ALUOp,
input [4:0] WriteReg,
input [10:0] Opcode,
input [63:0] PC,

output hitOut,
output reg [63:0] ReadData1Out,
output reg [63:0] ReadData2Out,
output reg [63:0] SignExtendImmediateOut,
output reg ALUSrcOut,
output reg MemtoRegOut,
output reg RegWriteOut,
output reg MemReadOut,
output reg MemWriteOut,
output reg BranchOut,
output reg [1:0] ALUOpOut,
output reg [4:0] WriteRegOut,
output reg [10:0] OpcodeOut,
output reg [63:0] PCOut
    );
assign hitOut = hit;
always @ (negedge clk) begin
	if(hit == 1)begin
		ReadData1Out = ReadData1;
		ReadData2Out = ReadData2;
		SignExtendImmediateOut = SignExtendImmediate;
		ALUSrcOut = ALUSrc;
		MemtoRegOut = MemtoReg;
		RegWriteOut = RegWrite;
		MemReadOut = MemRead;
		MemWriteOut = MemWrite;
		BranchOut = Branch;
		ALUOpOut = ALUOp;
		WriteRegOut = WriteReg;
		OpcodeOut = Opcode;
		PCOut = PC;
	end	
end
endmodule

