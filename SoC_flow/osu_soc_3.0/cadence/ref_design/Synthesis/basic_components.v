// Basic Components; muxes, flip-flops, etc.
//
// Author: Ivan Castellanos
// email: ivan.castellanos@okstate.edu
// VLSI Computer Architecture Research Group,
// Oklahoma Stata University


//Reduced Full Adder Cell (for CLA, 8 gates instead of 9)

module rfa (sum, g, p, a, b, cin);

   output sum;
   output g;
   output p;
   input a;
   input b;
   input cin;

   xor x1(sum, a, b, cin);
   and a1(g, a, b);
   or  o1(p, a, b);
   
endmodule


//17-bit Register with reset

module dffr_17 (q, d, clk, reset);

   output [16:0] q;
   input  [16:0] d;
   input  clk, reset;
   
   reg [16:0] q;
   
   always @ (posedge clk or negedge reset) 
      if (reset == 0)
         q <= 0; 
      else
         q <= d;

endmodule

