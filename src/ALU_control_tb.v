`timescale 1ns / 1ps

module ALU_control_tb;

	// Inputs
	reg [10:0] opCode;
	reg [1:0] ALUOp;

	// Outputs
	wire [3:0] ALUCnt;

	// Instantiate the Unit Under Test (UUT)
	ALUControl uut (
		.opCode(opCode), 
		.ALUOp(ALUOp), 
		.ALUCnt(ALUCnt)
	);

	initial begin
		// Initialize Inputs
		opCode = 0;
		ALUOp = 0;

		#100;
		
		ALUOp = 2'b00;
		opCode = 11'b11010101011;

		#100;
		
		ALUOp = 2'b01;
		opCode = 11'b10101001101;

		#100;
		
		ALUOp = 2'b10;
		opCode = 11'b10001011000;

		#100;
		
		opCode = 11'b11001011000;

		#100;
		opCode = 11'b10001010000;

		#100;
		opCode = 11'b10101010000;

		#100;

	end
      
endmodule

