module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);

    parameter A=1,B=2,C=3,D=4,E=5,F=6;
    
    reg [6:1] nextSt;
    always@(*) begin
        nextSt[A] = w && (y[A] || y[D]);
        nextSt[B] = ~w && (y[A]);
        nextSt[C] = ~w && (y[B] || y[F]);
        nextSt[D] = w && (y[B] || y[C] || y[E] || y[F]);
        nextSt[E] = ~w && (y[C] || y[E]);
        nextSt[F] = ~w && (y[D]);
    end
    
    assign Y2=nextSt[2];
    assign Y4=nextSt[4];

endmodule
