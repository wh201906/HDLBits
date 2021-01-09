module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    
    // treat 'd' as anything you want.
    // assign out = a | ~b&c;
    assign out = (a|c) & (a|~b|~c);
    
endmodule