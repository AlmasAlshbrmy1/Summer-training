module alu #(
             parameter ALU_WIDTH =4
             )(
				     input logic [ALU_WIDTH-1:0] op1,
					  input logic [ALU_WIDTH-1:0] op2,
					  input logic [1:0] opcode,
					  output logic [ALU_WIDTH-1:0] alu_result
					  
				 );
				 
				 always_comb begin
				   case(opcode)
					    2'b00: alu_result = op1 + op2;
					    2'b01: alu_result = op1 - op2;
					    2'b10: alu_result = op1 & op2;
					    2'b11: alu_result = op1 | op2;
					    default: alu_result = 'bx;
					  
					endcase
				 end
				 					 
endmodule 
				  
				  
				  
				  