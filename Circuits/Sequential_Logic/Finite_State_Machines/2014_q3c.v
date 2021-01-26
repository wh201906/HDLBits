module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

    reg [2:0] nextSt;
    always@(*) begin
        case(y)
            3'b000:nextSt=x?3'b001:3'b000;
            3'b001:nextSt=x?3'b100:3'b001;
            3'b010:nextSt=x?3'b001:3'b010;
            3'b011:nextSt=x?3'b010:3'b001;
            3'b100:nextSt=x?3'b100:3'b011;
            default:nextSt=3'b000;
        endcase
    end

    assign Y0=nextSt[0];
    assign z=(y==3'b011 || y==3'b100)?1'b1:1'b0;

endmodule
