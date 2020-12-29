`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire tmp1;
    wire tmp2;
    wire res;
    assign tmp1=a&b;
    assign tmp2=c&d;
    assign res=tmp1|tmp2;
    assign out=res;
    assign out_n=~res;

endmodule
