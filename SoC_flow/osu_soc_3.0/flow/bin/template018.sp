*********************************************************
*                                                       *
* Example HSPICE netlist for our AMI 0.5u technology    *
* James Stine, IIT                                      *
* Johannes Grad, IIT                                    *
*                                                       *
* to run this file: hspice filename.sp                  *
* to display results: awaves (then open filename.sw0)   *
*                                                       *
*********************************************************

*****************************************
* Voltage Sources
*
* Format: Vname pin1 pin2 DC voltage
*****************************************
VA A gnd pulse 0 5V 0ns 200ps 200ps 4.8ns 10ns
VB B gnd pulse 0 5V 0ns 200ps 200ps 9.8ns 20ns
VC C gnd pulse 0 5V 0ns 200ps 200ps 19.8ns 40ns
VD D gnd pulse 0 5V 0ns 200ps 200ps 39.8ns 80ns

*****************************************************************
* Transistors
*
* Format: Mnumber Drain Gate Source Bulk Model Length Width
*****************************************************************
* SPICE3 file created from alu.ext - technology: scmos



*********************************************
* Transistor Models
*
* Those are given, dont touch these
*********************************************

* DATE: Apr 14/03
* LOT: T32L                  WAF: 9002
* Temperature_parameters=Default
.MODEL nfet NMOS (                                LEVEL   = 49
+VERSION = 3.1            TNOM    = 27             TOX     = 4E-9
+XJ      = 1E-7           NCH     = 2.3549E17      VTH0    = 0.3622838
+K1      = 0.5798043      K2      = 4.719788E-3    K3      = 1E-3
+K3B     = 5.1304703      W0      = 1E-7           NLX     = 1.866766E-7
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 1.160818       DVT1    = 0.3681993      DVT2    = 0.0213167
+U0      = 266.6719854    UA      = -1.345095E-9   UB      = 2.285509E-18
+UC      = 6.120241E-11   VSAT    = 9.847655E4     A0      = 2
+AGS     = 0.4496626      B0      = 6.527848E-9    B1      = -1E-7
+KETA    = -0.0107196     A1      = 7.33128E-4     A2      = 1
+RDSW    = 112.9190981    PRWG    = 0.5            PRWB    = -0.2
+WR      = 1              WINT    = 0              LINT    = 2.262796E-9
+XL      = -2E-8          XW      = -1E-8          DWG     = -2.527916E-8
+DWB     = 1.944811E-8    VOFF    = -0.091931      NFACTOR = 2.4421296
+CIT     = 0              CDSC    = 2.4E-4         CDSCD   = 0
+CDSCB   = 0              ETA0    = 3.055238E-3    ETAB    = -2.376115E-4
+DSUB    = 0.0157229      PCLM    = 0.6803651      PDIBLC1 = 0.1391049
+PDIBLC2 = 3.212086E-3    PDIBLCB = -0.1           DROUT   = 0.6814376
+PSCBE1  = 9.86841E9      PSCBE2  = 5.684441E-10   PVAG    = 0.0128052
+DELTA   = 0.01           RSH     = 6.7            MOBMOD  = 1
+PRT     = 0              UTE     = -1.5           KT1     = -0.11
+KT1L    = 0              KT2     = 0.022          UA1     = 4.31E-9
+UB1     = -7.61E-18      UC1     = -5.6E-11       AT      = 3.3E4
+WL      = 0              WLN     = 1              WW      = 0
+WWN     = 1              WWL     = 0              LL      = 0
+LLN     = 1              LW      = 0              LWN     = 1
+LWL     = 0              CAPMOD  = 2              XPART   = 0.5
+CGDO    = 9.07E-10       CGSO    = 9.07E-10       CGBO    = 1E-12
+CJ      = 9.661977E-4    PB      = 0.7246209      MJ      = 0.3595776
+CJSW    = 2.22427E-10    PBSW    = 0.4            MJSW    = 0.1113549
+CJSWG   = 3.3E-10        PBSWG   = 0.4            MJSWG   = 0.1113549
+CF      = 0              PVTH0   = 3.207003E-4    PRDSW   = -4.2124185
+PK2     = 1.092441E-3    WKETA   = 8.500926E-3    LKETA   = 6.624569E-4
+PU0     = 22.5513463     PUA     = 9.329083E-11   PUB     = 0
+PVSAT   = 1.78069E3      PETA0   = 1.00148E-4     PKETA   = -7.401384E-3    )
*
.MODEL pfet PMOS (                                LEVEL   = 49
+VERSION = 3.1            TNOM    = 27             TOX     = 4E-9
+XJ      = 1E-7           NCH     = 4.1589E17      VTH0    = -0.3920433
+K1      = 0.5373397      K2      = 0.0384123      K3      = 0
+K3B     = 12.8255264     W0      = 1E-6           NLX     = 1.231251E-7
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 0.4421072      DVT1    = 0.2443802      DVT2    = 0.1
+U0      = 117.8341252    UA      = 1.646291E-9    UB      = 1.21318E-21
+UC      = -1E-10         VSAT    = 1.795704E5     A0      = 1.7297499
+AGS     = 0.3670103      B0      = 7.672643E-7    B1      = 1.244877E-6
+KETA    = 0.0234714      A1      = 0.3515335      A2      = 0.4080908
+RDSW    = 275.50948      PRWG    = 0.5            PRWB    = 0.2463073
+WR      = 1              WINT    = 0              LINT    = 1.813898E-8
+XL      = -2E-8          XW      = -1E-8          DWG     = -7.32492E-8
+DWB     = 1.730995E-8    VOFF    = -0.0997408     NFACTOR = 2
+CIT     = 0              CDSC    = 2.4E-4         CDSCD   = 0
+CDSCB   = 0              ETA0    = 0.0432137      ETAB    = -0.0310129
+DSUB    = 0.7253888      PCLM    = 2.1233418      PDIBLC1 = 5.994242E-4
+PDIBLC2 = 0.020251       PDIBLCB = -1E-3          DROUT   = 0
+PSCBE1  = 1.730526E9     PSCBE2  = 5.008166E-10   PVAG    = 15
+DELTA   = 0.01           RSH     = 7.6            MOBMOD  = 1
+PRT     = 0              UTE     = -1.5           KT1     = -0.11
+KT1L    = 0              KT2     = 0.022          UA1     = 4.31E-9
+UB1     = -7.61E-18      UC1     = -5.6E-11       AT      = 3.3E4
+WL      = 0              WLN     = 1              WW      = 0
+WWN     = 1              WWL     = 0              LL      = 0
+LLN     = 1              LW      = 0              LWN     = 1
+LWL     = 0              CAPMOD  = 2              XPART   = 0.5
+CGDO    = 6.88E-10       CGSO    = 6.88E-10       CGBO    = 1E-12
+CJ      = 1.156834E-3    PB      = 0.8612887      MJ      = 0.4121694
+CJSW    = 1.833862E-10   PBSW    = 0.5997489      MJSW    = 0.2802277
+CJSWG   = 4.22E-10       PBSWG   = 0.5997489      MJSWG   = 0.2802277
+CF      = 0              PVTH0   = 3.243194E-3    PRDSW   = 8.3072504
+PK2     = 3.502981E-3    WKETA   = 0.0238299      LKETA   = -1.527061E-3
+PU0     = -2.4303623     PUA     = -8.88141E-11   PUB     = 1E-21
+PVSAT   = -50            PETA0   = 1E-4           PKETA   = -1.262001E-3    )
*

**************************************************************
* Analysis type
*
* e.g. .DC voltagesource startvoltage stopvoltage stepsize [source start stop step ...]
*      .TRAN stoptime stepsize
* .DC is a dc-sweep (waveform over voltage) (can have more than one, as shown above)
* .TRAN is a transient analysis (waveform over time)
**************************************************************
.DC VA 0V +5V 100mV
.tran .05n 80n 

**************************************************************
*  Define Voltages for Power/Ground
**************************************************************
.param vddp = 5.0
VDD vdd 0 DC vddp


**************************************************************
* Final options
* .probe tells which waveforms to save
* .print prints given waveforms in tabulated form
**************************************************************
.Print DC V(A) V(Out)
.Print tran V(A) V(B) V(C) V(D) V(Out)
.probe V(A) V(B) V(C) V(D) V(Out)
.op
.options probe post measout captab
.end
