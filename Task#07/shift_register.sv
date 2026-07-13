module shift_register (
    input  logic SI,
    input  logic Clock,
    input  logic rst,
    output logic [3:0] Q
);

always @(posedge Clock , posedge rst) begin
    if (rst)
        Q <= 4'b0000;
    else begin
        Q[3] <= SI;
        Q[2] <= Q[3];
        Q[1] <= Q[2];
        Q[0] <= Q[1];
    end
end

endmodule