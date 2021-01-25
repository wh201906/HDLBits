module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);
    
    wire ss_up,mm_up,hh_up;

    bcd2 ssbcd(
        .clk(clk),
        .reset(reset),
        .ena(ena),
        .resetVal(8'h0),
        .threshold(8'h59),
        .afterThreshold(8'h0),
        .out(ss),
        .updated(ss_up)
    );

    bcd2 mmbcd(
        .clk(clk),
        .reset(reset),
        .ena(ss_up),
        .resetVal(8'h0),
        .threshold(8'h59),
        .afterThreshold(8'h0),
        .out(mm),
        .updated(mm_up)
    );

    bcd2 hhbcd(
        .clk(clk),
        .reset(reset),
        .ena(mm_up),
        .resetVal(8'h12),
        .threshold(8'h12),
        .afterThreshold(8'h1),
        .out(hh),
        .updated(hh_up)
    );

    always@(posedge clk) begin
        // hh_up is stuck to GND
        if(mm_up && hh==8'h11)
            pm<=~pm;
    end

endmodule

module bcd2(
    input clk,reset,ena,
    input [7:0] resetVal,
    input [7:0] threshold,
    input [7:0] afterThreshold,
    output [7:0] out, 
    output updated
);
    always@(posedge clk) begin
        if(reset) begin
            out<=resetVal;
        end
        else if(ena) begin
            if(out==threshold)
                out<=afterThreshold;
            else if(out[3:0]==4'h9) begin
                out[7:4]<=out[7:4]+4'h1;
                out[3:0]<=4'h0;
            end
            else
                out[3:0]<=out[3:0]+4'h1;
        end
    end

    always @(*) begin
        updated=(out==threshold && ena)?1'b1:1'b0;
    end
endmodule
