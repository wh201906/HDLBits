// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter A=1'b0, B=1'b1;

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            next_state<=B;
        end else begin
            case (present_state)
                // Fill in state transition logic
                B:next_state<=in?B:A;
                A:next_state<=in?A:B;
            endcase

            // State flip-flops
            present_state = next_state;   

            case (present_state)
                // Fill in output logic
                B:out<=1;
                A:out<=0;
            endcase
        end
    end

endmodule
