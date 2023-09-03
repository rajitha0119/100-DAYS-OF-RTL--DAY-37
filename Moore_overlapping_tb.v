`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2023 21:34:27
// Design Name: 
// Module Name: Moore_overlapping_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Moore_overlapping_tb(

    );
    reg clk,rst,x;
    wire z;
    
    
    moore_overlapping uut(clk,rst,x,z);
    initial clk=0;
    always #5 clk=~clk;
    
    initial begin
    $monitor("%0t:x=%0b,z=%0b",$time,x,z);
    x=0;
    rst=0;#1;
    rst=1;#2;
    #4 x=1;
    #4 x=0;
    #4 x=1;
    #4 x=0;
    #4 x=1;
    #4 x=0;
    #4 x=1;
    #4 x=0;
    #4 x=1;
    
   end 
endmodule
