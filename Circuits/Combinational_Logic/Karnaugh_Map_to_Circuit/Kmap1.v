module top_module(
    input a,
    input b,
    input c,
    output out  ); 

    // assign out = a&~b | ~b&c | b; // sum of products
    assign out = (a|b|c); // product of sums

endmodule