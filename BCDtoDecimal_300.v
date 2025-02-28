module BCDtoDecimal_300 (
    input clk,              // Clock signal
    input reset,            // Reset signal
    input [3:0] bcd_digit,  // One BCD digit per clock cycle
    output reg [3:0] dec    // Output one digit at a time
);

reg [8:0] index; // 9-bit counter to track 300 cycles

always @(posedge clk or posedge reset) begin
    if (reset) begin
        dec <= 4'd0;  // Reset output
        index <= 9'd0; // Reset cycle counter
    end 
    else if (index < 300) begin
        if (bcd_digit <= 4'd9) 
            dec <= bcd_digit; // Output valid BCD
        else
            dec <= 4'd0; // Replace invalid BCD with 0
        
        index <= index + 1; // Increment cycle count
    end
end

endmodule
