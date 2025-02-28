module BCDtoDecimal
(
    input [3:0] bcd,
    input wire reset,
  output reg [3:0] dec
);

  always @(*) begin
    if (reset)
	dec = 4’d0;
   else  if (bcd <= 4'd9) //making sure input is valid
            dec = bcd;
        else
            dec = 4'd0; //0 for any invalid input
    end

endmodule
