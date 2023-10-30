// Created by ihdl
`timescale 1ns/10ps

`celldefine

module TBUFX1 (A, EN, Y);
input  A ;
input  EN ;
output Y ;

   not (I0_out, A);
   bufif1 (Y, I0_out, EN);

   specify
     // delay parameters
     specparam
       tpzh$EN$Y = 0.14:0.14:0.14,
       tpzl$EN$Y = 0.053:0.053:0.053,
       tplz$EN$Y = 0.056:0.056:0.056,
       tphz$EN$Y = 0.11:0.11:0.11,
       tplhl$A$Y = 0.098:0.098:0.098,
       tphlh$A$Y = 0.12:0.12:0.12;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (EN *> Y) = (0, 0, tplz$EN$Y, tpzh$EN$Y, tphz$EN$Y, tpzl$EN$Y);

   endspecify

endmodule

`endcelldefine
