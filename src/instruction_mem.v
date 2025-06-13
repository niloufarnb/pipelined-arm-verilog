`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:43:58 11/28/2023 
// Design Name: 
// Module Name:    instruction_mem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module instruction_mem(
	input [63:0] address,
   input clock,
   output  [127:0] DataLine
    );
	 
	 reg [127:0] DataLineR;
	 
	 integer i;
	 initial begin
		for (i = 0; i < 1024; i = i + 1)begin
			memory[i] = i;
		end
	 end
	 
	 reg [7:0] memory [1023:0];
	 integer counter = 0;
	 reg [63:0] index;
	 reg [63:0] address_group;
	 assign DataLine = DataLineR;
	 
	 always @(posedge clock) begin 
		  if (counter == 0) begin
				counter = counter + 1;
				address_group = address;
				index = {address_group[63:4], {4'b0000}};
			end
			
        else if (address_group != address) begin 
				counter = 0;
            address_group = address;
				index = {address_group[63:4], {4'b0000}};
        end 
		  
        else if (counter == 4) begin 
				counter = 0;
				DataLineR = {
						memory[index + 15],
						memory[index + 14],
						memory[index + 13],
						memory[index + 12],
						memory[index + 11],
						memory[index + 10],
						memory[index + 9],
						memory[index + 8],
						memory[index + 7],
						memory[index + 6],
						memory[index + 5],
						memory[index + 4],
						memory[index + 3],
						memory[index + 2],
						memory[index + 1],
						memory[index]
					};
				end
				
				else begin
					counter = counter + 1;
			
				end

    end 
	 
endmodule
