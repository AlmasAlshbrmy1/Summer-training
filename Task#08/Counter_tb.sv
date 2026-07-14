`timescale 1ns / 1ps

module Counter_tb;

parameter N = 4;

logic clk;
logic rstn;
logic en;
logic [N-1:0] Q;

Counter #(
    .N(N)
) dut (
    .clk(clk),
    .rstn(rstn),
    .en(en),
    .Q(Q)
);

always begin
    #5 clk = ~clk;
end

initial begin

    clk = 0;
    rstn = 0;
    en = 1;

    #10 rstn = 1;

    #20 en = 0;

    #10 en = 1;
	 
	 #20 en = 0;

    #200 $finish;

end

endmodule