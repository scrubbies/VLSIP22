module BCDtoDecimal (
    input clk,
    input reset,
    input [1199:0] bcd,
    output reg [2999:0] dec
);

reg [2999:0] result;
integer i;

always @(posedge clk or posedge reset) begin
    if (reset)
        result <= 3000'd0;
    else begin
        result <= 3000'd0; // Clear result
        for (i = 0; i < 300; i = i + 1) begin
            result <= (result * 10) + bcd[(i+1)*4-1 : i*4]; // Shift left and add
        end
    end
end

always @(posedge clk) begin
    dec <= result;
end

endmodule
