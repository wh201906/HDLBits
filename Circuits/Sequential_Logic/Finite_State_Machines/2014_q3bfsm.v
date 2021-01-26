module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

    reg [2:0] currSt,nextSt;
    always@(*) begin
        case(currSt)
            3'b000:nextSt=x?3'b001:3'b000;
            3'b001:nextSt=x?3'b100:3'b001;
            3'b010:nextSt=x?3'b001:3'b010;
            3'b011:nextSt=x?3'b010:3'b001;
            3'b100:nextSt=x?3'b100:3'b011;
        endcase
    end

    always @(posedge clk) begin
        if (reset)
            currSt<=3'b000;
        else
            currSt<=nextSt;
    end

    assign z=(currSt==3'b011 || currSt==3'b100)?1'b1:1'b0;
endmodule
