`timescale 1ns / 1ps

module siso_tb;

    reg clk;
    reg rst;
    reg shift_en;
    reg serial_in;
    wire serial_out;

    siso uut (
        .clk(clk),
        .rst(rst),
        .shift_en(shift_en),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    // Signal to track if the test passed
    reg [7:0] next_input;
    reg [3:0] bit_count;

    initial begin
        // Initialize signals
		rst = 0;
        clk = 1;
        shift_en = 0;
        serial_in = 0;
        next_input = 8'b10101010; // First test pattern
        bit_count = 0;

        // Apply reset to the module
        #5 rst = 1;
        #5 rst = 0;

        // Enable shifting and start applying serial data
        #10 shift_en = 1;

        // Test serial data input (shifting in 8 bits: 10101010)
        for (bit_count = 0; bit_count < 8; bit_count = bit_count + 1) begin
            serial_in = next_input[bit_count];  // Shift in each bit
            #10 ;
        end

        // Set up the next test pattern
        next_input = 8'b11001100; // Second test pattern
        bit_count = 0;

        // Shift in another 8 bits (shifting in: 11001100)
        for (bit_count = 0; bit_count < 8; bit_count = bit_count + 1) begin
            serial_in = next_input[bit_count];  // Shift in each bit
            #10;
        end
		serial_in=1'b0;
        #100 $stop;
    end

    // Clock generation: toggle clock every 5 time units
    always #5 clk = ~clk;

endmodule
