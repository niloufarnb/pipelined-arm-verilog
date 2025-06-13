`timescale 1ns / 1ps

module ControlUnit(
  input[10:0] opCode,

  output reg ALUSrc,
  output reg MemToReg,
  output reg RegWrite,
  output reg MemRead,
  output reg MemWrite,
  output reg Branch, 
  output reg[1:0] ALUOp
    );
   
   always @ (opCode) begin
    case (opCode)
      11'b11111000010: begin
        ALUSrc = 1;
        MemToReg = 1;
        RegWrite = 1;
        MemRead = 1;
        MemWrite = 0;
        Branch = 0;
        ALUOp = 2'b00;
      end
      11'b11111000000: begin
        ALUSrc = 1;
        MemToReg = 1;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 1;
        Branch = 0;
        ALUOp = 2'b00;
      end
      11'b10110100xxx: begin
        ALUSrc = 0;
        MemToReg = 0;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 1;
        ALUOp = 2'b01;
      end
      default: begin
        ALUSrc = 0;
        MemToReg = 0;
        RegWrite = 1;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        ALUOp = 2'b10;
      end
    endcase
  end
endmodule
