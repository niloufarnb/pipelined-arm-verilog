`timescale 1ns / 1ps

module Control_unit_tb;

	// Inputs
	reg [10:0] opCode;

	// Outputs
	wire ALUSrc;
	wire MemToReg;
	wire RegWrite;
	wire MemRead;
	wire MemWrite;
	wire Branch;
	wire [1:0] ALUOp;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.opCode(opCode), 
		.ALUSrc(ALUSrc), 
		.MemToReg(MemToReg), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.ALUOp(ALUOp)
	);
	integer i;
	initial begin
		for (i = 0; i < 5; i = i + 1)begin
			case(i)
				0:opCode = 11'b11111000010;
				1:opCode = 11'b11111000000;
				2:opCode = 11'b10110100111;
				3:opCode = 11'b11111001110;
			endcase
			$display(ALUSrc);
			$display(MemToReg);
			$display(RegWrite);
			$display(MemRead);
			$display(MemWrite);
			$display(Branch);
			$display(ALUOp);
			#10;

	end
      
		end
endmodule
