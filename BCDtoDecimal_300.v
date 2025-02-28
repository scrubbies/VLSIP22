module BCDtoDecimal_300 (
    input clk,
    input reset,
    input [1199:0] bcd,
    output reg [1199:0] dec
);

genvar i;

generate
    for (i = 0; i < 300; i = i + 1) begin : BCD_PROCESS
        always @(posedge clk or posedge reset) begin
            if (reset)
                dec[(i+1)*4-1 : i*4] <= 4'd0;
            else if (bcd[(i+1)*4-1 : i*4] <= 4'd9) 
                dec[(i+1)*4-1 : i*4] <= bcd[(i+1)*4-1 : i*4];
            else
                dec[(i+1)*4-1 : i*4] <= 4'd0;
        end
    end
endgenerate

endmodule
