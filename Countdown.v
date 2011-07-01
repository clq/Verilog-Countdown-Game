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
module Countdown(clk, reset, from, current );
parameter CLOCK = 50000000;
input clk;
input reset;
input [6:0] from;
output [6:0] current;

reg [25:0] counter;
reg [6:0] current;



always @ (posedge clk) begin
if (reset) begin
current = from;
counter = 0;
end
if (counter < CLOCK) begin
counter = counter + 1;
end
if (counter >= CLOCK) begin
if (current > 0) begin
current = current - 1;
end
counter = 0;
end

end 


endmodule
