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
       tplhl$B$Y = 0.076:0.076:0.076,
       tphlh$B$Y = 0.13:0.13:0.13,
       tplhl$A$Y = 0.078:0.078:0.078,
       tphlh$A$Y = 0.15:0.15:0.15,
       tplhl$C$Y = 0.065:0.065:0.065,
       tphlh$C$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule

`endcelldefine
