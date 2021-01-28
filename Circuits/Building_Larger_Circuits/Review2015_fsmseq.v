module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);

    parameter stateR = 3'h0, state1 = 3'h1, state11 = 3'h2, state110 = 3'h3, state1101 = 3'h4;
    reg [2:0] currSt, nextSt;

    always @(posedge clk) begin
        if(reset)
            currSt<=stateR;
        else
            currSt<=nextSt;
    end

    always @(*) begin
        case(currSt)
            stateR:nextSt=data?state1:stateR;
            state1:nextSt=data?state11:stateR;
            state11:nextSt=data?state11:state110;
            state110:nextSt=data?state1101:stateR;
            state1101:nextSt=state1101;
        endcase
    end

    assign start_shifting=currSt==state1101;

endmodule
