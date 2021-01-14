module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
	
    always@(posedge clk) begin
        if(load)
            q<=data;
        else if(!ena)
            q<=q;
        else if(amount==2'b00)
            q<={q[62:0],1'd0};
        else if(amount==2'b01)
            q<={q[55:0],8'd0};
        else if(amount==2'b10)
            q<={q[63],q[63:1]};
        else
            q<={{8{q[63]}},q[63:8]};
    end
endmodule
