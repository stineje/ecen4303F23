// Created by ihdl
`timescale 1ns/10ps

`celldefine

module CLKBUF3 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.29:0.29:0.29,
       tphhl$A$Y = 0.3:0.3:0.3;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule

`endcelldefine
