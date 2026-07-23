module comparator #(parameter N = 8)
(
    input  logic [N-1:0] Balance,
    input  logic [N-1:0] Amount,
    output logic Greater,
    output logic Equal,
    output logic Less
);

always_comb
begin
    Greater = (Balance > Amount);
    Equal   = (Balance == Amount);
    Less    = (Balance < Amount);
end

endmodule