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
       tplhl$B$Y = 0.038:0.038:0.038,
       tphlh$B$Y = 0.044:0.044:0.044,
       tplhl$A$Y = 0.052:0.052:0.052,
       tphlh$A$Y = 0.049:0.049:0.049;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule

`endcelldefine
