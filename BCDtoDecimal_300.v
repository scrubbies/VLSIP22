module BCDtoDecimal_300 (
    input clk,            
    input reset,          
    input [1199:0] bcd,   
    output reg [1199:0] dec 
);

integer i;
reg [8:0] index;
reg [3:0] temp_bcd;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        dec <= 1200'd0;
        index <= 0;
    end 
    else if (index < 300) begin
        // Extract BCD digit into a temporary register
        temp_bcd = bcd[(index * 4) +: 4];
        
        // Check validity and store in output
        if (temp_bcd <= 4'd9) 
            dec[(index * 4) +: 4] <= temp_bcd;
        else
            dec[(index * 4) +: 4] <= 4'd0;
        
        index <= index + 1;
    end
end

endmodule
