// Created by ihdl
`timescale 1ns/10ps

`celldefine

module NOR3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$B$Y = 0.069:0.069:0.069,
       tphlh$B$Y = 0.065:0.065:0.065,
       tplhl$C$Y = 0.049:0.049:0.049,
       tphlh$C$Y = 0.048:0.048:0.048,
       tplhl$A$Y = 0.077:0.077:0.077,
       tphlh$A$Y = 0.07:0.07:0.07;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule

`endcelldefine
