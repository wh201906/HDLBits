module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    assign ena[1]=(q[3:0]==4'h9)?1'b1:1'b0;
    assign ena[2]=(q[7:0]==8'h99)?1'b1:1'b0;
    assign ena[3]=(q[11:0]==12'h999)?1'b1:1'b0;

    bcd1 bcdInst0(
        .clk(clk),
        .reset(reset),
        .ena(1'b1),
        .q(q[3:0])
    );

    bcd1 bcdInst1(
        .clk(clk),
        .reset(reset),
        .ena(ena[1]),
        .q(q[7:4])
    );

    bcd1 bcdInst2(
        .clk(clk),
        .reset(reset),
        .ena(ena[2]),
        .q(q[11:8])
    );

    bcd1 bcdInst3(
        .clk(clk),
        .reset(reset),
        .ena(ena[3]),
        .q(q[15:12])
    );

endmodule

module bcd1(
    input clk,reset,ena,
    output [3:0] q
);

    always@(posedge clk) begin
        if(reset)
            q<=4'd0;
        else if(ena && q==4'd9)
            q<=4'd0;
        else if(ena)
            q<=q+4'd1;
        else
            q<=q;
    end

endmodule