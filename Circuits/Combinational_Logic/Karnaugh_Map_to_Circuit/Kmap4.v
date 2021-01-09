module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    // the out will flip when any single input flips,
    // this characteristic is similar to xor.
    assign out=a^b^c^d;

endmodule
