`timescale 1ns/1ps

module mem_tb;

parameter Width = 8;
parameter Depth = 32;

logic clk;
logic read;
logic write;
logic [$clog2(Depth)-1:0] addr;
logic [Width-1:0] data_in;
logic [Width-1:0] data_out;

mem #(
    .Width(Width),
    .Depth(Depth)
) dut (
    .clk(clk),
    .read(read),
    .write(write),
    .addr(addr),
    .data_in(data_in),
    .data_out(data_out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    read = 1;
    write = 0;
    addr = 0;
    data_in = 8'h00;

    #10;

    addr = 1;
    read = 0;
    write = 1;
    data_in = 8'hFF;

    #10;

    write = 0;
    read = 1;
    addr = 1;

    #10;

    $finish;

end

endmodule