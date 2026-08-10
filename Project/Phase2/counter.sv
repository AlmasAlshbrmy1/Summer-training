module counter #(
    parameter WIDTH = 4
)(
    input  logic clk,
    input  logic rstn,
    input  logic load,
    input  logic [WIDTH-1:0] D,

    output logic [WIDTH-1:0] Q
);

always_ff @(posedge clk or negedge rstn) begin
    if (!rstn)
        Q <= 0;
    else if (load)
        Q <= D;
    else
        Q <= Q + 1'b1;
end

endmodule