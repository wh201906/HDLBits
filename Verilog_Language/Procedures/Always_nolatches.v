// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  );

    always@(*) begin

        // NECESSARY, see Always_if2.v
        up = 1'b0; down = 1'b0; left = 1'b0; right = 1'b0;
        
        case(scancode)
            16'hE06B:left=1'd1;
            16'hE072:down=1'd1;
            16'hE074:right=1'd1;
            16'hE075:up=1'd1;
            default: begin
                up = 1'b0; down = 1'b0; left = 1'b0; right = 1'b0;
            end
        endcase
    end
endmodule

