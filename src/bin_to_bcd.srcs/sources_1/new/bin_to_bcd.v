`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2022 09:00:28 PM
// Design Name: 
// Module Name: bin_to_bcd
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


module bin_to_bcd(
    input clk,
    input [7:0] eight_bit_val,
    output reg [3:0] ones = 0,
    output reg [3:0] tens = 0,
    output reg [3:0] hundreds = 0
    );
     
reg [3:0] i = 0;
reg [19:0] shift_reg = 0;

reg [3:0] temp_ones = 0;
reg [3:0] temp_tens = 0;
reg [3:0] temp_hundreds = 0;

reg [7:0] prev_eight_bit_val = 0;

always @(posedge clk) begin
    if (i == 0 & (prev_eight_bit_val != eight_bit_val)) begin
        shift_reg = 20'd0;
        
        prev_eight_bit_val = eight_bit_val;
        
        shift_reg[7:0] = eight_bit_val;
        
        temp_ones = shift_reg[11:8];
        temp_tens = shift_reg[15:12];
        temp_hundreds = shift_reg[19:16];
        i = i + 1;
    end
    if (i < 9 & i > 0) begin
        if (temp_ones >= 5) 
            temp_ones = temp_ones + 3;
        if (temp_tens >= 5)
            temp_tens = temp_tens + 3;
        if (temp_hundreds >= 5)
            temp_hundreds = temp_hundreds + 3;
            
        shift_reg [19:8] = {temp_hundreds, temp_tens, temp_ones};
        
        shift_reg = shift_reg << 1;
        
        temp_ones = shift_reg [11:8];
        temp_tens = shift_reg [15:12];
        temp_hundreds = shift_reg [19:16];
        i = i + 1;
    end
    if (i == 9) begin
        i = 0;
        
        ones = temp_ones;
        tens = temp_tens;
        hundreds = temp_hundreds;
    end
end
endmodule
