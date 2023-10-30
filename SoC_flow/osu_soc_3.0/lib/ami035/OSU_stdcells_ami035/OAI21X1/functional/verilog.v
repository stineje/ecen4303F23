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
       tplhl$A$Y = 0.087:0.087:0.087,
       tphlh$A$Y = 0.098:0.098:0.098,
       tplhl$B$Y = 0.064:0.064:0.064,
       tphlh$B$Y = 0.09:0.09:0.09,
       tplhl$C$Y = 0.046:0.062:0.079,
       tphlh$C$Y = 0.07:0.076:0.081;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule

`endcelldefine
