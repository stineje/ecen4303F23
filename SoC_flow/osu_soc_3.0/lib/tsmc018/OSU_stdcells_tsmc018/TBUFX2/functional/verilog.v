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
       tplhl$A$Y = 0.045:0.045:0.045,
       tphlh$A$Y = 0.062:0.062:0.062,
       tpzh$EN$Y = 0.067:0.067:0.067,
       tpzl$EN$Y = 0.021:0.021:0.021,
       tplz$EN$Y = 0.044:0.044:0.044,
       tphz$EN$Y = 0.06:0.06:0.06;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (EN *> Y) = (0, 0, tplz$EN$Y, tpzh$EN$Y, tphz$EN$Y, tpzl$EN$Y);

   endspecify

endmodule

`endcelldefine
