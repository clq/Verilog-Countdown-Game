`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Christian Leonard Quale
// 
// Create Date:    07/01/2011 
// Module Name:    DigitToSeg 
// Target Devices: All
//
// Description: 
// Converts a digit (0-9) to the corresponding 7-segment display.
// Format: (clock, Digit, segment)
//
// Dependencies: 
// None
// Revision: 
// Revision 0.5
// Additional Comments: 
// 0 is lit up, 1 is not lit up.
//////////////////////////////////////////////////////////////////////////////////
module DigitToSeg(clk, Digit, Segments );

input clk;
input [3:0] Digit;
output [6:0] Segments;

reg [6:0] Segments;

always @(posedge clk) begin

	if (Digit == 0) begin
	Segments <= 7'b1000000;
	end if (Digit == 1) begin
	Segments <= 7'b1111001;
	end if (Digit == 2) begin
	Segments <= 7'b0100100;
	end if (Digit == 3) begin
	Segments <= 7'b0110000;
	end if (Digit == 4) begin
	Segments <= 7'b0011001;
	end if (Digit == 5) begin
	Segments <= 7'b0010010;
	end if (Digit == 6) begin
	Segments <= 7'b0000010;
	end if (Digit == 7) begin
	Segments <= 7'b1111000;
	end if (Digit == 8) begin
	Segments <= 7'b0000000;
	end if (Digit == 9) begin
	Segments <= 7'b0011000;
	end
	
end
endmodule
