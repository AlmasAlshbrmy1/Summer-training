module Decoder2 (
input logic   D1, D0,
    output logic y0,y1,y2,y3
);
always_comb begin 
y0=(~D1 & ~D0);
y1=(~D1 & D0);
y2=(D1 & ~D0);
y3= (D1 & D0);
end
endmodule 