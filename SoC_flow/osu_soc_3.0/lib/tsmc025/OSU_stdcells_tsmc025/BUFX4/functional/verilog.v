// Created by ihdl
`timescale 1ns/10ps

`celldefine

module BUFX4 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.12:0.12:0.12,
       tphhl$A$Y = 0.13:0.13:0.13;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule

`endcelldefine
