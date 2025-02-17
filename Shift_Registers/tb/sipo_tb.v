`timescale 1ns / 1ps

module sipo_tb;

    reg clk;
    reg rst;
    reg shift_en;
    reg serial_in;
    wire [7:0] parallel_out;
    wire data_valid;

    sipo uut (
        .clk(clk),
        .rst(rst),
        .shift_en(shift_en),
        .serial_in(serial_in),
        .parallel_out(parallel_out),
        .data_valid(data_valid)
    );

    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        shift_en = 0;
        serial_in = 0;

        // Apply reset to the module
        #5 rst = 1;
        #5 rst = 0;

        // Enable shift and start shifting serial data
        #10 shift_en = 1;

        // Test a serial data stream: shifting 8 bits (WIDTH = 8)
        // Shift in 8 bits (binary: 10101010)
        #10 serial_in = 1; // Shift in bit 1
        #10 serial_in = 0; // Shift in bit 0
        #10 serial_in = 1; // Shift in bit 1
        #10 serial_in = 0; // Shift in bit 0
        #10 serial_in = 1; // Shift in bit 1
        #10 serial_in = 0; // Shift in bit 0
        #10 serial_in = 1; // Shift in bit 1
        #10 serial_in = 0; // Shift in bit 0

        // Shift in another 8 bits (binary: 11001100)
        #10 serial_in = 1; // Shift in bit 1
        #10 serial_in = 1; // Shift in bit 1
        #10 serial_in = 0; // Shift in bit 0
        #10 serial_in = 0; // Shift in bit 0
        #10 serial_in = 1; // Shift in bit 1
        #10 serial_in = 1; // Shift in bit 1
        #10 serial_in = 0; // Shift in bit 0
        #10 serial_in = 0; // Shift in bit 0

        // End simulation after second test is completed
        #25 $finish;
    end

    // Clock generation: toggle clock every 5 time units
    always #5 clk = ~clk;

endmodule
