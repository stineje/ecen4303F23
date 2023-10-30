// Created by ihdl
`timescale 1ns/10ps

`celldefine

module INVX1 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.091:0.091:0.091,
       tphlh$A$Y = 0.081:0.081:0.081;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule

`endcelldefine
