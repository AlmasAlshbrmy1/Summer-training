module top #(parameter N = 10)(
    input logic clk,
    input logic rstn,

    output logic F
);

logic [$clog2(N)-1:0] w;

counter #($clog2(N)) count(
    .clk(clk),
    .rstn(rstn & (~(w == N))),
    .en(1),
    .l(0),
    .D(),
    .Q(w)
);

my_dff ff0(
    .clk(clk),
    .rstn(rstn),
    .en(w == N-1),
    .D(~F),
    .Q(F)
);

endmodule