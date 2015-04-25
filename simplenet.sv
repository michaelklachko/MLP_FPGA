// Design
// D flip-flop
module simpleNet (input [1:0]x , 
            input clk, 
            input [3:0] w[8:0], 
            output y);
 
  wire y1;
  wire y2;
  wire y3;
  
  assign y = y1;
  
  innerNode A(clk,w[0],w[1],w[2],y1);
  innerNode B(clk,w[3],w[4],w[5],y2);
  innerNode C(clk,w[6],w[7],w[8],y3);
  
endmodule

module innerNode(input clk, input [3:0]wA, input [3:0]wB, input [3:0]b, output wOut);

  reg w;
  
  assign wOut = w;
  
  always @ (posedge clk) begin
    w = wA[1];
  end
  
endmodule