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
       tplhl$A$Y = 0.053:0.053:0.053,
       tphlh$A$Y = 0.082:0.082:0.082,
       tpzh$EN$Y = 0.086:0.086:0.086,
       tpzl$EN$Y = 0.025:0.025:0.025,
       tplz$EN$Y = 0.052:0.052:0.052,
       tphz$EN$Y = 0.073:0.073:0.073;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (EN *> Y) = (0, 0, tplz$EN$Y, tpzh$EN$Y, tphz$EN$Y, tpzl$EN$Y);

   endspecify

endmodule

`endcelldefine
