`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:15:06 12/06/2023
// Design Name:   fetch
// Module Name:   E:/university/term5/CA lab/mips/fetch_first_tb.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

      
module fetch_first_tb; 
 
 // Inputs 
 reg [63:0] BranchTarget; 
 reg PCSource; 
 reg Clock; 
 
 // Outputs 
 wire [63:0] NextPC; 
 wire [31:0] Instruction; 
 wire Hit; 
  
 // Variables 
 integer cycleNo; 
 
 // Instantiate the Unit Under Test (UUT) 
 fetch uut ( 
  .branch_target(BranchTarget),  
  .pc_source(PCSource),  
  .clock(Clock),  
  .next_pc(NextPC),  
  .instruction(Instruction),  
  .hit(Hit) 
 ); 
 
 initial begin 
  // Initialize Inputs 
   BranchTarget = 0; 
  PCSource = 0; 
  Clock = 0; 
  cycleNo = 0; 
 
  // Wait 100 ns for global reset to finish 
  #100; 
 
 end 
  
 //Clock logic 
 always #50 Clock = ~Clock; 
  
 //entire simulation time 
 initial #2000 $finish; 
  
 always @(posedge Clock) begin   
   cycleNo = cycleNo+1; 
 end 
 
       
endmodule 
 