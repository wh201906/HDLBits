module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    reg[31:0] tapList;
    assign tapList[31]=q[0];
    assign tapList[30:22]=9'd0;
    assign tapList[21]=q[0];
    assign tapList[20:2]=19'd0;
    assign tapList[1]=q[0];
    assign tapList[0]=q[0];

    always@(posedge clk) begin
        if(reset)
            q<=32'h1;
        else
            q<={q[0],q[31:1]}^tapList;
    end
endmodule
