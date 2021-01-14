module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //

    MUXDFF muxInst0(
        .clk(KEY[0]),
        .E(KEY[1]),
        .L(KEY[2]),
        .w(LEDR[1]),
        .R(SW[0]),
        .Q(LEDR[0])
    );

    MUXDFF muxInst1(
        .clk(KEY[0]),
        .E(KEY[1]),
        .L(KEY[2]),
        .w(LEDR[2]),
        .R(SW[1]),
        .Q(LEDR[1])
    );

    MUXDFF muxInst2(
        .clk(KEY[0]),
        .E(KEY[1]),
        .L(KEY[2]),
        .w(LEDR[3]),
        .R(SW[2]),
        .Q(LEDR[2])
    );

    MUXDFF muxInst3(
        .clk(KEY[0]),
        .E(KEY[1]),
        .L(KEY[2]),
        .w(KEY[3]),
        .R(SW[3]),
        .Q(LEDR[3])
    );
endmodule

module MUXDFF (
    input clk,
    input w, R, E, L,
    output Q
);
    wire mid0,d;
    assign mid0 = E?w:Q;
    assign d = L?R:mid0;
    always@(posedge clk)
        Q <= d;
endmodule