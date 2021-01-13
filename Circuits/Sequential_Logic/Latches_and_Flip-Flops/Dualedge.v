module top_module (
    input clk,
    input d,
    output q
);
    wire nclk,ld;
    assign nclk=~clk;
    always@(posedge clk or posedge nclk) begin
        if(clk)
            q<=d;
        else
            q<=d;
    end
endmodule
