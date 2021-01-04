module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    wire mid;
    assign mid=~(in1^in2);
    assign out=mid^in3;
endmodule
