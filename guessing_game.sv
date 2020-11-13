module guessing_game(
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    input btnC,
    input clk,
    input [15:0] sw,
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led
    );
    
    wire db1_out;
    wire db2_out;
    wire db3_out;
    wire db4_out;
    wire db1_tick;
    wire db2_tick;
    wire db3_tick;
    wire db4_tick;
    wire fastCounter_count;
    wire slowCounter_count;
    wire mux2_out;
    wire guess_FSM_y;
    wire guess_FSM_win;
    wire guess_FSM_lose;
    
    debounce db1(
        .clk(clk),
        .reset(btnC),
        .in(btnU),
        .out(db1_out),
        .tick(db1_tick)
    );
    
    debounce db2(
        .clk(clk),
        .reset(btnC),
        .in(btnD),
        .out(db2_out),
        .tick(db2_tick)
    );
    
    debounce db3(
        .clk(clk),
        .reset(btnC),
        .in(btnL),
        .out(db3_out),
        .tick(db3_tick)
    );
    
    debounce db4(
        .clk(clk),
        .reset(btnC),
        .in(btnR),
        .out(db4_out),
        .tick(db4_tick)
    );
    
    
    fastCounter fastCounter_game(
        .clk(clk),
        .rst(btnC),
        .count(fastCounter_count)
    );
    
    slowCounter slowCounter_game(
        .clk(clk),
        .rst(btnC),
        .count(slowCounter_count)
    );
    
    mux2 #(.BITS(1)) mux2_guess(
        .in0(fastCounter_count),
        .in1(slowCounter_count),
        .sel(sw[0]),
        .out(mux2_out)
    );
    
    guess_FSM guess_FSM_game(
        .B({db1_out, db2_out, db3_out, db4_out}),
        .en(mux2_out),
        .clk(clk),
        .rst(btnC),
        .y(guess_FSM_y),
        .win(guess_FSM_win),
        .lose(guess_FSM_lose)
    );
    
 endmodule 