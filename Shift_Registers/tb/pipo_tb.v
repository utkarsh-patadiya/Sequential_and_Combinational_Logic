`timescale 1ns / 1ps

module pipo_tb;

    reg clk;
    reg reset;
    reg [7:0] in_data;
    wire [7:0] out_data;

    pipo uut (
        .clk(clk),
        .reset(reset),
        .in_data(in_data),
        .out_data(out_data)
    );

    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        in_data = 8'b0;

        // Apply reset signal for 5 time units
        #5 reset = 1;
        #5 reset = 0;

        // Apply different input data values
        #10 in_data = 8'b10101010;
        #10 in_data = 8'b11110000;
        #10 in_data = 8'b01010101;
        #10 in_data = 8'b00001111;

        // End simulation after 20 time units
        #20 $finish;
    end

    // Clock generation: toggle clock every 5 time units
    always #5 clk = ~clk;

endmodule
