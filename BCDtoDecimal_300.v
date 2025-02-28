module BCDtoDecimal_300 (
    input clk,           
    input reset,
    input [1199:0] bcd,
    output reg [1199:0] dec
);

integer i;
reg [8:0] index; // 9-bit register to count up to 300

always @(posedge clk or posedge reset) begin
    if (reset) begin
        dec <= 1200'd0;
        index <= 0;
    end 
    else if (index < 300) begin
        if (bcd[(index+1)*4-1 : index*4] <= 4'd9) 
            dec[(index+1)*4-1 : index*4] <= bcd[(index+1)*4-1 : index*4]; // Copy valid BCD
        else
            dec[(index+1)*4-1 : index*4] <= 4'd0; // Set invalid BCD to 0
        
        index <= index + 1; // Process one digit per clock cycle
    end
end

endmodule
