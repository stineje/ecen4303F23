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
       tpllh$A$Y = 0.12:0.12:0.12,
       tplhl$A$Y = 0.12:0.12:0.12,
       tpllh$B$Y = 0.15:0.15:0.15,
       tplhl$B$Y = 0.14:0.14:0.14;

     // path delays
     (A *> Y) = (tpllh$A$Y, tplhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tplhl$B$Y);

   endspecify

endmodule

`endcelldefine
