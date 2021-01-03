// synthesis verilog_input_version verilog_2001
module top_module (
    input [7:0] in,
    output reg [2:0] pos  );
    always@(*) begin
        casez(in)
            8'b10000000:pos=3'd7;
            8'b?1000000:pos=3'd6;
            8'b??100000:pos=3'd5;         
            8'b???10000:pos=3'd4;
            8'b????1000:pos=3'd3;
            8'b?????100:pos=3'd2;
            8'b??????10:pos=3'd1;
            8'b???????1:pos=3'd0;
            default:pos=3'd0;
        endcase
    end

endmodule


// for code like this:
// 
// casez (in[3:0])
//     4'bzzz1: out = 0;
//     4'bzz1z: out = 1;
//     4'bz1zz: out = 2;
//     4'b1zzz: out = 3;
//     default: out = 0;
// endcase
// 
// the sequence matters(has expression overlap).

// special case
// case(in) // synopsys parallel_case

// don't use casez with z/x or casex, just use casez with ?
// for equivalent behavior in simulation and synthesis
// see https://blog.csdn.net/icxiaoge/article/details/88853578