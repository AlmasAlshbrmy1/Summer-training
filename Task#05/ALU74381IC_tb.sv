`timescale 1ns/1ps

module ALU74381IC_tb;

logic [3:0] A, B;
logic [2:0] S;
logic [3:0] F;

ALU74381IC dut (
    .A(A),
    .B(B),
    .S(S),
    .F(F)
);

initial begin
    A = 4'b0101;   // 5
    B = 4'b0011;   // 3
    S = 3'b000;
    #10;
    S = 3'b001;
    #10;

    S = 3'b010;
    #10;
    S = 3'b011;
    #10;
    S = 3'b100;
    #10;
    S = 3'b101;
    #10;
    S = 3'b110;
    #10;
    S = 3'b111;
    #10;

    $finish;

end

endmodule