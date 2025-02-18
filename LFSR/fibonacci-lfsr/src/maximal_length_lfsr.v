`timescale 1ns / 1ps

module maximal_length_lfsr(
	input clk,
	input reset,
	input en,
	input [3:0] init_val,
	output reg [3:0] out,
	output fb_bit
    );
    assign fb_bit=out[1]^out[0];
    always @(posedge clk or posedge reset)
    begin 
    	if(reset)
    		out <= init_val;
    	else if (en)
    		out <= {fb_bit,out[3:1]};
    end
endmodule
