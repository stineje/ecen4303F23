// Created by ihdl
`timescale 1ns/10ps

`celldefine

module DFFNEGX1 (CLK, D, Q);
input  CLK ;
input  D ;
output Q ;
reg NOTIFIER ;

   not (I0_CLOCK, CLK);
   udp_dff (DS0000, D, I0_CLOCK, 1'B0, 1'B0, NOTIFIER);
   not (P0002, DS0000);
   buf (Q, DS0000);

   specify
     // delay parameters
     specparam
       tphlh$CLK$Q = 0.13:0.13:0.13,
       tphhl$CLK$Q = 0.12:0.12:0.12,
       tminpwh$CLK = 0.043:0.094:0.14,
       tminpwl$CLK = 0.082:0.1:0.13,
       tsetup_negedge$D$CLK = 0.19:0.19:0.19,
       thold_negedge$D$CLK = 0.000000061:0.000000061:0.000000061,
       tsetup_posedge$D$CLK = 0.19:0.19:0.19,
       thold_posedge$D$CLK = 0.000000062:0.000000062:0.000000062;

     // path delays
     (CLK *> Q) = (tphlh$CLK$Q, tphhl$CLK$Q);
     $setup(negedge D, negedge CLK, tsetup_negedge$D$CLK, NOTIFIER);
     $hold (negedge D, negedge CLK, thold_negedge$D$CLK,  NOTIFIER);
     $setup(posedge D, negedge CLK, tsetup_posedge$D$CLK, NOTIFIER);
     $hold (posedge D, negedge CLK, thold_posedge$D$CLK,  NOTIFIER);
     $width(posedge CLK, tminpwh$CLK, 0, NOTIFIER);
     $width(negedge CLK, tminpwl$CLK, 0, NOTIFIER);

   endspecify

endmodule

`endcelldefine
