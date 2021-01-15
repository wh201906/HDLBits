module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 

    reg [256*4-1:0] st;

    generate
        genvar i;
        for(i=0;i<256;i=i+1) begin:gfor
            adder8 adder8Inst(
                .in({q[i+1],q[i-1],q[i+15],q[i+16],q[i+17],q[i-15],q[i-16],q[i-17]}),
                .out(st[i*4+3:i*4])
            );
        end
    endgenerate
    adder8 add(
        .in(8'b0),
        .out(q[7:0])
    );

    always@(posedge clk) begin
        if(load)
            q<=data;
    end
endmodule

module adder2(
    input [1:0] in,
    output [1:0] out
);
    assign out[0]=in[0]^in[1];
    assign out[1]=in[0]&in[1];
endmodule

module adder8(
    input [7:0] in,
    output [3:0] out
);

    reg [7:0] o;
    generate
        genvar i;
        for(i=0;i<4;i=i+1) begin:gfor
            adder2 adder2Inst(
                .in(in[i*2+1:i*2]),
                .out(o[i*2+1:i*2])
            );
        end
    endgenerate

    assign out=o[1:0]+o[3:2]+o[5:4]+o[7:6];

endmodule