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
       tplhl$B$Y = 0.2:0.2:0.2,
       tphlh$B$Y = 0.12:0.12:0.12,
       tplhl$C$Y = 0.14:0.14:0.14,
       tphlh$C$Y = 0.086:0.086:0.086,
       tplhl$A$Y = 0.24:0.24:0.24,
       tphlh$A$Y = 0.13:0.13:0.13;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule

`endcelldefine
