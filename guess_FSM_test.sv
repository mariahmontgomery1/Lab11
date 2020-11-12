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
        clk = 0; en_t = 0; rst_t = 0; B_t = 4'b0001; #10; 
        rst_t = 1; #3;
        B_t = 4'b0010; en_t = 1; rst_t = 0; #10;
        rst_t = 1; #3;
        B_t = 4'b1110; rst_t = 0; #10;
        rst_t = 1; #3;
        en_t = 0; #5;
        en_t = 1; #3;
        B_t = 4'h1000; #10;
        $finish;
    end 

endmodule
