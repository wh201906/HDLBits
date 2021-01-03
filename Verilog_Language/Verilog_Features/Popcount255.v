module top_module( 
    input [254:0] in,
    output [7:0] out );

    reg [6:0] res0,res1,res2,res3;

    submodule2 mod0(
        .a(in[63:0]),
        .b(res0), );
    submodule2 mod1(
        .a(in[127:64]),
        .b(res1), );
    submodule2 mod2(
        .a(in[191:128]),
        .b(res2), );
    submodule2 mod3(
        .a({in[254:192],1'd0}),
        .b(res3), );

    always@(*) out=res0+res1+res2+res3;

endmodule

module submodule0(
    input [3:0] a,
    output [2:0] b );
    
    always@(*) begin
        case(a)
            4'b0000:b=3'd0;
            4'b1111:b=3'd4;
            4'b1000,4'b0100,4'b0010,4'b0001:b=3'd1;
            4'b1110,4'b1101,4'b1011,4'b0111:b=3'd3;
            default:b=2'd2;
        endcase
    end
    
endmodule

module submodule1(
    input [15:0] a,
    output [4:0] b );

    reg [2:0] res0,res1,res2,res3;

    submodule0 mod0(
        .a(a[3:0]),
        .b(res0), );
    submodule0 mod1(
        .a(a[7:4]),
        .b(res1), );
    submodule0 mod2(
        .a(a[11:8]),
        .b(res2), );
    submodule0 mod3(
        .a(a[15:12]),
        .b(res3), );

    always@(*) b=res0+res1+res2+res3;
    
endmodule

module submodule2(
    input [63:0] a,
    output [6:0] b );

    reg [4:0] res0,res1,res2,res3;

    submodule1 mod0(
        .a(a[15:0]),
        .b(res0), );
    submodule1 mod1(
        .a(a[31:16]),
        .b(res1), );
    submodule1 mod2(
        .a(a[47:32]),
        .b(res2), );
    submodule1 mod3(
        .a(a[63:48]),
        .b(res3), );

    always@(*) b=res0+res1+res2+res3;
    
endmodule

// Official solution:
// 
// module top_module (
// 	input [254:0] in,
// 	output reg [7:0] out
// );
// 
// 	always @(*) begin	// Combinational always block
// 		out = 0;
// 		for (int i=0;i<255;i++)
// 			out = out + in[i];
// 	end
// 	
// endmodule

// Fine.