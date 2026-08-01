module program_counter # (
                          parameter PROG_VALUE = 16
								  )(
								     input logic clk,
									  input logic rstn,
									  output logic [($clog2(PROG_VALUE))-1:0] counter 
									 								  
																  
								  );
		 always_ff @(posedge clk or negedge rstn ) begin 
		         if (!rstn)
					    counter <= 0;
					else
					    counter <= counter +1;
		end
													  
endmodule
								  