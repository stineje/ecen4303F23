// Created by ihdl
`timescale 1ns/10ps

`celldefine

module OAI21X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I0_out, A, B);
   and (I1_out, I0_out, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.05:0.05:0.05,
       tphlh$A$Y = 0.066:0.066:0.066,
       tplhl$B$Y = 0.04:0.04:0.04,
       tphlh$B$Y = 0.061:0.061:0.061,
       tplhl$C$Y = 0.03:0.038:0.046,
       tphlh$C$Y = 0.048:0.049:0.05;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule

`endcelldefine
