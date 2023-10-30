// Created by ihdl
`timescale 1ns/10ps

`celldefine

module NOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$B$Y = 0.07:0.07:0.07,
       tphlh$B$Y = 0.063:0.063:0.063,
       tplhl$A$Y = 0.094:0.094:0.094,
       tphlh$A$Y = 0.075:0.075:0.075;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule

`endcelldefine
