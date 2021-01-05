module top_module( 
    input a, b, sel,
    output out ); 
    
    assign out=sel?b:a;
    // or
    // assign out=(sel&b)|(~sel&a);
    
endmodule