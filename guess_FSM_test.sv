`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2020 09:13:37 PM
// Design Name: 
// Module Name: guess_FSM_test
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


module guess_FSM_test();

    reg [3:0] B_t; 
    reg en_t;
    reg clk;
    reg rst_t;
    reg [3:0] y_t;
    reg win_t;
    reg lose_t;
    integer i;
    
    guess_FSM #(.N(21)) dut(
        .B(B_t),
        .en(en_t),
        .clk(clk),
        .rst(rst_t),
        .y(y_t),
        .win(win_t),
        .lose(lose_t)
    );
    
    always begin 
        clk = ~clk; #5;
    end 
    initial begin   
        clk = 0; rst_t = 1; en_t = 0; B_t = 4'b0000; #10;
        rst_t = 0; #20;
        en_t = 1; #60;
        
        for (i = 0; i <= 4'b1111; i = i + 1) begin 
            B_t = 4'b0000;
            #60;
            B_t = i;
            #10;
        end 
        
        B_t = 4'b0000;
        en_t = 0; #50;
        en_t = 1; #60;
        rst_t = 1; #10;
        rst_t = 0;
        for (i = 0; i <= 4'b1111; i = i + 1) begin 
            B_t = 4'b0000;
            #50;
            B_t = i;
            #10;
        end 
        
         B_t = 4'b0000;
        en_t = 0; #50;
        en_t = 1; #60;
        rst_t = 1; #10;
        rst_t = 0;
        for (i = 0; i <= 4'b1111; i = i + 1) begin 
            B_t = 4'b0000;
            #70;
            B_t = i;
            #10;
        end 
        
         B_t = 4'b0000;
        en_t = 0; #50;
        en_t = 1; #60;
        rst_t = 1; #10;
        rst_t = 0;
        for (i = 0; i <= 4'b1111; i = i + 1) begin 
            B_t = 4'b0000;
            #80;
            B_t = i;
            #10;
        end 
        $finish;
    end 

endmodule
