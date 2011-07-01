`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Christian Leonard Quale
// 
// Create Date:    07/01/2011 
// Module Name:    sevenseg1 
// Target Devices: All
// Description: 
// Takes a number between and including 0 and 99, and returns the power of ten,
// and power of one. Format: (clock, number, ^10, ^1)
// Dependencies: 
// DigitToSeg
//
// Revision: 
// Revision 0.5
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module SevenSegment2digit(clk, number, ten, one );

input [6:0] number;
input clk;
output [6:0] ten;
output [6:0] one;

wire [6:0] ten;
wire [6:0] one;
reg [3:0] tens;
reg [3:0] ones;


DigitToSeg left(clk, tens, ten);
DigitToSeg right(clk, ones, one);


	always @(posedge clk) begin

	if (number < 10) begin
	tens = 0;
	end if ((number > 9) && (number < 20)) begin
	tens = 1;
	end if ((number > 19) && (number < 30)) begin
	tens = 2;
	end if ((number > 29) && (number < 40)) begin
	tens = 3;
	end if ((number > 39) && (number < 50)) begin
	tens = 4;
	end if ((number > 49) && (number < 60)) begin
	tens = 5;
	end if ((number > 59) && (number < 70)) begin
	tens = 6;
	end if ((number > 69) && (number < 80)) begin
	tens = 7;
	end if ((number > 79) && (number < 90)) begin
	tens = 8;
	end if ((number > 89) && (number < 100)) begin
	tens = 9;
	end
	ones = (number - (tens * 10));
	end

endmodule
