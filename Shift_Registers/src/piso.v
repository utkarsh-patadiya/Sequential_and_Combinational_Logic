`timescale 1ns / 1ps

// Parallel-In Serial-Out (PISO) Shift Register
// This module loads a parallel word when 'load' is asserted
// and shifts out data serially when 'shift_en' is high.

module piso #(parameter WIDTH = 8) (
  input  wire              clk,         // Clock signal: triggers shifting on rising edge
  input  wire              rst,         // Asynchronous reset (active high)
  input  wire              load,        // Load enable: loads parallel data when high
  input  wire              shift_en,    // Shift enable: shifts out serial data when high
  input  wire  [WIDTH-1:0] parallel_in, // Parallel data input
  output reg               serial_out   // Serial data output
);

  // Internal shift register storage
  reg [WIDTH-1:0] shift_reg;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      // Reset: Clear the shift register and output
      shift_reg  <= 0;
      serial_out <= 0;
    end 
    else if (load) begin
      // Load parallel data into the shift register
      shift_reg  <= parallel_in;
    end 
    else if (shift_en) begin
      // Shift operation: shift left and output MSB
      serial_out <= shift_reg[WIDTH-1];
      shift_reg  <= {shift_reg[WIDTH-2:0], 1'b0}; // Shift left, fill LSB with 0
    end
  end

endmodule