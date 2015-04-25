module simpleNet (input [1:0]x , 
                input clk, 
                  input signed [3:0] w0,
                  input signed [3:0] w1,
                  input signed [3:0] w2,
                  input signed [3:0] w3,
                  input signed [3:0] w4,
                  input signed [3:0] w5,
                  input signed [3:0] w6,
                  input signed [3:0] w7,
                  input signed [3:0] w8,
                  output y, output signed [3:0]tVal);
 
  wire y1;
  wire y2;
  wire y3;
  

  wire [3:0]t;
  wire [3:0]tt;
  wire [3:0]ttt;
  
  assign tVal = t;
  assign y = y3;
  
  innerNode A(clk,x[0],x[1],w0,w1,w2,y1,t);
  innerNode B(clk,x[0],x[1],w3,w4,w5,y2,tt);
  innerNode C(clk,y1,y2,w6,w7,w8,y3,ttt);
  
endmodule


module innerNode(input clk, 
                 input x1, 
                 input x2, 
                 input signed [3:0]wA, 
                 input signed [3:0]wB, 
                 input signed [3:0]b, 
                 output wOut,output signed [3:0]tVal);

      reg signed [3:0] holder;
      reg result;
      
  assign tVal = holder;
  assign wOut = result;
  
  always @ (posedge clk) begin
    holder = ( x1*wA+x2*wB ) - b;
    if ( holder > 4'b0000 )  begin
      result = 1'b1;
      end else begin
      result = 1'b0;
    end
  end
  
endmodule