module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);

    parameter A=0,B=1,C=2,D=3,E=4,F=5;
    
    reg [5:0] nextSt;
    always@(*) begin
        nextSt[A] = ~w && (y[A] || y[D]);
        nextSt[B] = w && (y[A]);
        nextSt[C] = w && (y[B] || y[F]);
        nextSt[D] = ~w && (y[B] || y[C] || y[E] || y[F]);
        nextSt[E] = w && (y[C] || y[E]);
        nextSt[F] = w && (y[D]);
    end
    
    assign Y1=nextSt[1];
    assign Y3=nextSt[3];

endmodule
