`timescale 1ns / 1ps

module piso_tb;

  // Parameters
  parameter WIDTH = 8;

  // Inputs
  reg clk;
  reg rst;
  reg load;
  reg shift_en;
  reg [WIDTH-1:0] parallel_in;

  // Outputs
  wire serial_out;

  // Instantiate the PISO module
  piso #(WIDTH) uut (
    .clk(clk),
    .rst(rst),
    .load(load),
    .shift_en(shift_en),
    .parallel_in(parallel_in),
    .serial_out(serial_out)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Generate clock with a period of 10ns
  end

  // Stimulus generation
  initial begin
    // Initialize inputs
    clk = 0;
    rst = 0;
    load = 0;
    shift_en = 0;
    parallel_in = 8'b10101010;

    // Reset the system
    rst = 1;
    #10;  // Wait for 10ns
    rst = 0;
    #10;

    // Test case 1: Load data into shift register
    load = 1;
    parallel_in = 8'b11001100;  // Parallel data to load
    #10; // Wait for a clock cycle
    load = 0;

    shift_en =1;
    #100 shift_en = 0;

    // Test case 4: Load new data and shift again
    #10 load = 1;
    parallel_in = 8'b11010000;
    #10;  // Wait for a clock cycle
    load = 0;

    // Shift the new data
    shift_en = 1;
    #50 shift_en = 0;

    // Finish simulation
    $finish;
  end

  // Monitor serial_out for debugging
  initial begin
    $monitor("Time = %0t, serial_out = %b", $time, serial_out);
  end

endmodule
