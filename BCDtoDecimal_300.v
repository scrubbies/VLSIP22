module BCDtoDecimal_300 (
    input clk,               // Clock signal
    input reset,             // Reset signal
    input [39:0] bcd_digits, // 10 BCD digits (each 4 bits)
    output reg [39:0] dec    // 10 decimal outputs (each 4 bits)
);

reg [3:0] digit_store [0:9]; // 10 x 4-bit registers
reg [8:0] index; // 9-bit counter
integer i;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        for (i = 0; i < 10; i = i + 1)
            digit_store[i] <= 4'd0; // Reset all registers
        index <= 9'd0;
    end 
    else if (index < 30) begin // Repeat 30 times for 300 digits
        for (i = 0; i < 10; i = i + 1) begin
            if (bcd_digits[(i+1)*4-1 : i*4] <= 4'd9)
                digit_store[i] <= bcd_digits[(i+1)*4-1 : i*4]; // Store valid BCD
            else
                digit_store[i] <= 4'd0; // Replace invalid BCD with 0
        end
        index <= index + 1;
    end
end

// Assign stored digits to the output
always @(posedge clk) begin
    for (i = 0; i < 10; i = i + 1)
        dec[(i+1)*4-1 : i*4] <= digit_store[i];
end

endmodule
