module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    fullAdder adder0(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .cout(cout[0]),
        .sum(sum[0]),
    );
    fullAdder adder1(
        .a(a[1]),
        .b(b[1]),
        .cin(cout[0]),
        .cout(cout[1]),
        .sum(sum[1]),
    );
    fullAdder adder2(
        .a(a[2]),
        .b(b[2]),
        .cin(cout[1]),
        .cout(cout[2]),
        .sum(sum[2]),
    );

endmodule


module fullAdder( 
    input a, b, cin,
    output cout, sum );

    assign sum=a^b^cin;
    assign cout=a&b|b&cin|a&cin;

endmodule