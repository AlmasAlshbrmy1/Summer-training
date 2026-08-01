module datapath #(
    parameter
        IMEM_DEPTH = 16,
        PROG_VALUE = 16,
        REGF_WIDTH = 4,
        ALU_WIDTH = 4,
        FILE_NAME = "C:\\Users\\almas\\Desktop\\test\\Almas\\day17\\task#14\\machine_code.mem"
)(
    input logic clk,
    input logic rstn,

    input logic [1:0] rs1,
    input logic [1:0] rs2,
    input logic [1:0] rd,
    input logic [1:0] opcode,

    output logic [7:0] instruction
);

logic [$clog2(IMEM_DEPTH)-1:0] address;
logic [ALU_WIDTH-1:0] op1;
logic [ALU_WIDTH-1:0] op2;
logic [ALU_WIDTH-1:0] alu_result;

program_counter #(
    .PROG_VALUE(PROG_VALUE)
) pc_ins (
    .clk(clk),
    .rstn(rstn),
    .counter(address)
);

instruction_memory #(
    .IMEM_DEPTH(IMEM_DEPTH),
    .FILE_NAME(FILE_NAME)
) rom_ins (
    .address(address),
    .instruction(instruction)
);

register_file #(
    .REGF_WIDTH(REGF_WIDTH)
) rf_ins (
    .clk(clk),
    .rstn(rstn),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),
    .alu_result(alu_result),
    .op1(op1),
    .op2(op2)
);

alu #(
    .ALU_WIDTH(ALU_WIDTH)
) alu_ins (
    .op1(op1),
    .op2(op2),
    .opcode(opcode),
    .alu_result(alu_result)
);

endmodule