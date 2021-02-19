module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 

    parameter WL=2'h0,WR=2'h1,AA=2'h2,DG=2'h3;

    reg [1:0] currSt, nextSt;
    reg currDigState, nextDigState;

    always @(*) begin
        if(~ground)
            nextDigState<=1'b0;
        else begin
            if(dig)
                nextDigState<=1'b1;
            else
                nextDigState<=nextDigState;
        end
    end

    always @(*) begin
        if(~ground) begin
            nextSt<=AA;
        end
        else begin
            if(dig) begin
                digState<=1'b1;
                nextState<=
        end
    end



endmodule
