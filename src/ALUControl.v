`timescale 1ns / 1ps

module ALUControl(
  input[10:0] opCode,
  input[1:0] ALUOp,
  
  output reg[3:0] ALUCnt
    );
   
   always @ (*) begin
    case (ALUOp)
      2'b00:
        ALUCnt = 4'b0010;
      2'b01:
        ALUCnt = 4'b0111;
      2'b10:
        case (opCode)
          11'b10001011000:
            ALUCnt = 4'b0010;
          11'b10001010000:
            ALUCnt = 4'b0110;
          11'b10001010000:
            ALUCnt = 4'b0000;
          11'b10001010000:
            ALUCnt = 4'b0001;
          default:
            ALUCnt = 4'b0000;
        endcase
      default:
        ALUCnt = 4'd0;
    endcase
   end
  
endmodule
