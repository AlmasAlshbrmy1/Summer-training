module Alu #(parameter WIDTH=4)(
    input logic [WIDTH-1:0] A,          // from Ra
    input logic [WIDTH-1:0] B,          // from Rb
    input   logic     S,         
    output  logic [WIDTH-1:0] F,   
    output logic      carry 
);
 
    logic [3:0] b_final;
 
    assign b_final = B ^ {4{S}};
 
    assign {carry, F} = A + b_final + S;
 
endmodule