module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] lastIn;
    always@(posedge clk) begin
        lastIn <= in;
        anyedge <= in^lastIn;
    end
endmodule
