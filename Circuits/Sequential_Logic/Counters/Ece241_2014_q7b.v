module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    reg[3:0] q0,q1,q2;
    wire [2:0] en;
    assign c_enable=en;
    assign en[0]=1'b1;
    
    bcdcount counter0 (
        .clk(clk),
        .reset(reset),
        .enable(en[0]),
        .Q(q0)
    );
    bcdcount counter1 (
        .clk(clk),
        .reset(reset),
        .enable(en[1]),
        .Q(q1)
    );
    bcdcount counter2 (
        .clk(clk),
        .reset(reset),
        .enable(en[2]),
        .Q(q2)
    );
    
    always@(*) begin
        en[1] = (q0==4'd9) ? 1'b1 : 1'b0;
        en[2] = (q1==4'd9 && q0==4'd9) ? 1'b1 : 1'b0;
        OneHertz = (q2==4'd9 && q1==4'd9 && q0==4'd9) ? 1'b1 : 1'b0;
    end

endmodule
