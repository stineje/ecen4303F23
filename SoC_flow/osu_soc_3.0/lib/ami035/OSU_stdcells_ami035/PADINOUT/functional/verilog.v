// Created by ihdl
`timescale 1ns/10ps

`celldefine

module PADINOUT (DO, OEN, DI, YPAD);
input  DO ;
input  OEN ;
output DI ;
inout  YPAD ;

   bufif1 (YPAD, DO, OEN);
   buf (DI, YPAD);

   specify
     // delay parameters
     specparam
       tpllh$DO$YPAD = 0.59:0.59:0.59,
       tphhl$DO$YPAD = 0.59:0.59:0.59,
       tpzh$OEN$YPAD = 1.1:1.1:1.1,
       tpzl$OEN$YPAD = 0.65:0.65:0.65,
       tplz$OEN$YPAD = 0.82:0.82:0.82,
       tphz$OEN$YPAD = 1.5:1.5:1.5,
       tpllh$YPAD$DI = 0.15:0.15:0.15,
       tphhl$YPAD$DI = 0.17:0.17:0.17;

     // path delays
     (DO *> YPAD) = (tpllh$DO$YPAD, tphhl$DO$YPAD);
     (OEN *> YPAD) = (0, 0, tplz$OEN$YPAD, tpzh$OEN$YPAD, tphz$OEN$YPAD, tpzl$OEN$YPAD);
     (YPAD *> DI) = (tpllh$YPAD$DI, tphhl$YPAD$DI);

   endspecify

endmodule

`endcelldefine
