// Created by ihdl
`timescale 1ns/10ps

`celldefine

module OAI22X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I0_out, A, B);
   or  (I1_out, C, D);
   and (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$D$Y = 0.078:0.1:0.12,
       tphlh$D$Y = 0.097:0.1:0.11,
       tplhl$C$Y = 0.094:0.12:0.14,
       tphlh$C$Y = 0.11:0.11:0.12,
       tplhl$A$Y = 0.1:0.12:0.15,
       tphlh$A$Y = 0.13:0.13:0.14,
       tplhl$B$Y = 0.083:0.1:0.13,
       tphlh$B$Y = 0.11:0.12:0.13;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule

`endcelldefine
