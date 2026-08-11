module data_memory #(
    parameter WIDTH = 4,
    parameter DEPTH = 8,
    parameter FILE_NAME =  "C:\\Users\\alfra\\Downloads\\data.mem"
)(
    input  logic clk,
    input  logic Write,
    input  logic [$clog2(DEPTH)-1:0] address,
    input  logic [WIDTH-1:0] data_in,
    output logic [WIDTH-1:0] data_out
);

logic [WIDTH-1:0] dmem [0:DEPTH-1];

assign data_out = dmem[address];

always_ff @(posedge clk) begin
    if (Write)
        dmem[address] <= data_in;
end

initial
    $readmemb(FILE_NAME, dmem);

endmodule