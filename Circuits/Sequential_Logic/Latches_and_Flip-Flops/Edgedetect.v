module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] lastIn;
    always@(posedge clk) begin
        pedge = ~lastIn&in;
        lastIn = in;
    end
    
    // Official solution(non-blocking):
    // reg [7:0] d_last;	
	// 
	// always @(posedge clk) begin
	//  	d_last <= in;			// Remember the state of the previous cycle
	//      pedge <= in & ~d_last;	// A positive edge occurred if input was 0 and is now 1.
	// end
    // 
    // In non-blocking assignment, the RHS is calculated first then all the assignments are done together.
    // so "d_last" is not equal to "in" the block. 

endmodule