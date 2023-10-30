// Created by ihdl
`timescale 1ns/10ps

`celldefine

module XOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$B$Y = 0.096:0.096:0.096,
       tplhl$B$Y = 0.091:0.091:0.091,
       tpllh$A$Y = 0.085:0.085:0.085,
       tplhl$A$Y = 0.08:0.08:0.08;

     // path delays
     (A *> Y) = (tpllh$A$Y, tplhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tplhl$B$Y);

   endspecify

endmodule

`endcelldefine
