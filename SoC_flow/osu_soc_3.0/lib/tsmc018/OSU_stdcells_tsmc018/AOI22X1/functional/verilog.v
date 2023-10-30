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
       tplhl$C$Y = 0.042:0.043:0.045,
       tphlh$C$Y = 0.054:0.064:0.073,
       tplhl$D$Y = 0.041:0.043:0.044,
       tphlh$D$Y = 0.047:0.055:0.064,
       tplhl$A$Y = 0.055:0.06:0.064,
       tphlh$A$Y = 0.068:0.077:0.086,
       tplhl$B$Y = 0.056:0.06:0.065,
       tphlh$B$Y = 0.06:0.069:0.079;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule

`endcelldefine
