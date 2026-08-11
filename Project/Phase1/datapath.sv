module datapath #(
    parameter WIDTH = 4,
    parameter IMEM_DEPTH = 16,
    parameter FILE_NAME = "C:\\Users\\alfra\\Downloads\\machine_code.mem"
)(
    input  logic clk,
    input  logic rstn,
input  logic J,
input  logic C,
input  logic D1,
input  logic D0,
input  logic Sreg,
input  logic S,

// Immediate value
  input  logic [2:0] imm,
// Outputs
output logic [7:0] instruction,
output logic [WIDTH-1:0] RO ,
output logic Carry
);
// Program Counter output (Address)
logic [WIDTH-1:0] Q;
// Decoder outputs
logic en_RA;
logic en_RB;
logic en_RO;
// Register outputs
logic [WIDTH-1:0] RA_out;
logic [WIDTH-1:0] RB_out;
// MUX output
logic [WIDTH-1:0] MUX_out;
// ALU outputs
logic [WIDTH-1:0] ALU_out;
logic carry_wire;
PC #(
    .WIDTH(WIDTH)
) PC (
    .clk(clk),
    .rstn(rstn),
    .load(J | (C & Carry)),
    .D({1'b0, imm}),         
    .Q(Q)
);
instruction_memory #(
    .IMEM_DEPTH(IMEM_DEPTH),
    .FILE_NAME(FILE_NAME)
) IM (
    .address(Q),
    .instruction(instruction)
);
Decoder DEC (
    .D1(D1),
    .D0(D0),
    .y0(en_RA),
    .y1(en_RB),
    .y2(en_RO),
    .y3()
);
file_registers #(
    .WIDTH(WIDTH)
) RA_reg (
    .clk(clk),
    .rstn(rstn),
    .en(en_RA),
    .data_in(MUX_out),
    .data_out(RA_out)
);
file_registers #(
    .WIDTH(WIDTH)
) RB_reg (
    .clk(clk),
    .rstn(rstn),
    .en(en_RB),
    .data_in(MUX_out),
    .data_out(RB_out)
);
file_registers #(
    .WIDTH(WIDTH)
) RO_reg (
    .clk(clk),
    .rstn(rstn),
    .en(en_RO),
    .data_in(RA_out),
    .data_out(RO)
);
Alu #(
    .WIDTH(WIDTH)
) ALU (
    .A(RA_out),
    .B(RB_out),
    .S(S),
    .F(ALU_out),
    .carry(carry_wire)
);
mux #(
    .WIDTH(WIDTH)
) MUX1 (
    .W0(ALU_out),
    .W1({1'b0, imm}),          
    .Sel(Sreg),
    .F(MUX_out)
);
file_registers #(
    .WIDTH(1)
) dff1 (
    .clk(clk),
    .rstn(rstn),
    .en(1'b1),
    .data_in(carry_wire),
    .data_out(Carry)
);
endmodule