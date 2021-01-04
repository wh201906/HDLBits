module top_module( 
    input [254:0] in,
    output reg [7:0] out );

    wire [6:0] res0,res1,res2,res3;

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
    output reg [2:0] b );
    
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
    output reg [4:0] b );

    wire [2:0] res0,res1,res2,res3;

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
    output reg [6:0] b );

    wire [4:0] res0,res1,res2,res3;

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
//     integer i;
// 
// 	   always @(*) begin	// Combinational always block
// 	   	   out = 0;
// 	   	   for (i=0;i<255;i=i+1)
// 	   		   out = out + in[i];
// 	   end
// 	
// endmodule

// Fine.
// In the RTL view, my solution partially goes parallel,
// while the official solution is a lot of adders connected in series.
// For all "b" in submodulex and "out" in top_module, they need to be declared as "output reg"(in my Quartus 18.1)
// For "resx" in submodule 1~2 (no 0) and top_module, the need to be declared as "wire" rather than "reg"(in my Quartus 18.1)
