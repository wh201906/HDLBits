module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

// generate for
// much more convenient than instance array

    // genvar i; // <--
    // reg [100:0] c;
    // assign c[0]=cin;
    // assign cout=c[100];

    // generate for(i=0;i<100;i=i+1) 
    // begin: gfor // name is necessary
    //         bcd_fadd mod(
    //             .a(a[i*4+3:i*4]),
    //             .b(b[i*4+3:i*4]),
    //             .cin(c[i]),
    //             .cout(c[i+1]),
    //             .sum(sum[i*4+3:i*4]),
    //         );
    // end
    // endgenerate    

// instance array
    reg [99:0] cins,couts;
    assign cins[0]=cin;
    assign cins[99:1]=couts[98:0];
    assign cout=couts[99];
    bcd_fadd mod[99:0](
        .a(a),
        .b(b),
        .cin(cins),
        .cout(couts),
        .sum(sum),
    )

endmodule
