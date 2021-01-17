module top_module ( );
    reg clk;
    initial clk=0;
    dut dutInst(
        .clk(clk)
    );
    always begin
    	#5;
        clk=~clk;
    end
endmodule
