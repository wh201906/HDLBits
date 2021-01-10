module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    wire [7:0] mux0, mux1;
    mux2 inst_mux0 ( sel[0],    a,    b, mux0 );
    mux2 inst_mux1 ( sel[0],    c,    d, mux1 );
    mux2 inst_mux2 ( sel[1], mux0, mux1,  out );

endmodule

// module mux2 (
//     input sel,
//     input [7:0] a,
//     input [7:0] b,
//     output [7:0] out
// );