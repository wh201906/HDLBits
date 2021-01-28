module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    parameter walkLeft = 2'h0, walkRight = 2'h1;
    reg currDirection,nextDirection,hasGround;

    always @(*) begin
        case(currDirection)
            walkLeft:nextDirection=(bump_left&&hasGround)?walkRight:walkLeft;
            walkRight:nextDirection=(bump_right&&hasGround)?walkLeft:walkRight;
        endcase
    end

    always @(posedge clk or posedge areset) begin
        if(areset) begin
            hasGround<=1'b1;
            currDirection<=walkLeft;
        end
        else begin
            hasGround<=ground;
            currDirection<=nextDirection;
        end
    end

    always @(*) begin
        if(~hasGround) begin
            aaah=1'b1;
            walk_left=1'b0;
            walk_right=1'b0;
        end
        else begin
            aaah=1'b0;
            walk_left=currDirection==walkLeft;
            walk_right=currDirection==walkRight;
        end

    end
endmodule
