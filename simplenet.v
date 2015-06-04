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
                  output y);
 
  wire y1;
  wire y2;
  wire y3;
  
  assign y = y3;
  
  innerNode A(clk,x[0],x[1],w0,w1,w2,y1);
  innerNode B(clk,x[0],x[1],w3,w4,w5,y2);
  innerNode C(clk,y1,y2,w6,w7,w8,y3);
  
endmodule


module innerNode(input clk, 
                 input x1, 
                 input x2, 
                 input signed [3:0]wA, 
                 input signed [3:0]wB, 
                 input signed [3:0]b, 
                 output wOut);

localparam signed [5:0] THRESHOLD = 6'd0;

wire  signed [5:0] holder;
reg result;
wire signed [5:0] x1_ext = {5'd0, x1};
wire signed [5:0] x2_ext = {5'd0, x2};

assign holder = ( x1_ext*wA+x2_ext*wB ) - b;

always @ (posedge clk)
begin
    if ( holder > THRESHOLD )  begin
      result <= 1'b1;
      end else begin
      result <= 1'b0;
    end
end

assign wOut = result;
  
endmodule