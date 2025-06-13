`timescale 1ns / 1ps
module ARM(clk);
input clk;

wire [63:0] Pc;////
wire [31:0] Instruction;////
wire [63:0] branchTargetOut;////
wire [4:0] writeRegOut2;////

fetch instance_name (
    .clock(clk), //
    .branch_target(branchTargetOut), ///
    .pc_source(pcSource), //
    .next_pc(Pc), ///
    .instruction(Instruction), ///
    .hit(hit)//
    );
	 
wire [31:0] Instruction_out;////
wire [63:0] Pc_out;////

IFID instance_name1 (
    .clk(clk), //
    .pc(Pc), ///
    .inst(Instruction), ///
    .hit(hit), //
    .instOut(Instruction_out), ///
    .pcOut(Pc_out), ///
    .hitOut(hit_out)//1
    );

wire [63:0] WriteData;////
wire [10:0] OpCode;////
wire [63:0] ReadData1;////
wire [63:0] ReadData2;////
wire [63:0] SignExtendedImmediate;////
wire [4:0] DestReg;////

decode decode (
    .clk(clk), //
    .instruction(Instruction_out), ///
    .reg_write(RegWriteOut2),// 
    .write_reg(writeRegOut2), ///
    .write_data(WriteData), ///
    .op_code(OpCode), ///
    .read_data_num_one(ReadData1), ///
    .read_data_num_two(ReadData2), ///
    .sign_extended_imm(SignExtendedImmediate), ///
    .dest_reg(DestReg)///
    );
	 
wire [1:0] aluOpcode;////

ControlUnit controlUnit (
    .opCode(OpCode), ///
    .ALUSrc(aluSource), //
    .MemToReg(memToReg), //
    .RegWrite(RegWrite), //
    .MemRead(memRead), //
    .MemWrite(memWrite), //
    .Branch(branch), //
    .ALUOp(aluOpcode)///
    );
	 
wire [63:0] ReadData1Out;////
wire [63:0] ReadData2Out;//////
wire [63:0] SignExtendImmediateOut;////
wire [1:0] ALUOpOut;////
wire [4:0] WriteRegOut;////
wire [10:0] OpcodeOut;////
wire [63:0] PCOut1;///

IDEX idex (
    .clk(clk), 
    .hit(hit_out), //1
    .ReadData1(ReadData1), ///
    .ReadData2(ReadData2), ///
    .SignExtendImmediate(SignExtendedImmediate), ///
    .ALUSrc(aluSource), //
    .MemtoReg(memToReg), //
    .RegWrite(RegWrite), //
    .MemRead(memRead), //
    .MemWrite(memWrite), //
    .Branch(branch), //
    .ALUOp(aluOpcode), ///
    .WriteReg(DestReg), ///
    .Opcode(OpCode), ///
    .PC(Pc_out), //
    .hitOut(hitOut1), //2
    .ReadData1Out(ReadData1Out), ///
    .ReadData2Out(ReadData2Out), ///
    .SignExtendImmediateOut(SignExtendImmediateOut), ///
    .ALUSrcOut(ALUSrcOut), //
    .MemtoRegOut(MemtoRegOut), //
    .RegWriteOut(RegWriteOut), //
    .MemReadOut(MemReadOut), //
    .MemWriteOut(MemWriteOut), //
    .BranchOut(BranchOut), //
    .ALUOpOut(ALUOpOut), ///
    .WriteRegOut(WriteRegOut), ///
    .OpcodeOut(OpcodeOut), ///
    .PCOut(PCOut1)///
    );
	 
wire [63:0] ALUResult;////
wire [63:0] AddResult;////

execute executee (
    .clk(clk), 
    .ALUReadData1(ReadData1Out), ///
    .ALUReadData2(ReadData2Out), ///
    .PC(PCOut1), ///
    .Immediate(SignExtendImmediateOut), ///
    .Opcode(OpcodeOut), ///
    .ALUSrc(ALUSrcOut), //
    .ALUOp(ALUOpOut), ///
    .zero(zero), //
    .ALUResult(ALUResult), ///
    .AddResult(AddResult)///
    );
	 
wire [63:0] ALUResultOut;//////
wire [63:0] ReadData2Out1;////
wire [4:0] writeRegOut1;////
	 
EXMEM eXMeM (
    .clk(clk), 
    .hit(hitOut1), //2
    .branchTarget(AddResult), ///
    .zeroFlag(zero), //
    .ALUResult(ALUResult), ///
    .readData2(ReadData2Out), ///
    .writeReg(WriteRegOut), ///
    .MemRead(MemReadOut), //
    .MemWrite(MemWriteOut), //
    .Branch(BranchOut), //
    .RegWrite(RegWriteOut), //
    .MemToReg(MemtoRegOut), //
    .branchTargetOut(branchTargetOut), ///
    .zeroFlagOut(zeroFlagOut1), //
    .ALUResultOut(ALUResultOut), ///
    .readData2Out(ReadData2Out1), ///
    .writeRegOut(writeRegOut1), ///
    .MemReadOut(MemReadOut1), //
    .MemWriteOut(MemWriteOut1), //
    .BranchOut(BranchOut1), //
    .RegWriteOut(RegWriteOut1), //
    .MemToRegOut(MemToRegOut1), //
    .hitOut(hitOut2)//3
    );
	 
wire [63:0] readData;////

assign pcSource = (BranchOut1 === 1'bx || zeroFlagOut1 === 1'bx) ? 0 : BranchOut1 & zeroFlagOut1;


DataMemory dataMemory (
    .clk(clk), 
    .address(ALUResultOut), ///
    .writeData(ReadData2Out1), ///
    .MemRead(MemReadOut1), //
    .MemWrite(MemWriteOut1), //
    .readData(readData)///
    );

wire [63:0]readDataOut;////
wire [63:0]ALUResultOut1;////



MEMWB mEmWB (
    .clk(clk), 
    .hit(hitOut2), //3
    .readData(readData), ///
    .ALUResult(ALUResultOut), ///
    .writeReg(writeRegOut1), ///
    .RegWrite(RegWriteOut1),//
    .MemtoReg(MemToRegOut1), //
    .hitOut(hitOut3), //4
    .readDataOut(readDataOut), ///
    .ALUResultOut(ALUResultOut1), ///
    .writeRegOut(writeRegOut2), ///
    .RegWriteOut(RegWriteOut2), //
    .MemtoRegOut(MemtoRegOut2)//
    );

	 
WriteBack writeback (
    .MemtoReg(MemtoRegOut2), //
    .readData(readDataOut), ///
    .ALUResult(ALUResultOut1), ///
    .writeData(WriteData)///
    );
	


endmodule
