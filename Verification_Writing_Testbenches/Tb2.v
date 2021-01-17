module top_module();

    reg clk;
    reg in;
    reg [2:0] s;
    wire out;
    
    q7 q7Inst(clk,in,s,out);
    
    initial begin
        clk=0;
        in=1'b0;
        s=3'd2;
        #10
        s=3'd6;
        #10
        in=1'b1;
        s=3'd2;
        #10
        in=1'b0;
        s=3'd7;
        #10
        in=1'b1;
        s=3'd0;
        #30
        in=1'b0;
    end
    
    always begin
        #5
        clk=~clk;
    end
endmodule
