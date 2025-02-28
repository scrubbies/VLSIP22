module BCDtoDecimal
(
    input [1199:0] bcd,
  output reg [2999:0] dec
);

integer i;
always @(*) begin
    for (i = 0; i < 300; i = i + 1) begin
        case (bcd[(i+1)*4-1 : i*4])  // Extract 4-bit BCD digit
            4'd0: binary[(i+1)*10-1 : i*10] = 10'd0;
            4'd1: binary[(i+1)*10-1 : i*10] = 10'd1;
            4'd2: binary[(i+1)*10-1 : i*10] = 10'd2;
            4'd3: binary[(i+1)*10-1 : i*10] = 10'd3;
            4'd4: binary[(i+1)*10-1 : i*10] = 10'd4;
            4'd5: binary[(i+1)*10-1 : i*10] = 10'd5;
            4'd6: binary[(i+1)*10-1 : i*10] = 10'd6;
            4'd7: binary[(i+1)*10-1 : i*10] = 10'd7;
            4'd8: binary[(i+1)*10-1 : i*10] = 10'd8;
            4'd9: binary[(i+1)*10-1 : i*10] = 10'd9;
            default: binary[(i+1)*10-1 : i*10] = 10'd0; // Invalid case
        endcase
    end
end

endmodule
