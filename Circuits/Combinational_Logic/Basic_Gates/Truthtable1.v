module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
    always@(*) begin
        case({x3,x2,x1})
            3'd0,3'd1,3'd4,3'd6:f=1'd0;
            default:f=1'd1; 
        endcase
    end
endmodule
