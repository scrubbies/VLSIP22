module BCDtoDecimal_300 (
    input clk,              // Clock for sequential processing
    input reset,            // Reset signal
    input [3:0] bcd_digit,  // One 4-bit BCD digit per clock cycle
    output reg [3:0] dec    // Output one valid decimal digit at a time
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        dec <= 4'd0;     // Reset output
    end 
    else begin
        // Process only one BCD digit at a time
        if (bcd_digit <= 4'd9) 
            dec <= bcd_digit; // Store valid BCD
        else
            dec <= 4'd0; // Invalid BCD → Store 0
    end
end

endmodule
