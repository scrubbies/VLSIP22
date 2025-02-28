module BCDtoDecimal_300 (
    input clk,
    input reset,
    input [3:0] bcd_digit,
    output reg [1199:0] dec
);

reg [1199:0] shift_reg;
reg [8:0] index;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        shift_reg <= 1200'd0;
        index <= 9'd0;
    end 
    else if (index < 300) begin
        if (bcd_digit <= 4'd9) 
            shift_reg <= {shift_reg[1195:0], bcd_digit};
        else
            shift_reg <= {shift_reg[1195:0], 4'd0};
        
        index <= index + 1;
    end
end

assign dec = shift_reg;

endmodule
