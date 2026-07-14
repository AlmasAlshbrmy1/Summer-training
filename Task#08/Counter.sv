module Counter #(
    parameter N = 4
)(
    input  logic clk,
    input  logic rstn,
    input  logic en,
    output logic [N-1:0] Q
);

always @(posedge clk , negedge rstn)
begin
    if (!rstn)
        Q <= '0; 
    else if (en)
        Q <= Q + 1;
end

endmodule