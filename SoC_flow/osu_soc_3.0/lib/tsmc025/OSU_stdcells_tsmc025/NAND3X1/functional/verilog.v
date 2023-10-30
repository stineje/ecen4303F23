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
       tplhl$B$Y = 0.044:0.044:0.044,
       tphlh$B$Y = 0.086:0.086:0.086,
       tplhl$A$Y = 0.048:0.048:0.048,
       tphlh$A$Y = 0.1:0.1:0.1,
       tplhl$C$Y = 0.041:0.041:0.041,
       tphlh$C$Y = 0.065:0.065:0.065;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule

`endcelldefine
