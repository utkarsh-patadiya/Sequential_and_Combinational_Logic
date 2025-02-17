`timescale 1ns / 1ps

// Serial-In Parallel-Out (SIPO) Shift Register with Shift Enable, Bit Counter, and Data Valid Flag.
// This module shifts in serial data only when shift_en is asserted, and it outputs a complete parallel word when WIDTH bits have been shifted in.
// A data_valid flag is asserted to indicate that the parallel output is ready.
// After a complete word is received, the counter resets to begin shifting in the next word.

module sipo #(parameter WIDTH = 8) (
  input  wire              clk,          // Clock signal: triggers shifting on rising edge
  input  wire              rst,          // Asynchronous reset (active high)
  input  wire              shift_en,     // Shift enable: data is shifted only when this is high
  input  wire              serial_in,    // Serial data input
  output reg  [WIDTH-1:0]  parallel_out, // Parallel output for the shifted data
  output reg             data_valid    // Indicates that a full word (WIDTH bits) has been received
);

  // Internal counter to keep track of the number of shifted bits
  // The counter width is determined using $clog2(WIDTH), plus one bit for safety.
  reg [$clog2(WIDTH):0] count;

  // Always block triggered on the rising edge of clk or asynchronous reset
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      // On reset, clear the shift register, counter, and data_valid flag
      parallel_out <= {WIDTH{1'b0}};
      count        <= 0;
      data_valid   <= 0;
    end else if (shift_en) begin
      // Shift the register left and insert the new bit at the LSB
      parallel_out <= {parallel_out[WIDTH-2:0], serial_in};
      
      // If we've shifted in WIDTH-1 bits already, the next bit completes the word
      if (count == WIDTH-1) begin
        data_valid <= 1;   // Assert data_valid to indicate the parallel data is ready
        count      <= 0;   // Reset counter for the next word
      end else begin
        data_valid <= 0;   // Data is not yet valid
        count      <= count + 1; // Increment counter
      end
    end
    // If shift_en is low, retain the current state of parallel_out, count, and data_valid.
  end

endmodule

