module top_module(
    input clk,
    input load,
    input [255:0] data,
    output [255:0] q ); 

    reg [256*4-1:0] st;

    reg [255:0] nbr1,nbr2,nbr3,nbr4,nbr5,nbr6,nbr7,nbr8;
    assign nbr1={q[16:0],q[255:17]}; // wrong
    assign nbr2={q[15:0],q[255:16]};
    assign nbr3={q[14:0],q[255:15]}; // wrong
    assign nbr4={q[0],q[255:1]}; //wrong
    assign nbr5={q[255-1:0],q[255]}; //wrong
    assign nbr6={q[255-15:0],q[255:255-14]}; //wrong
    assign nbr7={q[255-16:0],q[255:255-15]}; 
    assign nbr8={q[255-17:0],q[255:255-16]}; //wrong


    generate
        genvar i;
        for(i=0;i<256;i=i+1) begin:gfor
            assign st[i*4+3:i*4]=nbr1[i]+nbr2[i]+nbr3[i]+nbr4[i]+nbr5[i]+nbr6[i]+nbr7[i]+nbr8[i];
            judge judgeInst(
                .clk(clk),
                .load(load),
                .data(data[i]),
                .st(st[i*4+3:i*4]),
                .q(q[i])
            );
        end
    endgenerate

endmodule

module judge(
    input clk,load,data,
    input [3:0] st,
    output q
);
    always@(posedge clk) begin
        if(load)
            q<=data;
        else begin
            case(st)
                4'd2:q<=q;
                4'd3:q<=1'b1;
                default:q<=1'b0;
            endcase
        end
    end
endmodule
