module clockDivider (F, rstn, F2, F4, F8);
input F, rstn;
output reg F2, F4, F8;
always @(posedge F, negedge rstn)
begin
    if(!rstn)
        F2 <= 0;
    else
        F2 <= ~F2;
end
always @(posedge F2, negedge rstn)
begin
    if(!rstn)
        F4 <= 0;
    else
        F4 <= ~F4;
end
always @(posedge F4, negedge rstn)
begin
    if(!rstn)
        F8 <= 0;
    else
        F8 <= ~F8;
end

endmodule