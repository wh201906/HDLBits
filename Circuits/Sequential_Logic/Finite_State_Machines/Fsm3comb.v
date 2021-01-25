module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: next_state = f(state, in)
    always@(*) begin
        if(state==A)
            next_state=(in==0)?A:B;
        else if(state==B)
            next_state=(in==0)?C:B;
        else if(state==C)
            next_state=(in==0)?A:D;
        else
            next_state=(in==0)?C:B;
    end

    // Output logic:  out = f(state) for a Moore state machine
    assign out=(state==D)?1:0;

endmodule
