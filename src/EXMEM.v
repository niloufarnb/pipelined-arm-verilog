`timescale 1ns / 1ps

module EXMEM(clk, hit, branchTarget, zeroFlag, ALUResult, readData2, writeReg, MemRead,
							  MemWrite, Branch, RegWrite, MemToReg , branchTargetOut, zeroFlagOut, ALUResultOut, 
							  readData2Out, writeRegOut, MemReadOut, MemWriteOut, BranchOut, RegWriteOut,
							  MemToRegOut, hitOut);

	input clk;
	input hit;
	input zeroFlag;
	input MemRead;
	input MemWrite;
	input Branch;
	input RegWrite;
	input MemToReg;
	input [63:0] branchTarget;
	input [63:0] ALUResult;
	input [63:0] readData2;
	input [4:0]  writeReg;
	

	output reg zeroFlagOut;
	output reg MemReadOut;
	output reg MemWriteOut;
	output reg BranchOut;
	output reg RegWriteOut;
	output reg MemToRegOut;
	output reg [63:0] branchTargetOut;
	output reg [63:0] ALUResultOut;
	output reg [63:0] readData2Out;
	output reg [4:0] writeRegOut;
	output hitOut;
	
	assign hitOut = hit;

	always @(negedge clk) 
		begin 
		if(hit == 1)begin
				  writeRegOut    <= writeReg;
				  branchTargetOut<= branchTarget;
				  ALUResultOut   <= ALUResult;
				  readData2Out <= readData2;
				  zeroFlagOut    <= zeroFlag;
				  MemReadOut     <= MemRead;
				  MemWriteOut    <= MemWrite;
				  BranchOut      <= Branch;
				  RegWriteOut    <= RegWrite;
				  MemToRegOut    <= MemToReg;
		end

		end

endmodule
