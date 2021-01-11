module top_module (
    input d, 
    input ena,
    output q);

    always@(*)
        if(ena)
            // blocking or non-blocking?
            q = d;
endmodule
