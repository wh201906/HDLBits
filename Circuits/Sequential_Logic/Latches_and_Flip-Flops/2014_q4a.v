module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire mid0,d;
    assign mid0 = E?w:Q;
    assign d = L?R:mid0;
    always@(posedge clk)
        Q <= d;
endmodule