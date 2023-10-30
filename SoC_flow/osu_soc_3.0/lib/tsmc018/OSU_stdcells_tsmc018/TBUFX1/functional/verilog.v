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
       tpzh$EN$Y = 0.064:0.064:0.064,
       tpzl$EN$Y = 0.021:0.021:0.021,
       tplz$EN$Y = 0.044:0.044:0.044,
       tphz$EN$Y = 0.059:0.059:0.059,
       tplhl$A$Y = 0.043:0.043:0.043,
       tphlh$A$Y = 0.062:0.062:0.062;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (EN *> Y) = (0, 0, tplz$EN$Y, tpzh$EN$Y, tphz$EN$Y, tpzl$EN$Y);

   endspecify

endmodule

`endcelldefine
