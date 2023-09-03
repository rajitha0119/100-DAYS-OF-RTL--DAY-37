`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2023 20:54:31
// Design Name: 
// Module Name: moore_overlapping
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

//moore sequence detector for 1011
module moore_overlapping(
    input clk,
    input x,
    input reset,
    output reg z
    );
    parameter rst=3'b000;
    parameter got1=3'b001;
    parameter got10=3'b010;
    parameter got101=3'b011;
    parameter got1011=3'b100;
    
    reg [2:0]pst,nst;
    always@(posedge clk)
    begin
    if(!reset)
    begin
    pst<=rst;
    end
    else
    pst<=nst;
    end
    
    always@(pst or x)
    begin
    case(pst)
    rst:
    begin
    z=0;
    nst=x?got1:rst;
    end
    got1:begin
    z=0;
    nst=x?got1:got10;
     $display(pst);
    end
    got10:begin
    z=0;
    nst=x?got101:rst;
     $display(pst);
    end
    got101:begin
    z=0;
    nst=x?got1011:got10;
     $display(pst);
    end
    got1011:begin
    z=1;
    nst=x?got101:rst;
    $display(pst);
    end
    endcase
    end
endmodule
