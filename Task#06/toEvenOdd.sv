module toEvenOdd #(parameter WIDTH = 4)
(
    input  logic [WIDTH-1:0] n,
    input  logic EvenOdd,
    output logic [WIDTH-1:0] N
);

logic [WIDTH-1:0] evenOut;
logic [WIDTH-1:0] oddOut;

toEven #(WIDTH) even0(
    .n(n),
    .evenN(evenOut)
);

toOdd #(WIDTH) odd0(
    .n(n),
    .oddN(oddOut)
);

mux2to1 #(WIDTH) mux0(
    .S(EvenOdd),
    .W0(evenOut),
    .W1(oddOut),
    .F(N)
);

endmodule