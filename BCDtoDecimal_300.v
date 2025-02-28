module BCDtoDecimal_300 (
    input clk,
    input reset,
    input [39:0] bcd_digit,
    output reg [39:0] dec
);

reg [8:0] index;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        dec <= 4'd0;
        index <= 0;
    end 
    else if (index < 300) begin
        if (bcd_digit <= 4'd9) 
            dec <= bcd_digit;
        else
            dec <= 4'd0;

        index <= index + 1;
    end
end

endmodule
