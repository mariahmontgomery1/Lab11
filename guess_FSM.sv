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
    output reg [3:0] y,
    output reg win,
    output reg lose
    );
    
    
     localparam s0    = 3'b000;
     localparam s1    = 3'b001;
     localparam s2    = 3'b010;
     localparam s3    = 3'b011;
     localparam slose = 3'b100;
     localparam swin  = 3'b101;
      
   // internal signals
   reg [2:0] state, state_next;
   
   // state memory (register)
   always_ff @(posedge(clk), posedge(rst))
      if (rst) 
         state   <= s0;
      else if(en) 
         state   <= state_next;
      
      
      always_comb
          begin
            win = 0;
            lose = 0;
        case(state)
            s0: begin
                 y = 4'b0001;
                 if(B == 4'b0000)
                    state_next = s1;
                 else if (B[3]==1 || B[2]==1 || B[1]==1)
                    state_next = slose;
                 else 
                    state_next = swin;
            end 
            
            s1: begin
                 y = 4'b0010;
                 if(B == 4'b0000)
                    state_next = s2;
                 else if (B[3]==1 || B[2]==1 || B[0]==1)
                    state_next = slose;
                 else 
                    state_next = swin;
            end 
            
            s2: begin
                 y = 4'b0100;
                 if(B == 4'b0000)
                    state_next = s3;
                 else if (B[3]==1 || B[1]==1 || B[0]==1)
                    state_next = slose;
                 else 
                    state_next = swin;
            end
            
            s3: begin
                 y = 4'b1000;
                 if(B == 4'b0000)
                    state_next = s0;
                 else if (B[2]==1 || B[1]==1 || B[0]==1)
                    state_next = slose;
                 else 
                    state_next = swin;
            end
            
            swin:
                begin
                y = 4'b1111;
                win = 4'b1;
                lose = 4'b0;
                state_next = swin;
                end
            slose:
                begin
                y = 4'b0000;
                win = 4'b0;
                lose = 4'b1;
                state_next = slose;
                end
         endcase 
         end
 

         
         
                    
                    
endmodule
