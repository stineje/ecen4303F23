// Created by ihdl
`timescale 1ns/10ps

`celldefine

module BUFX2 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.19:0.19:0.19,
       tphhl$A$Y = 0.18:0.18:0.18;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule

`endcelldefine
