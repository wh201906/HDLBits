module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum_lo,sum_hi;
    wire c;

    add16 add_lo(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum_lo),
        .cout(c),
    );

    add16 add_hi(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(c),
        .sum(sum_hi),
    );

    assign sum={sum_hi,sum_lo};

endmodule
