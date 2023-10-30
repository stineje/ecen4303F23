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
       tplhl$B$Y = 0.039:0.039:0.039,
       tphlh$B$Y = 0.066:0.066:0.066,
       tplhl$A$Y = 0.041:0.041:0.041,
       tphlh$A$Y = 0.077:0.077:0.077,
       tplhl$C$Y = 0.033:0.033:0.033,
       tphlh$C$Y = 0.052:0.052:0.052;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule

`endcelldefine
