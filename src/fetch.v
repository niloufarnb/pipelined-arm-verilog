`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:40:34 12/05/2023 
// Design Name: 
// Module Name:    fetch 
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
module fetch(
	input clock,
	input [63:0] branch_target,
	input pc_source,
	output [63:0] next_pc,
	output [31:0] instruction,
	output hit
    );
	 
	 wire [127:0] data_line;
	 wire [63:0] address;
	 wire [63:0] next_address;
	 wire [63:0] nextPc;
	 
	 assign next_pc = nextPc;
	 assign nextPc = address + 4;
	 
	 mux64bit2 mux (
    .input0(nextPc), 
    .input1(branch_target), 
    .control(pc_source), 
    .out(next_address)
    );

	 
	 pc pc_reg (
    .clock(clock), 
    .hit(hit), 
    .PCin(next_address), 
    .PCout(address)
    );
	 
	 instruction_mem ins_mem (
    .address(address), 
    .clock(clock), 
    .DataLine(data_line)
    );
	 
	 cache cache(
    .address(address), 
    .data_line(data_line), 
    .clock(clock), 
    .instruction(instruction), 
    .hit(hit)
    );


endmodule
