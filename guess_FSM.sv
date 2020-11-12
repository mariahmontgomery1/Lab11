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
    
    localparam[2:0]
      s0    = 3'b000,
      s1    = 3'b001,
      s2   = 3'b010,
      s3   = 3'b011,
      slose = 3'b100,
      swin  = 3'b101;
      
   // internal signals
   reg [2:0] state, state_next;
   reg [N-1:0] counter, counter_next;
   
   // state memory (register)
   always_ff @(posedge(clk), posedge(rst))
      if (rst) begin
         state   <= s0;
         counter <= {N{1'b1}};
      end
      else if(en) begin
         state   <= state_next;
         counter <= counter_next;
      end
      
      always @*
        case(state)
            s0: begin
                 if(B == 4'b0000)
                    state_next = s1;
                 else if (B == 4'b0001)
                    state_next = swin;
                 else 
                    state_next = slose;
            end 
            
            s1: begin
                 if(B == 4'b0000)
                    state_next = s2;
                 else if (B == 4'b0010)
                    state_next = swin;
                 else 
                    state_next = slose;
            end 
            
            s2: begin
                 if(B == 4'b0000)
                    state_next = s3;
                 else if (B == 4'b0100)
                    state_next = swin;
                 else 
                    state_next = slose;
            end
            
            s3: begin
                 if(B == 4'b0000)
                    state_next = s0;
                 else if (B == 4'b1000)
                    state_next = swin;
                 else 
                    state_next = slose;
            end
            
            swin: begin
                 if(B == 4'b0000)
                    state_next = s0;
                 else 
                    state_next = swin;
            end
            
            slose: begin
                 if(B == 4'b0000)
                    state_next = s0;
                 else 
                    state_next = slose;
            end   
         endcase 
 

         always @* begin
            win = 0;
            lose = 0;
         
               case(state)
                    s0: y = 4'b0001;
                    s1: y = 4'b0010;
                    s2: y = 4'b0100;
                    s3: y = 4'b1000;
                    swin: begin
                          win = 1;
                          y = 4'b1111;
                          end
                    slose: begin
                        lose = 1;
                        y = 4'b0000;
                        end
                endcase 
          end
                    
                    
endmodule
