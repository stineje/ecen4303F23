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
       tphlh$CLK$Q = 0.16:0.16:0.16,
       tphhl$CLK$Q = 0.16:0.16:0.16,
       tminpwh$CLK = 0.05:0.12:0.19,
       tminpwl$CLK = 0.1:0.13:0.16,
       tsetup_negedge$D$CLK = 0.26:0.26:0.26,
       thold_negedge$D$CLK = -0.069:-0.069:-0.069,
       tsetup_posedge$D$CLK = 0.26:0.26:0.26,
       thold_posedge$D$CLK = -0.069:-0.069:-0.069;

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
