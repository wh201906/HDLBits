// It seems that the given template suggests me 
// to write the whole logic in one always block, 
// but I failed to do so.
//  
// module top_module(clk, reset, in, out);
//     input clk;
//     input reset;    // Synchronous reset to state B
//     input in;
//     output out;//  
//     reg out;

//     // Fill in state name declarations
//     parameter A = 1'b0, B = 1'b1;
//     reg present_state, next_state;

//     always @(posedge clk) begin
//         if (reset) begin  
//             next_state<=B;
//         end else begin
//             case (present_state)
//                 // Fill in state transition logic
//                 A:next_state=(in==1)?A:B;
//                 B:next_state=(in==1)?B:A;
//             endcase

//             // State flip-flops
//             present_state = next_state;   

//             case (present_state)
//                 // Fill in output logic
//                 A:out=1'b0;
//                 B:out=1'b1;
//             endcase
//         end
//     end

// endmodule


module top_module(clk, reset, in, out);
    input clk;
    input reset;
    input in;
    output reg out;

    parameter A = 1'b0, B=1'b1;

    reg currSt,nextSt;

    assign out=currSt==A?1'b0:1'b1;

    always@(*) begin
        case(currSt)
            A:nextSt=in?A:B;
            B:nextSt=in?B:A;
        endcase
    end

    always @(posedge clk) begin
        currSt<=B;
        if(reset)
            currSt<=B;
        else
            currSt<=nextSt;
    end
endmodule