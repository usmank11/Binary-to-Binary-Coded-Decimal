`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2022 09:47:18 PM
// Design Name: 
// Module Name: test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test;

reg clk = 0;
reg [7:0] eight_bit_val = 0;
wire [3:0] ones;
wire [3:0] tens;
wire [3:0] hundreds;

bin_to_bcd UUT (clk, eight_bit_val, ones, tens, hundreds);

always #5 clk = ~clk;
initial begin
    eight_bit_val = 0;
    #500 eight_bit_val = 10;
    #500 eight_bit_val = 248;
    #500 eight_bit_val = 139;
end
endmodule
