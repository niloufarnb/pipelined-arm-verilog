`timescale 1ns / 1ps

module decode_tb;

	// Inputs
	reg clk;
	reg [31:0] instruction;
	reg reg_write;
	reg [4:0] write_reg;
	reg [63:0] write_data;

	// Outputs
	wire [10:0] op_code;
	wire [63:0] read_data_num_one;
	wire [63:0] read_data_num_two;
	wire [63:0] sign_extended_imm;
	wire [4:0] dest_reg;
	integer cycleNo;

	// Instantiate the Unit Under Test (UUT)
	decode uut (
		.clk(clk), 
		.instruction(instruction), 
		.reg_write(reg_write), 
		.write_reg(write_reg), 
		.write_data(write_data), 
		.op_code(op_code), 
		.read_data_num_one(read_data_num_one), 
		.read_data_num_two(read_data_num_two), 
		.sign_extended_imm(sign_extended_imm), 
		.dest_reg(dest_reg)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		instruction = 1;
		reg_write = 1;
		write_reg = 1;
		write_data = 32;
		

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//WriteReg = 1;
		//clockPulse = 0;
		//WriteData = 32;
		//RegWrite = 1;
		//instruction = 1;
		cycleNo = 0;
	end
		//clock logic
	always #50 clk = ~clk;
	
	//entire simulation time
	initial #500 $finish;
	
	always @(posedge clk) begin	 
		cycleNo = cycleNo + 1;
		if (cycleNo == 2) begin write_data =64; write_reg = 2; end
		else if (cycleNo == 3) begin write_reg = 31;end
		else if (cycleNo == 4) begin reg_write = 0; write_reg = 2; write_data =32; instruction = 2228224; end	 
	end  
      
endmodule


