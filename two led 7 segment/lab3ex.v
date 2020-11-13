module lab3ex(
input [9:0] bin,
//output ports
output reg [11:0] bcd,
output reg [6:0] LED_1,LED_0
);
reg [3:0] i;
reg [9:0]count;


always @(bin)
begin
bcd = 0; //initialize bcd to zero.
for (i = 0; i < 10; i = i+1) //run for 10 iterations
begin
bcd = {bcd[10:0],bin[9-i]}; //concatenation

//if a hex digit of 'bcd' is more than 4, add 3 to it.  
if(i < 9 && bcd[3:0] > 4)
bcd[3:0] = bcd[3:0] + 3;
if(i < 9 && bcd[7:4] > 4)
bcd[7:4] = bcd[7:4] + 3;
if(i < 9 && bcd[11:8] > 4)
bcd[11:8] = bcd[11:8] + 3;  
end
end

always @(bcd) begin
case (bcd[3:0])
4'b0000:LED_0=7'b1111110;//0
4'b0001:LED_0=7'b0110000;//1
4'b0010:LED_0=7'b1101101;//2
4'b0011:LED_0=7'b1111001;//3
4'b0100:LED_0=7'b0110011;//4
4'b0101:LED_0=7'b1011011;//5
4'b0110:LED_0=7'b1011111;//6
4'b0111:LED_0=7'b1110000;//7
4'b1000:LED_0=7'b1111111;//8
4'b1001:LED_0=7'b1111011;//9
endcase

case (bcd[7:4])
4'b0000:LED_1=7'b1111110;
4'b0001:LED_1=7'b0110000;
4'b0010:LED_1=7'b1101101;
4'b0011:LED_1=7'b1111001;
4'b0100:LED_1=7'b0110011;
4'b0101:LED_1=7'b1011011;
4'b0110:LED_1=7'b1011111;
4'b0111:LED_1=7'b1110000;
4'b1000:LED_1=7'b1111111;
4'b1001:LED_1=7'b1111011;
endcase


//if(bcd[7:4]>=4'd3 && bcd[3:0]>4'd0) begin
//LED_0<=0;
//LED_1<=0;
//end
end


endmodule


