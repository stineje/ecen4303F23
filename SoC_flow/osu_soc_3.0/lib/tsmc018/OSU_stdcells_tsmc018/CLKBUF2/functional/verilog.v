// Created by ihdl
`timescale 1ns/10ps

`celldefine

module CLKBUF2 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.23:0.23:0.23,
       tphhl$A$Y = 0.24:0.24:0.24;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule

`endcelldefine
