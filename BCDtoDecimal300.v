module BCDtoDecimal (
    input clk,
    input reset,
    input [1199:0] bcd,
    output reg [2999:0] dec
);

reg [2999:0] result;
reg [8:0] index;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        result <= 3000'd0;
        dec <= 3000'd0;
        index <= 0;
    end 
    else if (index < 300) begin
        result = (result << 3) + (result << 1);
        result = result + bcd[(index+1)*4-1 : index*4];
        index <= index + 1;
    end 
    else begin
        dec <= result;
    end
end

endmodule
