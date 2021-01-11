module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 


    // Assuming that sel==0 -> a, sel==1 -> b.
    //
    // According to some test, the NOT gate can be implemented by this
    // a==1, b==0, sel==x ---> out=~x
    //
    // and the AND gate cam be implemented by this
    // a==x, b==y, sel==x(or y) ---> out=x&y

    // mux_in[0] = c|d = ~(~(c|d)) = ~(~c&~d)
    // mux_in[1] = 0
    // mux_in[3] = c&d
    //
    // dont think like this:
    // mux_in[2] = ~(c^d) = ~((~c&d) | (c&~d)) = ~(~c&d)&~(c&~d)
    // the sequence is 00 01 11 10, not 00 01 10 11
    // the right expression:
    // mux_in[2] = ~d

    // Official solution:
    // assign mux_in[0] = (c ? 1 : (d ? 1 : 0));
	// assign mux_in[1] = 0;
	// assign mux_in[2] = d ? 0 : 1;
	// assign mux_in[3] = c ? (d ? 1 : 0) : 0;

    wire nc,nd;
    wire mid1,mid2,nmid1,nmid2;

    orGate ogInst(
        .a(c),
        .b(d),
        .out(mux_in[0]),
    );

    mux2 muxInst(
        .a(1'b0),
        .b(1'b0),
        .sel(1'b0),
        .out(mux_in[1]),
    );

    andGate agInst(
        .a(c),
        .b(d),
        .out(mux_in[3]),
    );

    notGate ngInst(
        .x(d),
        .y(mux_in[2])
    );

endmodule

module orGate(
    input a,b,
    output out
);
    wire na,nb,naanb;
    notGate nG1(
        .x(a),
        .y(na),
    );
    notGate nG2(
        .x(b),
        .y(nb),
    );
    andGate aG(
        .a(na),
        .b(nb),
        .out(naanb),
    );
    notGate nG3(
        .x(naanb),
        .y(out),
    );
endmodule

module andGate(
    input a,b,
    output out
);

    mux2 muxInst(
        .a(a),
        .b(b),
        .sel(a), // b is also ok
        .out(out)
    );

endmodule

module notGate(
    input x,
    output y
);
    
    mux2 muxInst(
        .a(1'b1),
        .b(1'b0),
        .sel(x),
        .out(y)
    );

endmodule

module mux2(
    input a,b,sel,
    output out
);

    assign out = sel?b:a;

endmodule