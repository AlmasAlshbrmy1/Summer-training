module datapath #(
    parameter WIDTH = 4,
    parameter IMEM_DEPTH = 16,
  parameter IMEM_FILE = "C:\\Users\\alfra\\Downloads\\machine_code.mem",
    parameter DMEM_FILE = "C:\\Users\\alfra\\Downloads\\data.mem"
)(
            input  logic clk,
            input  logic rstn,
            input  logic J,
            input  logic C,
            input  logic D1,
            input  logic D0,
            input  logic Sreg,
            input  logic S,
     
        // Immediate value
            input  logic [2:0] imm,
        // Outputs
            output logic [7:0] instruction,
            output logic [WIDTH-1:0] RO ,
            output logic Carry
        );
        // Program Counter output (Address)
        logic [WIDTH-1:0] Q;
        // Decoder outputs
        logic en_RA;
        logic en_RB;
        logic en_RO;
        // Register outputs
        logic [WIDTH-1:0] RA_out;
        logic [WIDTH-1:0] RB_out;
        // MUX output
        logic [WIDTH-1:0] MUX_out;
        // ALU outputs
        logic [WIDTH-1:0] ALU_out;
        logic carry_wire;
        // data memory output
        logic mem_Write;
        logic RA_mem;
        logic RB_mem;
        assign RA_mem =    (!J && C && !D1 && !D0 && Sreg);    //RA=[imm]
        assign RB_mem =    (!J && C && !D1 &&  D0 && Sreg);    //RB=[imm]
        logic [3:0] mem_out;
        assign mem_Write = (!J && C &&  D1 &&  D0 && Sreg);    
     
        logic zero_wire;
        logic Zero;
        assign zero_wire = ~(|ALU_out);
     
        logic jump;
        logic jump_carry;
        logic jump_zero;
     
        assign jump       =  D1 & D0 & J & ~C;
        assign jump_carry =  D1 & D0 & ~J & C & ~Sreg;   
        assign jump_zero  =  D1 & D0 & J & C;
     
        data_memory #(
            .WIDTH(WIDTH),
            .DEPTH(8),
            .FILE_NAME(DMEM_FILE)
        ) DM (
            .clk(clk),
            .Write(mem_Write),
            .address(imm),
            .data_in(RA_out),
            .data_out(mem_out)
        );
        counter #(
            .WIDTH(WIDTH)
        ) PC (
            .clk(clk),
            .rstn(rstn),
             .load( jump|(jump_carry & Carry)|(jump_zero & Zero) ),
            .D({1'b0, imm}),
            .Q(Q)
        );
        instruction_memory #(
            .IMEM_DEPTH(IMEM_DEPTH),
            .FILE_NAME(IMEM_FILE)
        ) IM (
            .address(Q),
            .instruction(instruction)
        );
        Decoder2 DEC (
            .D1(D1),
            .D0(D0),
            .y0(en_RA),
            .y1(en_RB),
            .y2(en_RO),
            .y3()
        );
        registers #(
            .WIDTH(WIDTH)
        ) RA_reg (
            .clk(clk),
            .rstn(rstn),
            .en(en_RA|(RA_mem)),
            .data_in((RA_mem) ? mem_out : MUX_out),
            .data_out(RA_out)
        );
        registers #(
            .WIDTH(WIDTH)
        ) RB_reg (
            .clk(clk),
            .rstn(rstn),
            .en(en_RB|(RB_mem)),
            .data_in((RB_mem) ? mem_out : MUX_out),
            .data_out(RB_out)
        );
        registers #(
            .WIDTH(WIDTH)
        ) RO_reg (
            .clk(clk),
            .rstn(rstn),
            .en(en_RO && !C),
            .data_in(RA_out),
            .data_out(RO)
        );
        Alu #(
            .WIDTH(WIDTH)
        ) ALU (
            .A(RA_out),
            .B(RB_out),
            .S(S),
            .F(ALU_out),
            .carry(carry_wire)
        );
        mux #(
            .WIDTH(WIDTH)
        ) MUX (
            .W0(ALU_out),
            .W1({1'b0, imm}),
            .Sel(Sreg),
            .F(MUX_out)
        );
        registers #(
            .WIDTH(1)
        ) dff1 (
            .clk(clk),
            .rstn(rstn),
            .en(~(D1 & D0)),
            .data_in(carry_wire),
            .data_out(Carry)
        );
     
        registers #(
            .WIDTH(1)
        ) dff2 (
            .clk(clk),
            .rstn(rstn),
            .en(~(D1 & D0)),
            .data_in(zero_wire),
            .data_out(Zero)
        );
        endmodule