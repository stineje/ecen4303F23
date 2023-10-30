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

* DATE: May  6/03
* LOT: T33W                  WAF: 6001
* Temperature_parameters=Default
.MODEL nfet NMOS (                                LEVEL   = 49
+VERSION = 3.1            TNOM    = 27             TOX     = 5.6E-9
+XJ      = 1E-7           NCH     = 2.3549E17      VTH0    = 0.3705997
+K1      = 0.4580187      K2      = 2.151973E-3    K3      = 1E-3
+K3B     = 1.885743       W0      = 1E-7           NLX     = 1.979533E-7
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 0.4180247      DVT1    = 0.5426555      DVT2    = -0.5
+U0      = 282.8516693    UA      = -1.479115E-9   UB      = 2.771868E-18
+UC      = 4.191212E-11   VSAT    = 1.567551E5     A0      = 1.7299219
+AGS     = 0.3351874      B0      = -5.459641E-8   B1      = 2.281689E-6
+KETA    = -7.964814E-3   A1      = 1.404347E-4    A2      = 0.3958259
+RDSW    = 116.1842583    PRWG    = 0.5            PRWB    = -0.2
+WR      = 1              WINT    = 0              LINT    = 5.662622E-9
+XL      = 3E-8           XW      = -4E-8          DWG     = -3.48834E-9
+DWB     = 8.945939E-9    VOFF    = -0.1026024     NFACTOR = 1.527547
+CIT     = 0              CDSC    = 2.4E-4         CDSCD   = 0
+CDSCB   = 0              ETA0    = 5.273497E-3    ETAB    = 6.155241E-4
+DSUB    = 0.0328792      PCLM    = 1.8598332      PDIBLC1 = 1
+PDIBLC2 = 2.597071E-3    PDIBLCB = -0.0638656     DROUT   = 0.8750173
+PSCBE1  = 3.733074E8     PSCBE2  = 3.1755E-8      PVAG    = 9.969483E-3
+DELTA   = 0.01           RSH     = 4.5            MOBMOD  = 1
+PRT     = 0              UTE     = -1.5           KT1     = -0.11
+KT1L    = 0              KT2     = 0.022          UA1     = 4.31E-9
+UB1     = -7.61E-18      UC1     = -5.6E-11       AT      = 3.3E4
+WL      = 0              WLN     = 1              WW      = 0
+WWN     = 1              WWL     = 0              LL      = 0
+LLN     = 1              LW      = 0              LWN     = 1
+LWL     = 0              CAPMOD  = 2              XPART   = 0.5
+CGDO    = 3.8E-10        CGSO    = 3.8E-10        CGBO    = 1E-12
+CJ      = 1.517652E-3    PB      = 0.99           MJ      = 0.4042707
+CJSW    = 4.19793E-10    PBSW    = 0.8315437      MJSW    = 0.3795104
+CJSWG   = 3.29E-10       PBSWG   = 0.8315437      MJSWG   = 0.3795104
+CF      = 0              PVTH0   = -6.324971E-3   PRDSW   = -10
+PK2     = 2.675691E-3    WKETA   = -1.645688E-3   LKETA   = -0.0122331      )
*
.MODEL pfet PMOS (                                LEVEL   = 49
+VERSION = 3.1            TNOM    = 27             TOX     = 5.6E-9
+XJ      = 1E-7           NCH     = 4.1589E17      VTH0    = -0.5301873
+K1      = 0.6176994      K2      = -1.123056E-3   K3      = 0
+K3B     = 9.6084801      W0      = 1E-6           NLX     = 1E-9
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 2.5278534      DVT1    = 0.7456063      DVT2    = -0.1465105
+U0      = 104.8572245    UA      = 1.186639E-9    UB      = 1E-21
+UC      = -1E-10         VSAT    = 1.909951E5     A0      = 0.8879722
+AGS     = 0.1476076      B0      = 1.195257E-6    B1      = 5E-6
+KETA    = 0.0162687      A1      = 4.253866E-3    A2      = 0.3
+RDSW    = 852.464666     PRWG    = 0.2769343      PRWB    = -0.2426706
+WR      = 1              WINT    = 0              LINT    = 4.358485E-8
+XL      = 3E-8           XW      = -4E-8          DWG     = -2.561792E-8
+DWB     = 3.107252E-9    VOFF    = -0.1240087     NFACTOR = 1.1688205
+CIT     = 0              CDSC    = 2.4E-4         CDSCD   = 0
+CDSCB   = 0              ETA0    = 0.4082093      ETAB    = -0.1429114
+DSUB    = 1.1220319      PCLM    = 1.2613618      PDIBLC1 = 5.44991E-3
+PDIBLC2 = -1.3578E-9     PDIBLCB = -1E-3          DROUT   = 0.065719
+PSCBE1  = 1.157312E10    PSCBE2  = 1.046498E-9    PVAG    = 0.015388
+DELTA   = 0.01           RSH     = 3.4            MOBMOD  = 1
+PRT     = 0              UTE     = -1.5           KT1     = -0.11
+KT1L    = 0              KT2     = 0.022          UA1     = 4.31E-9
+UB1     = -7.61E-18      UC1     = -5.6E-11       AT      = 3.3E4
+WL      = 0              WLN     = 1              WW      = 0
+WWN     = 1              WWL     = 0              LL      = 0
+LLN     = 1              LW      = 0              LWN     = 1
+LWL     = 0              CAPMOD  = 2              XPART   = 0.5
+CGDO    = 3.6E-10        CGSO    = 3.6E-10        CGBO    = 1E-12
+CJ      = 1.88432E-3     PB      = 0.99           MJ      = 0.4694628
+CJSW    = 3.091997E-10   PBSW    = 0.7523248      MJSW    = 0.2453993
+CJSWG   = 2.5E-10        PBSWG   = 0.7523248      MJSWG   = 0.2453993
+CF      = 0              PVTH0   = 3.936913E-3    PRDSW   = 20.8071404
+PK2     = 2.437362E-3    WKETA   = 0.0196526      LKETA   = -7.590931E-3    )
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
