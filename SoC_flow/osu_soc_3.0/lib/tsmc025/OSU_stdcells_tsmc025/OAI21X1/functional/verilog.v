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
       tplhl$A$Y = 0.06:0.06:0.06,
       tphlh$A$Y = 0.085:0.085:0.085,
       tplhl$B$Y = 0.05:0.05:0.05,
       tphlh$B$Y = 0.079:0.079:0.079,
       tplhl$C$Y = 0.036:0.046:0.056,
       tphlh$C$Y = 0.059:0.061:0.063;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule

`endcelldefine
