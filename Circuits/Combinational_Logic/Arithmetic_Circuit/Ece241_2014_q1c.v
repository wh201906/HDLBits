module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
    reg [8:0] tmp;
    assign tmp=a+b;
    assign s=tmp[7:0];
    assign s=tmp[8];

endmodule
