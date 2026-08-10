module mux #(
    parameter WIDTH = 4
)(
    input  logic [WIDTH-1:0] W0,
    input  logic [WIDTH-1:0] W1,
    input  logic             Sel,

    output logic [WIDTH-1:0] F
);

assign F = Sel? W1 : W0;

endmodule