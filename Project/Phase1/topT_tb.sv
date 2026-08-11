`timescale 1ns / 1ps
module topT_tb;
 
    parameter WIDTH = 4;
 
    logic clk ;
    logic rstn;
    logic [WIDTH-1:0] RO;
    logic Carry;
 
    topT #(
        .WIDTH(WIDTH),
        .IMEM_DEPTH(16),
        .FILE_NAME("C:\\Users\\alfra\\Downloads\\machine_code.mem")
    ) DUT (
        .clk(clk),
        .rstn(rstn),
        .RO(RO),
        .Carry(Carry)
    );
 
    always #5 clk = ~clk;
 
    initial begin
 clk = 0;
 rstn = 0;
   #12;
 rstn = 1;
   #600
 $finish;
    end
 
endmodule
