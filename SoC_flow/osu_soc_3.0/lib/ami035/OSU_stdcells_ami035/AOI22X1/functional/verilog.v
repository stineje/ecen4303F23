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
       tplhl$C$Y = 0.066:0.069:0.071,
       tphlh$C$Y = 0.073:0.091:0.11,
       tplhl$D$Y = 0.065:0.068:0.071,
       tphlh$D$Y = 0.061:0.078:0.095,
       tplhl$A$Y = 0.095:0.11:0.12,
       tphlh$A$Y = 0.095:0.11:0.13,
       tplhl$B$Y = 0.094:0.11:0.12,
       tphlh$B$Y = 0.087:0.1:0.11;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule

`endcelldefine
