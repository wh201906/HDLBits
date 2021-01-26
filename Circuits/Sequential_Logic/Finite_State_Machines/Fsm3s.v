module top_module(
    input clk,
    input in,
    input reset,
    output out); //
	
    reg [3:0] st,nextSt;
    parameter A=4'b0001, B=4'b0010, C=4'b0100, D=4'b1000;
    
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
    always@(posedge clk) begin
        if(reset)
            st<=A;
        else
            st<=nextSt;
    end

    // Output logic
    assign out=st==D;

endmodule
