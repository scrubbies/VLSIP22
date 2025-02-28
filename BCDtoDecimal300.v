module BCDtoDecimal_300 (
    input [1199:0] bcd,  // 300 BCD digits (each digit = 4 bits)
    input wire reset,
    output reg [1199:0] dec // 300 decimal outputs (each 4 bits)
);

integer i;

always @(*) begin
    if (reset)
        dec = 1200'd0; // Reset all outputs to zero
    else begin
        for (i = 0; i < 300; i = i + 1) begin
            if (bcd[(i+1)*4-1 : i*4] <= 4'd9) // Check if valid BCD
                dec[(i+1)*4-1 : i*4] = bcd[(i+1)*4-1 : i*4]; // Copy valid BCD
            else
                dec[(i+1)*4-1 : i*4] = 4'd0; // Set invalid BCD to 0
        end
    end
end

endmodule
