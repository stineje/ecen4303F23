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
       tpllh$DO$YPAD = 0.69:0.69:0.69,
       tphhl$DO$YPAD = 0.5:0.5:0.5,
       tpzh$OEN$YPAD = 0.86:0.86:0.86,
       tpzl$OEN$YPAD = 0.56:0.56:0.56,
       tplz$OEN$YPAD = 0.49:0.49:0.49,
       tphz$OEN$YPAD = 0.62:0.62:0.62,
       tpllh$YPAD$DI = 0.11:0.11:0.11,
       tphhl$YPAD$DI = 0.12:0.12:0.12;

     // path delays
     (DO *> YPAD) = (tpllh$DO$YPAD, tphhl$DO$YPAD);
     (OEN *> YPAD) = (0, 0, tplz$OEN$YPAD, tpzh$OEN$YPAD, tphz$OEN$YPAD, tpzl$OEN$YPAD);
     (YPAD *> DI) = (tpllh$YPAD$DI, tphhl$YPAD$DI);

   endspecify

endmodule

`endcelldefine
