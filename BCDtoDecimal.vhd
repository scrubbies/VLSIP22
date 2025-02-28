module BCDtoDecimal
(
    input [7:0] bcd,
    input wire reset,
  output reg [7:0] dec
);

  always @(*) begin
    if (reset)
	dec = 8'd0;
   else  if (bcd <= 4'd9) //making sure input is valid
            dec = bcd;
        else
            dec = 8'd0; //0 for any invalid input
    end

endmodule
