module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter A = 2'h0, Bwait = 2'h1, B = 2'h2;
    reg [1:0] waitCounter;
    reg [2:0] inputArray;
    reg [1:0] inputCounter;
    reg [1:0] currSt,nextSt;

    always@(*) begin
        case(currSt)
                A: nextSt = s ? Bwait : A;
            Bwait: nextSt = (waitCounter==2'h2) ? B : Bwait;
                B: nextSt = B;
        endcase
    end

    always@(posedge clk)begin
        if(reset)
            currSt<=A;
        else
            currSt<=nextSt;
    end

    always @(posedge clk) begin
        if(reset) begin
            waitCounter <= 2'h0;
            inputArray <= 3'd0;
        end
        else if(currSt!=A) begin
            inputArray<={inputArray[1:0],w};
            if(currSt==Bwait)
                waitCounter<=waitCounter+2'h1;
        end
    end
    assign inputCounter=inputArray[0]+inputArray[1]+inputArray[2];
    assign z=(currSt==B && inputCounter==2'd2);

endmodule
