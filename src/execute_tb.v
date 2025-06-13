`timescale 1ns / 1ps

module execute_tb;

	// Inputs
	reg [63:0] ALUReadData1;
	reg [63:0] ALUReadData2;
	reg [63:0] Immediate;
	reg [10:0] Opcode;
	reg [1:0] ALUOp;
	reg ALUSrc;
	reg [63:0] PC;


	// Outputs
	wire [63:0] ALUResult;
	wire [63:0] AddResult;
	wire Zero;

	// Instantiate the Unit Under Test (UUT)
	execute uut (
		.clk(1'b0), 
		.ALUReadData1(ALUReadData1), 
		.ALUReadData2(ALUReadData2), 
		.PC(PC), 
		.Immediate(Immediate), 
		.Opcode(Opcode), 
		.ALUSrc(ALUSrc), 
		.ALUOp(ALUOp), 
		.zero(Zero), 
		.ALUResult(ALUResult), 
		.AddResult(AddResult)
	);

	initial begin
		// Initialize Inputs
		ALUOp = 2'b00; //load and store instruction: ADD
		Opcode = 11'b000_0000_0000;
		ALUReadData1 = 2;
		ALUReadData2 = 3;
		Immediate = 1;
		PC = 16;
		ALUSrc = 1; 	// Immediate
		

		#100;
		// Update Inputs
		ALUOp = 2'b01; //cbz: pass input 2
		Opcode = 11'b000_0000_0000;
		ALUReadData1 = 2;
		ALUReadData2 = 3;
		Immediate = 1;
		ALUSrc = 0; 	// ALUReadData2
		
		#100;
		// Update Inputs
		ALUOp = 2'b10; //r-type
		Opcode = 11'b100_0101_1000;//add
		ALUReadData1 = 2;
		ALUReadData2 = 3;
		Immediate = 1;
		ALUSrc = 0; 	// ALUReadData2
		
		#100;
	end

	
	
	//entire simulation time
	initial #300 $finish;
	
endmodule
