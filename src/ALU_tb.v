`timescale 1ns / 1ps

module ALU_tb;

// Inputs
reg [63:0] input_1;
reg [63:0] input_2;
reg [3:0] ALUCnt;

// Outputs
wire zero;
wire [63:0] ALU_result;

// Instantiate the Unit Under Test (UUT)
ALU uut (
    .input_1(input_1), 
    .input_2(input_2), 
    .ALUCnt(ALUCnt), 
    .zero(zero), 
    .ALU_result(ALU_result)
);

initial begin
    // Initialize Inputs
    input_1 = 0;
    input_2 = 0;
    ALUCnt = 0;

    // Add stimulus here
    // Test Addition
    input_1 = 20;
    input_2 = 22;
    ALUCnt = 4'b0010; // Addition operation
    #10;

    // Test Subtraction
    input_1 = 20;
    input_2 = 20;
    ALUCnt = 4'b0110; // Subtraction operation
    #10;

    // Test Bitwise AND
    input_1 = 15; // 0b1111
    input_2 = 9;  // 0b1001
    ALUCnt = 4'b0000; // AND operation
    #10;

    // Test Bitwise OR
    input_1 = 15; // 0b1111
    input_2 = 9;  // 0b1001
    ALUCnt = 4'b0001; // OR operation
    #10;

    // Test Default operation (Pass input_2)
    input_1 = 0;
    input_2 = 123;
    ALUCnt = 4'b0111; // Default operation (pass input_2)
    #10;

    // Complete the test
    $finish;
end

// Monitor changes and display
initial begin
    $monitor("Time = %d ns, Input 1 = %d, Input 2 = %d, ALUCnt = %b, ALU_result = %d, Zero Flag = %b", $time, input_1, input_2, ALUCnt, ALU_result, zero);
end

endmodule

