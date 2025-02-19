`timescale 1ns / 1ps

module priority_encoder(
	input [3:0] in,
	output [1:0] out
    );
    assign out[0] = in[3] | ( ~in[2] & in[1] );
    assign out[1] = in[3] | in[2];
endmodule
