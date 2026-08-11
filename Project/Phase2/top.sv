
module top #(
    parameter WIDTH = 4,
    parameter IMEM_DEPTH = 16,
    parameter FILE_NAME =  "C:\\Users\\alfra\\Downloads\\machine_code.mem",
        parameter DMEM_FILE = "C:\\Users\\alfra\\Downloads\\data.mem"

)(
    input  logic clk,
    input  logic rstn,
    output logic [WIDTH-1:0] RO,
    output logic Carry
);

    // Internal signals
    logic [7:0] instruction;

    logic J;
    logic C;
    logic D1;
    logic D0;
    logic Sreg;
    logic S;
logic [2:0] imm; 
    // Datapath
 datapath #(
        .WIDTH(WIDTH),
        .IMEM_DEPTH(IMEM_DEPTH),
        .IMEM_FILE(FILE_NAME),
        .DMEM_FILE(DMEM_FILE)
    ) DP (
        .clk(clk),
        .rstn(rstn),
        .J(J),
        .C(C),
        .D1(D1),
        .D0(D0),
        .Sreg(Sreg),
        .S(S),
        .instruction(instruction),
        .RO(RO),
        .Carry(Carry),
         .imm(imm)
    );

    // Control Unit
    control_unit CU (
        .instruction(instruction),
        .J(J),
        .C(C),
        .D1(D1),
        .D0(D0),
        .Sreg(Sreg),
        .S(S),
         .imm(imm)
    );

endmodule
