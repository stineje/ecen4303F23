// Created by ihdl
`timescale 1ns/10ps

`celldefine

module TBUFX2 (A, EN, Y);
input  A ;
input  EN ;
output Y ;

   not (I0_out, A);
   bufif1 (Y, I0_out, EN);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.077:0.077:0.077,
       tphlh$A$Y = 0.099:0.099:0.099,
       tpzh$EN$Y = 0.096:0.096:0.096,
       tpzl$EN$Y = 0.037:0.037:0.037,
       tplz$EN$Y = 0.052:0.052:0.052,
       tphz$EN$Y = 0.094:0.094:0.094;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (EN *> Y) = (0, 0, tplz$EN$Y, tpzh$EN$Y, tphz$EN$Y, tpzl$EN$Y);

   endspecify

endmodule

`endcelldefine
