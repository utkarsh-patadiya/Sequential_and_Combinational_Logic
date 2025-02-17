`timescale 1ns / 1ps

// Serial-In Serial-Out (SISO) Shift Register
// This module shifts in serial data when shift_en is asserted
// and shifts out the oldest bit through serial_out.
// The width of the shift register is parameterizable (default is 8 bits).

module siso #(parameter WIDTH = 8) (
  input  wire clk,          // Clock signal: triggers shifting on rising edge
  input  wire rst,          // Asynchronous reset (active high)
  input  wire shift_en,     // Shift enable: shift data only when high
  input  wire serial_in,    // Serial data input
  output reg  serial_out    // Serial output: oldest bit shifted out
);

  // Internal shift register storage
  reg [WIDTH-1:0] shift_reg;

  // Always block triggered on the rising edge of clk or when rst is asserted
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      // If reset is high, clear the shift register and serial output.
      shift_reg  <= {WIDTH{1'b0}};
      serial_out <= 1'b0;
    end else if (shift_en) begin
      // Shift the register left and insert the new bit at the LSB
      shift_reg  <= {shift_reg[WIDTH-2:0], serial_in};
      // Output the MSB (oldest bit in the register)
      serial_out <= shift_reg[WIDTH-1];
    end
  end

endmodule
