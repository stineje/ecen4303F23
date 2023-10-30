// Created by ihdl
`timescale 1ns/10ps

`celldefine

module NAND2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.033:0.033:0.033,
       tphlh$A$Y = 0.054:0.054:0.054,
       tplhl$B$Y = 0.031:0.031:0.031,
       tphlh$B$Y = 0.046:0.046:0.046;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule

`endcelldefine
