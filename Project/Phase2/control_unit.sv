module control_unit (
    input  logic [7:0] instruction,
    output logic J,
    output logic C,
    output logic D1,
    output logic D0,
    output logic Sreg,
    output logic S,
    output logic [2:0] imm
);

always_comb begin
    J    = instruction[7];
    C    = instruction[6];
    D1   = instruction[5];
    D0   = instruction[4];
    Sreg = instruction[3];
    S    = instruction[2];
 imm  = instruction[2:0];
 end
endmodule