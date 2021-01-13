module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] lastIn;
    // I don't know why this is wrong
    // always@(posedge clk or posedge reset) begin
    always@(posedge clk) begin
        lastIn<=in;
        if(reset)
            out<=32'd0;
        else
            out<=(~in&lastIn)|out; 
    end
endmodule