module toOdd #(parameter WIDTH = 4)
(
    input  logic [WIDTH-1:0] n,
    output logic [WIDTH-1:0] oddN
);

logic [WIDTH-1:0] w;

adder_subtractor #(WIDTH) addsub(
    .A(n),
    .B(1),
    .M(0),
    .S(w)
);

mux2to1 #(WIDTH) mux0(
    .S(~n[0]),
    .W0(n),
    .W1(w),
    .F(oddN)
);

endmodule