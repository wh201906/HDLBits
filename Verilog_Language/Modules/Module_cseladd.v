module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum_lo,sum_hi0,sum_hi1;
    wire c;

    add16 add_lo(
        .a(a[15:0]),
        .b(b[15:0]),
        .cin(1'b0),
        .sum(sum_lo),
        .cout(c),
    );

    add16 add_hi0(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b0),
        .sum(sum_hi0),
    );

    add16 add_hi1(
        .a(a[31:16]),
        .b(b[31:16]),
        .cin(1'b1),
        .sum(sum_hi1),
    );

    always @(*) begin
        case(c)
            1'b0:sum={sum_hi0,sum_lo};
            1'b1:sum={sum_hi1,sum_lo};
        endcase
    end

endmodule
