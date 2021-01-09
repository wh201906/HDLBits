module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
	
    // in SoP, 0 -> ~
    // assign out = ~a&~d | ~b&~c | b&c&d | a&c&d |~a&~c&~d;
    // in PoS, 1 -> ~
    assign out = (~a|~b|c) & (~b|c|~d) & (~a|~c|d) & (a|b|~c|~d);
    
endmodule