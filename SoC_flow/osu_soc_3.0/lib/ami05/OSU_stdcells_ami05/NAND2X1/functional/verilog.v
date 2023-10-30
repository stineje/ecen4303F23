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
       tplhl$A$Y = 0.071:0.071:0.071,
       tphlh$A$Y = 0.1:0.1:0.1,
       tplhl$B$Y = 0.072:0.072:0.072,
       tphlh$B$Y = 0.092:0.092:0.092;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule

`endcelldefine
