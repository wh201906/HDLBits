module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
	
    wire loadReq;
    reg [3:0] loadVar=4'd1;
    assign c_load=loadReq;
    assign c_d=loadVar;
    assign c_enable=enable;
    
    count4 the_counter (
        .clk(clk),
        .enable(enable),
        .load(loadReq),
        .d(loadVar),
        .Q(Q)
    );
    
    always@(*)
        if(reset)
            loadReq<=1;
        else if(Q==4'd12 && enable)
            loadReq<=1;
    	else
            loadReq<=0;

endmodule