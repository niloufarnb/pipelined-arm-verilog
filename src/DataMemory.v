`timescale 1ns / 1ps
module DataMemory(
input clk,
input [63:0] address,
input [63:0] writeData,
input MemRead,
input MemWrite,
output reg [63:0] readData
);

reg [7:0] memory [1023:0];

integer i;
	initial begin
	 for(i = 0; i <= 1023; i = i+1)
	 begin memory[i] = i % 64; end
	end

always @ (*) begin
	if(MemRead == 1) begin
		readData = {memory[address+7],
						memory[address+6],
						memory[address+5],
						memory[address+4],
						memory[address+3],
						memory[address+2],
						memory[address+1],
						memory[address]};
	end
end
always @ (posedge clk) begin
	if(MemWrite == 1) begin
		memory[address] = writeData[7:0];
		memory[address+1] = writeData[15:8];
		memory[address+2] = writeData[23:16];
		memory[address+3] = writeData[31:24];
		memory[address+4] = writeData[39:32];
		memory[address+5] = writeData[47:40];
		memory[address+6] = writeData[55:48];
		memory[address+7] = writeData[63:56];
	end
end


endmodule
