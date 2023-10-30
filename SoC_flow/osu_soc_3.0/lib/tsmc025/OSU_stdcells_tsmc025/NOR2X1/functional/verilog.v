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
       tplhl$B$Y = 0.054:0.054:0.054,
       tphlh$B$Y = 0.055:0.055:0.055,
       tplhl$A$Y = 0.068:0.068:0.068,
       tphlh$A$Y = 0.061:0.061:0.061;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule

`endcelldefine
