module bin2bcd(
//input ports
input [9:0] bin,
//output ports
output reg [11:0] bcd
);
//Internal variables
reg [3:0] i;

//Always block
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

endmodule