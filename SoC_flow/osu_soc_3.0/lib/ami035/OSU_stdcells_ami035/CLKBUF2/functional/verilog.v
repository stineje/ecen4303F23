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
       tpllh$A$Y = 0.32:0.32:0.32,
       tphhl$A$Y = 0.33:0.33:0.33;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule

`endcelldefine
