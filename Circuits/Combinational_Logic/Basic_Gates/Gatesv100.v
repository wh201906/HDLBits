module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );

    wire [99:0] in_LShifted,in_RShifted;

    assign in_LShifted={in[98:0],in[99]};
    assign in_RShifted={in[0],in[99:1]};

    assign out_both=in[98:0]&in_RShifted[98:0];
    assign out_any=in[99:1]|in_LShifted[99:1];
    assign out_different=in^in_RShifted;

endmodule