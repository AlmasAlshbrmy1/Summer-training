module ALU74381IC(
    input  logic [3:0] A,
    input  logic [3:0] B,
    input  logic [2:0] S,
    output logic [3:0] F
);

always_comb begin
    case (S)

        3'b000: F = 4'b0000;        3'b001: F = B - A;  

        3'b010: F = A - B;   // A - B

        3'b011: F = A + B;   // Addition

        3'b100: F = A ^ B;   // XOR

        3'b101: F = A | B;   // OR

        3'b110: F = A & B;   // AND

        3'b111: F = 4'b1111; // Preset

        default: F = 4'b0000;

    endcase
end

endmodule