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
       tplhl$B$Y = 0.13:0.13:0.13,
       tphlh$B$Y = 0.099:0.099:0.099,
       tplhl$C$Y = 0.083:0.083:0.083,
       tphlh$C$Y = 0.064:0.064:0.064,
       tplhl$A$Y = 0.15:0.15:0.15,
       tphlh$A$Y = 0.11:0.11:0.11;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule

`endcelldefine
