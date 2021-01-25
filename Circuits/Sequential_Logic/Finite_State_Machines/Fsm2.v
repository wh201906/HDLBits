module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        if(state==OFF)
            next_state=(j==1'b0)?OFF:ON;
        else
            next_state=(k==1'b0)?ON:OFF;
    end

    always @(posedge clk, posedge areset) begin
        if(areset)
            state<=OFF;
        else
            state<=next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state==ON)?1'b1:1'b0;

endmodule
