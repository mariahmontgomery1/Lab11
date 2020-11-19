`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2020 12:36:51 PM
// Design Name: 
// Module Name: fastCounter
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


module fastCounter(
    input clk,
    input rst,
    output count
    );
    
    counter #(.N(26)) counterFast(
        .clk(clk),
        .rst(rst),
        .MSBs(count)
    );
endmodule
