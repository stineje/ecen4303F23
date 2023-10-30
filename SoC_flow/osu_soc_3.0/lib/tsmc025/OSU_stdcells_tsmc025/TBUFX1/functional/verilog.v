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
       tpzh$EN$Y = 0.084:0.084:0.084,
       tpzl$EN$Y = 0.025:0.025:0.025,
       tplz$EN$Y = 0.052:0.052:0.052,
       tphz$EN$Y = 0.072:0.072:0.072,
       tplhl$A$Y = 0.053:0.053:0.053,
       tphlh$A$Y = 0.082:0.082:0.082;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (EN *> Y) = (0, 0, tplz$EN$Y, tpzh$EN$Y, tphz$EN$Y, tpzl$EN$Y);

   endspecify

endmodule

`endcelldefine
