// Created by ihdl
`timescale 1ns/10ps

`celldefine

module AOI22X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (I0_out, A, B);
   and (I1_out, C, D);
   or  (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$C$Y = 0.089:0.095:0.1,
       tphlh$C$Y = 0.089:0.11:0.13,
       tplhl$D$Y = 0.089:0.094:0.099,
       tphlh$D$Y = 0.081:0.098:0.11,
       tplhl$A$Y = 0.12:0.13:0.15,
       tphlh$A$Y = 0.12:0.13:0.15,
       tplhl$B$Y = 0.12:0.13:0.15,
       tphlh$B$Y = 0.11:0.12:0.13;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule

`endcelldefine
