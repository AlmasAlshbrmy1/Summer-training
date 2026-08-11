module instruction_memory #(
    parameter IMEM_DEPTH = 16,
    parameter FILE_NAME = "C:\\Users\\almas\\Desktop\\test\\Almas\\Project\\Project1\\machine_code.mem"
)(
    input  logic [$clog2(IMEM_DEPTH)-1:0] address,
    output logic [7:0] instruction
);

logic [7:0] imem [0:IMEM_DEPTH-1];
assign instruction = imem[address];
initial
    $readmemb(FILE_NAME, imem);
endmodule