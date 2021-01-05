module top_module( 
    input [255:0] in,
    input [7:0] sel,
    output out );

    reg[8:0] i;

    always@(*) begin
        out=1'b1;
        for(i=0;i<256;i=i+1) begin
            if(sel==i)
                out=in[i];
        end
    end

endmodule

// Official solution:
// assign out = in[sel];

// Fine.