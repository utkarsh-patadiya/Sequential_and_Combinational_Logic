`timescale 1ns / 1ps

module testbench;
	// For Encoder
	reg [3:0] enc_in;
	wire [1:0] enc_out;
	
	// For Priority Encoder
	reg [3:0] p_enc_in;
	wire [1:0] p_enc_out;
	
	// For Decoder
	reg [1:0] dec_in;
	wire [3:0]dec_out;
	
	encoder enc(enc_in,enc_out);
	decoder dec(dec_in,dec_out);
	priority_encoder p_enc(p_enc_in,p_enc_out);
	
	initial begin 
		enc_in=0;
		dec_in=0;
		p_enc_in=0;
	
		// Testing Encoder And Priority encoder
		repeat(16) begin
			#10 enc_in=enc_in+1'b1;
			p_enc_in=p_enc_in+1'b1;
		end
		repeat(4) begin 
			#10 dec_in=dec_in+1;
		end
		#20 $finish;
	end
endmodule
