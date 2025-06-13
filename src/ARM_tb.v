`timescale 1ns / 1ps

module ARM_tb;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	ARM uut (
		.clk(clk)
	);
	
	always begin
    #5 clk = ~clk; // Toggle clock every 5 time units
	end

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule