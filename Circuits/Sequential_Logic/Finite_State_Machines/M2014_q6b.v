module top_module (
    input [3:1] y,
    input w,
    output Y2);
    
    parameter A=3'h0,B=3'h1,C=3'h2,D=3'h3,E=3'h4,F=3'h5;
    
    reg [3:1] nextSt;
    always@(*) begin
        case(y)
            A:nextSt=w?A:B;
            B:nextSt=w?D:C;
            C:nextSt=w?D:E;
            D:nextSt=w?A:F;
            E:nextSt=w?D:E;
            default:nextSt=w?D:C;
        endcase
    end
    
    assign Y2=nextSt[2];

endmodule
