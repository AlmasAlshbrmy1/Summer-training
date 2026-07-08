`timescale 1ns/1ps

module toEvenOdd_tb;

parameter WIDTH = 4;

logic [WIDTH-1:0] n;
logic EvenOdd;
logic [WIDTH-1:0] N;

toEvenOdd #(WIDTH) DUT(
    .n(n),
    .EvenOdd(EvenOdd),
    .N(N)
);

initial begin

      // Even
    EvenOdd = 0;
    n = 4'b0001; #20;
    n = 4'b0010; #20;
    n = 4'b0011; #20;
    n = 4'b0100; #20;

    // Odd
    EvenOdd = 1;
    n = 4'b0001; #20;
    n = 4'b0010; #20;
    n = 4'b0011; #20;
    n = 4'b0100; #20;

    $finish;


end

endmodule