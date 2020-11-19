`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2020 06:28:11 PM
// Design Name: 
// Module Name: y_decoder
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


module y_decoder(
    input [3:0] in,
    output reg [6:0] out
    );
    
    always @*
        case (in)
            4'b0001: out = 7'b1111101;
            4'b0010: out = 7'b1111110;
            4'b0100: out = 7'b1011111;
            4'b1000: out = 7'b0111111;
            default: out = 7'b1111111;
        endcase
endmodule

