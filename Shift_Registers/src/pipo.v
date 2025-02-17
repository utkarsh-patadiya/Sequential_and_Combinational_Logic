`timescale 1ns / 1ps

module pipo #(parameter WIDTH = 8) (
    input wire clk,         // Clock signal
    input wire reset,       // Reset signal
    input wire [WIDTH-1:0] in_data,  // 4-bit input data
    output reg [WIDTH-1:0] out_data  // 4-bit output data
);

// On every clock edge, if reset is high, set output to 0, otherwise load input into output
always @(posedge clk or posedge reset) begin
    if (reset)
        out_data <= 0;  // Reset to 0
    else
        out_data <= in_data;  // Load input data into output
end
 
endmodule
