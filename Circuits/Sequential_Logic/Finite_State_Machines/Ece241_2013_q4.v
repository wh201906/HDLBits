module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    // Moore FSM
    parameter L0=3'b000,L1_fromL=3'b010,L1_fromH=3'b011,L2_fromL=3'b100,L2_fromH=3'b101,L3=3'b111;
    reg [2:0] currSt,nextSt;

    always@(*) begin
        if(s[3]) begin
            nextSt=L3;
        end
        else if(s[2]) begin
            if(currSt<L2_fromL)
                nextSt=L2_fromL;
            else if(currSt>L2_fromH)
                nextSt=L2_fromH;
            else
                nextSt=currSt;
        end
        else if(s[1]) begin
            if(currSt<L1_fromL)
                nextSt=L1_fromL;
            else if(currSt>L1_fromH)
                nextSt=L1_fromH;
            else
                nextSt=currSt;
        end
        else // s=3'b000;
            nextSt=L0;
    end

    always@(posedge clk) begin
        if(reset)
            currSt<=L0;
        else
            currSt<=nextSt;
    end

    always@(*) begin
        if(currSt==L0) begin
            fr3=1'b1;
            fr2=1'b1;
            fr1=1'b1;
            dfr=1'b1;
        end
        else if(currSt==L1_fromL) begin
            fr3=1'b0;
            fr2=1'b1;
            fr1=1'b1;
            dfr=1'b0;
        end
        else if(currSt==L1_fromH) begin
            fr3=1'b0;
            fr2=1'b1;
            fr1=1'b1;
            dfr=1'b1;
        end
        else if(currSt==L2_fromL) begin
            fr3=1'b0;
            fr2=1'b0;
            fr1=1'b1;
            dfr=1'b0;
        end
        else if(currSt==L2_fromH) begin
            fr3=1'b0;
            fr2=1'b0;
            fr1=1'b1;
            dfr=1'b1;
        end
        else begin // currSt==L3
            fr3=1'b0;
            fr2=1'b0;
            fr1=1'b0;
            dfr=1'b0;
        end
    end

endmodule
