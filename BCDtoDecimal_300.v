module BCDtoDecimal_300 (
    input clk,                // Clock signal
    input reset,              // Reset signal
    input [3:0] bcd_digit,    // One BCD digit per clock cycle
    output wire [1199:0] dec  // Must be a wire for continuous assignment
);

reg [1199:0] shift_reg; // 300 x 4-bit shift register
reg [8:0] index;        // 9-bit counter (0 to 299)

always @(posedge clk or posedge reset) begin
    if (reset) begin
        shift_reg <= 1200'd0; // Clear shift register
        index <= 9'd0;
    end 
    else if (index < 300) begin
        if (bcd_digit <= 4'd9) 
            shift_reg <= {shift_reg[1195:0], bcd_digit}; // Shift left and store
        else
            shift_reg <= {shift_reg[1195:0], 4'd0}; // Store 0 if invalid
        
        index <= index + 1;
    end
end

assign dec = shift_reg; // Now dec is a wire, so this works

endmodule
