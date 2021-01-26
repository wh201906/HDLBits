module top_module(
    input clk,
    input in,
    input areset,
    output out); //
	
    reg [1:0] st,nextSt;
    parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;
    
    // State transition logic
    always@(*) begin
        case(st)
            A:nextSt=in?B:A;
            B:nextSt=in?B:C;
            C:nextSt=in?D:A;
            D:nextSt=in?B:C;
        endcase
    end

    // State flip-flops with asynchronous reset
    always@(posedge clk or posedge areset) begin
        if(areset)
            st<=A;
        else
            st<=nextSt;
    end

    // Output logic
    assign out=st==D;

endmodule
