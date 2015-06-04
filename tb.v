//iverilog -o simplenet.vvp simplenet_tb.v
//vvp simplenet.vvp
`timescale 1ns/100ps
`include "simplenet.v"
module simplenet_tb;

  reg [1:0]x;
  reg clk;
  reg signed [3:0] w0;
  reg signed [3:0] w1;
  reg signed [3:0] w2;
  reg signed [3:0] w3;
  reg signed [3:0] w4;
  reg signed [3:0] w5;
  reg signed [3:0] w6;
  reg signed [3:0] w7;
  reg signed [3:0] w8;
  wire y;
  
  // Instantiate design under test
  simpleNet simpleNet(x,clk,w0,w1,w2,w3,w4,w5,w6,w7,w8,y);
          
reg [1:0] cycles;

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    
    $display("Start Sim");
    clk = 0;
    x = 2'b11; // What values of weights will make y operate as an output of XOR
    cycles = 2'd0;
    w0 = 4'b0010;  //from first input to first neuron = 2
    w1 = 4'b0010;  //from second input to first neuron = 2
    w2 = 4'b0001;  //bias to first neuron = 1
    w3 = 4'b0010;  //from first input to second neuron = 2
    w4 = 4'b0010;  //from second input to second neuron = 2
    w5 = 4'b0011;  //bias to second neuron = 3
    w6 = 4'b0010;  //from first neuron to output neuron = 2
    w7 = 4'b1110;  //from second neuron to output neuron = -2
    w8 = 4'b0001;  //bias to output neuron  = 1
end

always #1 clk=~clk;

always @(negedge clk)
begin
    cycles = cycles + 2'd1;
    if(cycles==2'd3)
    begin
        x=x-1;
    end
end
endmodule
