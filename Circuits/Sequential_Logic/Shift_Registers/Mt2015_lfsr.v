module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q

    wire tap;
    assign tap=LEDR[2]^LEDR[1];
    submodule subInst0(
        .clk(KEY[0]),
        .L(KEY[1]),
        .r_in(SW[0]),
        .q_in(LEDR[2]),
        .Q(LEDR[0]),
    );

    submodule subInst1(
        .clk(KEY[0]),
        .L(KEY[1]),
        .r_in(SW[1]),
        .q_in(LEDR[0]),
        .Q(LEDR[1]),
    );

    submodule subInst2(
        .clk(KEY[0]),
        .L(KEY[1]),
        .r_in(SW[2]),
        .q_in(tap),
        .Q(LEDR[2]),
    );

endmodule

module submodule (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);

    wire d;
    assign d=L?r_in:q_in;

    always@(posedge clk)
        Q <= d;

endmodule