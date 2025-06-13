`timescale 1ns / 1ps

module IFID_tb;

	// Inputs
	reg clk;
	reg [63:0] pc;
	reg [31:0] inst;
	reg hit;

	// Outputs
	wire [63:0] pcOut;
	wire [31:0] instOut;
	wire hitOut;

	// Instantiate the Unit Under Test (UUT)
	IFID uut (
		.clk(clk), 
		.pc(pc), 
		.inst(inst), 
		.hit(hit), 
		.pcOut(pcOut), 
		.instOut(instOut), 
		.hitOut(hitOut)
	);

	initial begin
	        // Initialize Inputs
        clk = 0;
        pc = 64'h0000_0000_0000_0000;
        inst = 32'h0000_1234;
        hit = 1;

        // Wait 100 ns for global reset to finish
        #100;

        // Test 1: Check if PC and Instruction pass through
        $display("Test 1: Check if PC and Instruction pass through");
        #100;
        if (pcOut === pc && instOut === inst)
            $display("Test 1 Passed");
        else
            $display("Test 1 Failed");

        // Test 2: Check if Hit passes through
        $display("Test 2: Check if Hit passes through");
        #100;
        if (hitOut === hit)
            $display("Test 2 Passed");
        else
            $display("Test 2 Failed");

        // Test 3: Check if PC and Instruction change after inputs change
        $display("Test 3: Check if PC and Instruction change after inputs change");
        pc = 64'h1111_1111_1111_1111;
        inst = 32'h8765_4321;
        #100;
        if (pcOut === pc && instOut === inst)
            $display("Test 3 Passed");
        else
            $display("Test 3 Failed");

        // Add more tests as needed

        // Finish simulation
        $stop;
    end

    always #50 clk = ~clk;
      
endmodule


