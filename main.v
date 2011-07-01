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
module main(clk, reset, multiply, Led, seg, an, sw );    
 
	input reset;
	input multiply;
	input clk;
	input [7:0] sw;
   output [7:0] Led;
	output [6:0] seg;
	output [3:0] an;

	
 
	reg [7:0] Led;
	reg [3:0] an;
	reg [6:0] seg;
	wire [6:0] tens;
	wire [6:0] ones;
	reg [17:0] counter;
	reg [7:0] From;
	wire [6:0] Number;


SevenSegment2digit A1(clk, Number, tens, ones);

Countdown C1(clk, reset, From, Number);

    always @(posedge clk)
    begin
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


if ((counter == 18'b000000000000000001) && (tens != 7'b1000000)) begin
an <= 4'b0111;
seg <= tens;
end
if (counter == 18'b100000000000000000) begin
an <= 4'b1011;
seg <= ones;
end
if (reset) begin
From <= Led;
end

    end
endmodule
