module top_module (input a, input b, input c, output out);//

    wire nout;
    assign out=~nout;
    andgate inst1 (nout, a, b, c, 1'b1, 1'b1 );

endmodule

// module andgate ( output out, input a, input b, input c, input d, input e );