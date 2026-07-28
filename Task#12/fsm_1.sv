module fsm_1 (
    input logic Up, Down,
    input logic clk, rstn,
    output logic Ground_LED,
    output logic First_LED,
    output logic Second_LED,
    output logic Third_LED
);

enum logic [2:0] {
    Ground,
    First,
    Second,
    Third,
    unused = 3'bxxx
} current_state, next_state;

always @(current_state)
case(current_state)

Ground: begin
    Ground_LED = 1;
    First_LED  = 0;
    Second_LED = 0;
    Third_LED  = 0;
end

First: begin
    Ground_LED = 0;
    First_LED  = 1;
    Second_LED = 0;
    Third_LED  = 0;
end

Second: begin
    Ground_LED = 0;
    First_LED  = 0;
    Second_LED = 1;
    Third_LED  = 0;
end

Third: begin
    Ground_LED = 0;
    First_LED  = 0;
    Second_LED = 0;
    Third_LED  = 1;
end

default: begin
    Ground_LED = 1'bx;
    First_LED  = 1'bx;
    Second_LED = 1'bx;
    Third_LED  = 1'bx;
end

endcase



always@(current_state, Up, Down)
case(current_state)

Ground: begin
    if(Up && !Down)
        next_state = First;
    else if(!Up && Down)
        next_state = Ground;
    else
        next_state = unused;
end
	 
First: begin
    if(Up && !Down)
        next_state = Second;
    else if(!Up && Down)
        next_state = Ground;
    else
        next_state = unused;
end

Second: begin
    if(Up && !Down)
        next_state = Third;
    else if(!Up && Down)
        next_state = First;
    else
        next_state = unused;
end




Third: begin
    if(Up && !Down)
        next_state = Third;
    else if(!Up && Down)
        next_state = Second;
    else
        next_state = unused;
end
endcase

always @(posedge clk or negedge rstn)
    if(!rstn)
        current_state <= Ground;
    else
        current_state <= next_state;


endmodule