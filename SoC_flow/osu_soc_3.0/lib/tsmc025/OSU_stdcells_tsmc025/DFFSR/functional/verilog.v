// Created by ihdl
`timescale 1ns/10ps

`celldefine

module DFFSR (CLK, D, R, S, Q);
input  CLK ;
input  D ;
input  R ;
input  S ;
output Q ;
reg NOTIFIER ;

   not (I0_CLEAR, R);
   not (I0_SET, S);
   udp_dff (P0003, D_, CLK, I0_SET, I0_CLEAR, NOTIFIER);
   not (D_, D);
   not (P0002, P0003);
   buf (Q, P0002);
   and (\D&S , D, S);
   not (I7_out, D);
   and (\~D&R , I7_out, R);
   and (\S&R , S, R);

   specify
     // delay parameters
     specparam
       tphlh$S$Q = 0.37:0.37:0.37,
       tpllh$R$Q = 0.27:0.27:0.27,
       tphhl$R$Q = 0.28:0.28:0.29,
       tpllh$CLK$Q = 0.43:0.43:0.43,
       tplhl$CLK$Q = 0.43:0.43:0.43,
       tminpwl$S = 0.062:0.22:0.37,
       tminpwl$R = 0.041:0.17:0.29,
       tminpwh$CLK = 0.22:0.32:0.43,
       tminpwl$CLK = 0.22:0.25:0.28,
       tsetup_negedge$D$CLK = 0.16:0.16:0.16,
       thold_negedge$D$CLK = 0.025:0.025:0.025,
       tsetup_posedge$D$CLK = 0.16:0.16:0.16,
       thold_posedge$D$CLK = 0.025:0.025:0.025,
       trec$R$CLK = -0.025:-0.025:-0.025,
       trem$R$CLK = 0.21:0.21:0.21,
       trec$R$S = 0.000000062:0.000000062:0.000000062,
       trec$S$CLK = -0.025:-0.025:-0.025,
       trem$S$CLK = 0.12:0.12:0.12,
       trec$S$R = 0.094:0.094:0.094;

     // path delays
     (CLK *> Q) = (tpllh$CLK$Q, tplhl$CLK$Q);
     (R *> Q) = (tpllh$R$Q, tphhl$R$Q);
     (S *> Q) = (tphlh$S$Q, 0);
     $setup(negedge D, posedge CLK &&& \S&R , tsetup_negedge$D$CLK, NOTIFIER);
     $hold (negedge D, posedge CLK &&& \S&R , thold_negedge$D$CLK,  NOTIFIER);
     $setup(posedge D, posedge CLK &&& \S&R , tsetup_posedge$D$CLK, NOTIFIER);
     $hold (posedge D, posedge CLK &&& \S&R , thold_posedge$D$CLK,  NOTIFIER);
     $recovery(posedge R, posedge CLK &&& \D&S , trec$R$CLK, NOTIFIER);
//     $removal (posedge R, posedge CLK &&& \D&S , trem$R$CLK, NOTIFIER);
     $recovery(posedge R, posedge S, trec$R$S, NOTIFIER);
     $recovery(posedge S, posedge CLK &&& \~D&R , trec$S$CLK, NOTIFIER);
//     $removal (posedge S, posedge CLK &&& \~D&R , trem$S$CLK, NOTIFIER);
     $recovery(posedge S, posedge R, trec$S$R, NOTIFIER);
     $width(negedge S, tminpwl$S, 0, NOTIFIER);
     $width(negedge R, tminpwl$R, 0, NOTIFIER);
     $width(posedge CLK, tminpwh$CLK, 0, NOTIFIER);
     $width(negedge CLK, tminpwl$CLK, 0, NOTIFIER);

   endspecify

endmodule

`endcelldefine
