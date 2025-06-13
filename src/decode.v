`timescale 1ns / 1ps

module decode(
	input clk,
	input [31:0] instruction,
	input reg_write,
	input [4:0] write_reg,
	input [63:0] write_data,
	output reg[10:0] op_code,
	output reg [63:0] read_data_num_one,
	output reg [63:0] read_data_num_two,
	output reg [63:0] sign_extended_imm,
	output reg[4:0] dest_reg
    );
	 
	  initial begin
		op_code = 0;
		read_data_num_one = 0;
		read_data_num_two =0;
		sign_extended_imm = 0;
		dest_reg = 0;
	 end
	 
	reg [4:0] read_register_two;
	
	always @(*) begin 
		if(instruction[28] == 1)
			read_register_two = instruction[4:0];
		else 
			read_register_two = instruction[20:16];
	end
	
	Register_file reg_file(
    .clk(clk), 
    .write_signal(reg_write), 
    .read_register_num_one(instruction[9:5]), 
    .read_register_num_two(instruction[4:0]), 
    .write_reg(write_reg), 
    .write_data(write_data), 
    .read_data_num_one(read_data_num_one), 
    .read_data_num_two(read_data_num_two)
    );
	 
	 wire [63:0] sign_extended_val_two;
	 
	 sign_extend SE (
    .val(instruction), 
    .sign_extended_val(sign_extended_val_two)
    );
	 
	 always@(instruction)begin
	  op_code = instruction[31:21];
	 dest_reg = instruction[4:0];
	end



endmodule
