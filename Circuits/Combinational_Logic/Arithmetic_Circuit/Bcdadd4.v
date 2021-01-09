module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    genvar i;

    reg[4:0] c;
    assign c[0]=cin;
    assign cout=c[4];


    // no always there
    generate
        for(i=0;i<4;i=i+1) begin : anony
        bcd_fadd inst(
            .a(a[i*4+3:i*4]),
            .b(b[i*4+3:i*4]),
            .cin(c[i]),
            .cout(c[i+1]),
            .sum(sum[i*4+3:i*4]),
        );
        end
    endgenerate

endmodule
