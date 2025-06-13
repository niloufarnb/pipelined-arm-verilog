`timescale 1ns / 1ps
module MEMWB(
input clk,
input hit,
input [63:0]readData,
input [63:0]ALUResult,
input [4:0]writeReg,
input RegWrite,
input MemtoReg,

output hitOut,
output reg [63:0]readDataOut,
output reg [63:0]ALUResultOut,
output reg [4:0]writeRegOut,
output reg RegWriteOut,
output reg MemtoRegOut
    );

assign hitOut = hit;
always @ (negedge clk) begin
	if(hit == 1)begin
		readDataOut = readData;
		ALUResultOut = ALUResult;
		writeRegOut = writeReg;
		RegWriteOut = RegWrite;
		MemtoRegOut = MemtoReg;
	end
end


endmodule
