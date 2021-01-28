module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    
    parameter A=3'h0,B=3'h1,C=3'h2,D=3'h3,E=3'h4,F=3'h5;
    
    reg [2:0] currSt,nextSt;

    always@(*) begin
        case(currSt)
            A:nextSt=w?A:B;
            B:nextSt=w?D:C;
            C:nextSt=w?D:E;
            D:nextSt=w?A:F;
            E:nextSt=w?D:E;
            default:nextSt=w?D:C;
        endcase
    end
    
    always @(posedge clk) begin
        if(reset)
            currSt<=A;
        else
            currSt<=nextSt;
    end

    assign z = (currSt==E || currSt==F);

endmodule
