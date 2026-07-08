`timescale 1ns/1ps

module toOdd_tb;

parameter WIDTH = 4;

logic [WIDTH-1:0] n;
logic [WIDTH-1:0] oddN;

toOdd #(WIDTH) DUT(
    .n(n),
    .oddN(oddN)
);

initial begin

    n = 4'd0;  #10;
    n = 4'd1;  #10;
    n = 4'd2;  #10;
    n = 4'd3;  #10;
    n = 4'd4;  #10;
    n = 4'd5;  #10;
    n = 4'd6;  #10;
    n = 4'd7;  #10;
    n = 4'd8;  #10;
    n = 4'd9;  #10;
    n = 4'd10; #10;
    n = 4'd11; #10;
    n = 4'd12; #10;
    n = 4'd13; #10;
    n = 4'd14; #10;
    n = 4'd15; #10;

    $stop;

end

endmodule