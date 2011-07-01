`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:56:28 07/01/2011 
// Design Name: 
// Module Name:    Countdown 
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
module Countdown(clk, reset, stop, from, current, win, lose );
parameter CLOCK = 50000000;
input clk;
input reset;
input stop;
input [6:0] from;
output [6:0] current;
output win;
output lose;

reg [25:0] counter;
reg [6:0] current;
reg win = 0;
reg lose = 0;
reg pause = 1;



always @ (posedge clk) begin

if ((stop) && (pause == 0)) begin
pause <= 1;

	if (current == 0) begin
	win <= 1;
	lose <= 0;
	end
	
	if (current != 0) begin
	lose <= 1;
	win <= 0;
	end
	
end


	if (reset) begin
	current = from;
	counter = 0;
	pause <= 0;
	lose <= 0;
	win <= 0;
	end
	
	if ((counter < CLOCK) && (pause == 0)) begin
	counter = counter + 1;
	end
	
	if ((counter >= CLOCK) && (pause == 0)) begin
	
		
		
		if (current == 0) begin
		lose <= 1;
		pause <= 1;
		end
		
		if (current > 0) begin
		current = current - 1;
		end
	
	counter = 0;
	end


end 


endmodule
