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
       tplhl$A$Y = 0.11:0.11:0.11,
       tphlh$A$Y = 0.12:0.12:0.12,
       tplhl$B$Y = 0.089:0.089:0.089,
       tphlh$B$Y = 0.11:0.11:0.11,
       tplhl$C$Y = 0.063:0.082:0.1,
       tphlh$C$Y = 0.094:0.099:0.1;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule

`endcelldefine
