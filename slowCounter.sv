`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2020 12:36:52 PM
// Design Name: 
// Module Name: slowCounter
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


module slowCounter(
    input clk,
    input rst,
    output count
    );
    
    counter #(.N(4)) counterSlow(
        .clk(clk),
        .rst(rst),
        .MSBs(count)
    );
endmodule
