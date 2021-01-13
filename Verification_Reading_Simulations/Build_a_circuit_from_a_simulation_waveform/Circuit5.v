module top_module (
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [3:0] e,
    output [3:0] q );

    reg [3:0] q0,q1,q2,q3,dff;
    assign dff=d-b;
    assign q0=a+1;
    assign q1=q0+dff+1;
    assign q2=q0-1;
    assign q3=q0+dff;

    always@(*) begin
        case(c)
            4'd0:q=q0;
            4'd1:q=q1;
            4'd2:q=q2;
            4'd3:q=q3;
            default:q=4'hF;
        endcase
    end

endmodule