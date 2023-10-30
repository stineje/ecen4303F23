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
       tplhl$B$Y = 0.093:0.093:0.093,
       tphlh$B$Y = 0.087:0.087:0.087,
       tplhl$C$Y = 0.067:0.067:0.067,
       tphlh$C$Y = 0.06:0.06:0.06,
       tplhl$A$Y = 0.11:0.11:0.11,
       tphlh$A$Y = 0.09:0.09:0.09;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule

`endcelldefine
