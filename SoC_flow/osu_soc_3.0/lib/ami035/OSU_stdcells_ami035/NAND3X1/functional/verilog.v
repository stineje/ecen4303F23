// Created by ihdl
`timescale 1ns/10ps

`celldefine

module NAND3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$B$Y = 0.06:0.06:0.06,
       tphlh$B$Y = 0.1:0.1:0.1,
       tplhl$A$Y = 0.063:0.063:0.063,
       tphlh$A$Y = 0.12:0.12:0.12,
       tplhl$C$Y = 0.053:0.053:0.053,
       tphlh$C$Y = 0.076:0.076:0.076;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule

`endcelldefine
