module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
    wire signa,signb;
    // sigx==1 if x is a positive number
    assign signa=~a[7];
    assign signb=~b[7];
    assign s=a+b;
    
    always@(*) begin
        if(signa^signb)
            // have different sign
            overflow=1'b0;
        else
            // have same sign
            overflow=~(signa^s[7]);
    end

endmodule