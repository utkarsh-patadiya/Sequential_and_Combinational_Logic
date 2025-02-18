`timescale 1ns / 1ps

module maximal_length_lfsr_tb;

    // Testbench signals
    reg clk;
    reg reset;
    reg en;
    reg [3:0] init_val;  // Input for initial value
    wire [3:0] out;
    wire fb_bit;

    // Instantiate the LFSR module
    maximal_length_lfsr uut (
        .clk(clk),
        .reset(reset),
        .en(en),
        .init_val(init_val),
        .out(out),
        .fb_bit(fb_bit)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // Toggle clock every 5ns (100MHz clock)
    end

    // Testbench stimulus
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        en = 0;
        init_val = 4'b1001;  // Initial value (seed)

        // Apply reset and test
        #10 reset = 1;  // Assert reset
        #10 reset = 0;  // Deassert reset
        
        // Enable LFSR and test sequence generation
        #10 en = 1;  // Enable LFSR operation
        
        // Test different initial values
        #100 init_val = 4'b1101;  // Change initial value (seed)
        #10 reset = 1;  // Reset with new initial value
        #10 reset = 0;
        
        // Continue the sequence generation with new initial value
        #10 en = 1;  // Enable LFSR again

        // Run the test for a few more cycles
        #100 en = 0;  // Disable LFSR operation
        
        // End of simulation
        #20 $finish;
    end

    // Monitor the outputs
    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | en = %b | init_val = %b | out = %b | fb_bit = %b", 
                  $time, clk, reset, en, init_val, out, fb_bit);
    end

endmodule
