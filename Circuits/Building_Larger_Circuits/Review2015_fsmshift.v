module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    reg [2:0] counter;
    
    always@(posedge clk) begin
        if(reset)
            counter<=3'd0;
        else if(counter<3'd4)
            counter<=counter+3'd1;
    end
    
    assign shift_ena=counter<3'd4;

endmodule
