`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:20:09 11/28/2023 
// Design Name: 
// Module Name:    mux32bit2_1 
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
module mux32bit2_1(
	input [63:0]input0, input1,
	input control,
	output [63:0]out
    );
	 
	 assign out = control ? input1 : input0;
	 
	 //always@(input0, input1, control) begin 
			//if (control == 0)
				//out = input0;
			//if (control == 1)
				//out = input1;
	//end
	
		
	 
	 
endmodule
