module file_registers #(
    parameter WIDTH = 4
)(
    input  logic clk,
    input  logic rstn,
    input  logic en,
    input  logic [WIDTH-1:0] data_in,
    output logic [WIDTH-1:0] data_out
);
always_ff @(posedge clk or negedge rstn) begin
    if (!rstn)
        data_out <= '0;
    else if (en)
        data_out <= data_in;
end
endmodule