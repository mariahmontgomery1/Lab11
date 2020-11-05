`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2020 12:23:45 PM
// Design Name: 
// Module Name: guess_FSM
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


module guess_FSM #(parameter N=21)(
    input [3:0] B,
    input en,
    input clk,
    input rst,
    output [3:0] y,
    output win,
    output lose
    );
    
    localparam [1:0]
      s0    = 3'b000,
      s1    = 3'b001,
      s2    = 3'b010,
      s3    = 3'b011,
      slose = 3'b100,
      swin  = 3'b101;
      
      // internal signals
   reg [1:0] state, state_next;
   reg [N-1:0] counter, counter_next;
   
   // state memory (register)
   always_ff @(posedge clk or posedge rst)
      if (rst) begin
         state   <= s0;
         counter <= {N{1'b1}};
      end
      else begin
         state   <= state_next;
         counter <= counter_next;
      end
      
      
endmodule
