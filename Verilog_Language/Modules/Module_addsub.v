module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire [15:0] sum_lo,sum_hi;
    wire [31:0] xorb;
    wire c;

    assign xorb=b^{32{sub}};

    add16 add_lo(
        .a(a[15:0]),
        .b(xorb[15:0]),
        .cin(sub),
        .sum(sum_lo),
        .cout(c),
    );

    add16 add_hi(
        .a(a[31:16]),
        .b(xorb[31:16]),
        .cin(c),
        .sum(sum_hi),
    );

    assign sum={sum_hi,sum_lo};

endmodule
