// Created by ihdl
`timescale 1ns/10ps

`celldefine

module XNOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.16:0.16:0.16,
       tplhl$A$Y = 0.15:0.15:0.15,
       tpllh$B$Y = 0.18:0.18:0.18,
       tplhl$B$Y = 0.17:0.17:0.17;

     // path delays
     (A *> Y) = (tpllh$A$Y, tplhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tplhl$B$Y);

   endspecify

endmodule

`endcelldefine
