module top_module (input x, input y, output z);
    wire mid0,mid1,mid2,mid3,mid4,mid5;
    A IA1(
        .x(x),
        .y(y),
        .z(mid0),
    );
    B IB1(
        .x(x),
        .y(y),
        .z(mid1),
    );
    A IA2(
        .x(x),
        .y(y),
        .z(mid2),
    );
    B IB2(
        .x(x),
        .y(y),
        .z(mid3),
    );

    assign mid4=mid0|mid1;
    assign mid5=mid2&mid3;
    assign z=mid4^mid5;

endmodule

module A (input x, input y, output z);
    assign z = (x^y) & x;
endmodule

module B ( input x, input y, output z );
    assign z=~(x^y);
endmodule
