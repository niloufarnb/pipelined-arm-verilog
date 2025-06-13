`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:57:42 12/05/2023 
// Design Name: 
// Module Name:    cache 
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
module cache(
	input [63:0] address, 
   input [127:0] data_line, 
   input clock, 
   output reg [31:0] instruction, 
   output reg hit 
   ); 
	
   integer i = 0 ; 
	integer index = 0;
   integer counter = 0; 
   reg [185:0] cache[7:0]; 
  
   initial begin 
		hit = 0; 
		for(i = 0 ; i < 8 ; i = i+1) 
			cache[i] = 0; 
	end 
	
	always@(data_line) begin
		index = address[6:4];
		cache[index] = {1'b1, address[63:7], data_line[127:0]};
		end
	
   always@(posedge clock) begin 
    if(cache[address[6:4]][164:128] == address[63:7] && cache[address[6:4]][185] == 1) begin 
       hit = 1 ; 
       if(address[3:2] == 2'b00) 
       instruction = cache[address[6:4]][31:0]; 
       if(address[3:2] == 2'b01) 
       instruction = cache[address[6:4]][63:32]; 
       if(address[3:2] == 2'b10) 
       instruction = cache[address[6:4]][95:64]; 
       if(address[3:2] == 2'b11) 
       instruction = cache[address[6:4]][127:96]; 
    end 
    else begin 
      hit = 0;  
    end 
  end
	 
endmodule
