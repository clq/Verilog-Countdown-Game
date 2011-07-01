`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:28:57 06/30/2011 
// Design Name: 
// Module Name:    main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module main(clk, reset, multiply, stop, Led, seg, an, sw, dp );    

parameter CLOCK = 50000000;

	input reset;
	input multiply;
	input stop;	
	input clk;
	input [7:0] sw;
   output [7:0] Led;
	output [6:0] seg;
	output [3:0] an;
	output dp;

	
 
	reg [7:0] Led;
	reg [3:0] an = 4'b1111;
	reg [6:0] seg;
	wire [6:0] tens;
	wire [6:0] ones;
	reg [17:0] counter;
	reg [6:0] From;
	wire [6:0] Number;
	wire win;
	wire lose;
	reg pause = 1;
	reg startup;
	reg dp;

initial begin
startup = 1;
end

SevenSegment2digit A1(clk, Number, tens, ones);

Countdown C1(clk, reset, stop, From, Number, win, lose);



    always @(posedge clk)
    begin
	 if (stop) begin
	 pause <= 1;
	 end
Led = 0;
counter = counter + 1;

if ((8'b10000000 & sw) == 8'b10000000) begin
Led = Led + 1;
end if ((8'b01000000 & sw) == 8'b01000000) begin
Led = Led + 1;
end if ((8'b00100000 & sw) == 8'b00100000) begin
Led = Led + 1;
end if ((8'b00010000 & sw) == 8'b00010000) begin
Led = Led + 1;
end if ((8'b00001000 & sw) == 8'b00001000) begin
Led = Led + 1;
end if ((8'b00000100 & sw) == 8'b00000100) begin
Led = Led + 1;
end if ((8'b00000010 & sw) == 8'b00000010) begin
Led = Led + 1;
end if ((8'b00000001 & sw) == 8'b00000001) begin
Led = Led + 1;
end
if (multiply) begin
Led = Led * 2;
end

if ((counter == 18'b000000000000000001) && (tens != 7'b1000000) && (!pause)) begin
an <= 4'b0111;
seg <= tens;
end
if ((counter == 18'b100000000000000000) && (!pause)) begin
an <= 4'b1011;
seg <= ones;
end
if (reset) begin
From <= 10;
pause <= 0;
startup <= 0;
end

if (pause || lose) begin
if (win) begin
an <= 4'b1100;
seg <= 7'b1000001;
end
if (lose) begin
an <= 4'b1101;
seg <= 7'b1000111;
end
end

if (startup == 1) begin

if (counter == 18'b001111111100000001) begin
an <= 4'b0111;
seg <= 7'b1000110;
dp <= 1;
end

if (counter == 18'b100000000000000000) begin
an <= 4'b1011;
seg <= 7'b1000111;
dp <= 1;
end

if (counter == 18'b000000000000000001) begin
an <= 4'b1101;
seg <= 7'b1000000;
dp <= 0;
end

end

    end
endmodule
