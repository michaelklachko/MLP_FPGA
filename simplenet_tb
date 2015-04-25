//iverilog -o simplenet.vvp simplenet_tb.v
//vvp simplenet.vvp
`timescale 1ns/100ps
`include "simplenet.v"
module simplenet_tb;

  reg [1:0]x;
  reg clk;
  reg [3:0] w[8:0];
  reg y;
  
  // Instantiate design under test
  simpleNet simpleNet(x,clk,w,y);
          
  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    $display("Start Sim");
    clk = 0;
    x = 2'b00;
    w[0] = 4'b1010;
    w[1] = 4'b0011;
    w[2] = 4'b1010;
    display;
    clk = 1;
    display;
    clk = 0;
    display;
    clk = 0;
    display;
 
  end
  
  task display;
    #1 $display("clk:%0h, y:%0h, w[0]:%0b",
                clk, y, w[0]);
  endtask

endmodule