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

* DATE: Jan  7/02
* LOT: T1BD                  WAF: 9204
* Temperature_parameters=Default
.MODEL nfet NMOS (                                 LEVEL   = 49
+VERSION = 3.1            TNOM    = 27             TOX     = 1.4E-8
+XJ      = 1.5E-7         NCH     = 1.7E17         VTH0    = 0.6678778
+K1      = 0.8762214      K2      = -0.0943019     K3      = 24.2085212
+K3B     = -7.7698747     W0      = 1E-8           NLX     = 1E-9
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 2.8809673      DVT1    = 0.4307406      DVT2    = -0.1184182
+U0      = 451.2550843    UA      = 1E-13          UB      = 1.296289E-18
+UC      = 1.037591E-11   VSAT    = 1.625008E5     A0      = 0.6087925
+AGS     = 0.1268661      B0      = 2.586729E-6    B1      = 5E-6
+KETA    = -1.849739E-3   A1      = 0              A2      = 0.3561226
+RDSW    = 1.391717E3     PRWG    = 0.047164       PRWB    = 0.0246591
+WR      = 1              WINT    = 2.500756E-7    LINT    = 3.224618E-8
+XL      = 0              XW      = 0              DWG     = -1.022723E-8
+DWB     = 5.166892E-8    VOFF    = -0.0110606     NFACTOR = 0.7787324
+CIT     = 0              CDSC    = 2.4E-4         CDSCD   = 0
+CDSCB   = 0              ETA0    = 0.0139722      ETAB    = -8.660166E-4
+DSUB    = 0.1959492      PCLM    = 2.6438146      PDIBLC1 = -0.1275307
+PDIBLC2 = 2.343354E-3    PDIBLCB = -0.0345287     DROUT   = 0.4842287
+PSCBE1  = 5.885705E8     PSCBE2  = 8.722621E-5    PVAG    = 0
+DELTA   = 0.01           RSH     = 81.1           MOBMOD  = 1
+PRT     = 0              UTE     = -1.5           KT1     = -0.11
+KT1L    = 0              KT2     = 0.022          UA1     = 4.31E-9
+UB1     = -7.61E-18      UC1     = -5.6E-11       AT      = 3.3E4
+WL      = 0              WLN     = 1              WW      = 0
+WWN     = 1              WWL     = 0              LL      = 0
+LLN     = 1              LW      = 0              LWN     = 1
+LWL     = 0              CAPMOD  = 2              XPART   = 0.5
+CGDO    = 2.1E-10        CGSO    = 2.1E-10        CGBO    = 1E-9
+CJ      = 4.231673E-4    PB      = 0.9816846      MJ      = 0.4398491
+CJSW    = 3.223931E-10   PBSW    = 0.1            MJSW    = 0.1151286
+CJSWG   = 1.64E-10       PBSWG   = 0.1            MJSWG   = 0.1151286
+CF      = 0              PVTH0   = 0.0697692      PRDSW   = 203.5723993
+PK2     = -0.0366212     WKETA   = -0.0263647     LKETA   = -1.396134E-4    )
*
.MODEL pfet PMOS (                                 LEVEL   = 49
+VERSION = 3.1            TNOM    = 27             TOX     = 1.4E-8
+XJ      = 1.5E-7         NCH     = 1.7E17         VTH0    = -0.9156354
+K1      = 0.5386158      K2      = 0.0109069      K3      = 6.8891225
+K3B     = -0.955502      W0      = 1E-8           NLX     = 5.150954E-9
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 2.7443416      DVT1    = 0.7101819      DVT2    = -0.1355717
+U0      = 209.5424573    UA      = 2.713137E-9    UB      = 1E-21
+UC      = -6.3868E-11    VSAT    = 1.737339E5     A0      = 0.9370339
+AGS     = 0.1530812      B0      = 7.144521E-7    B1      = 5E-6
+KETA    = -3.495244E-3   A1      = 6.654622E-5    A2      = 0.3
+RDSW    = 3E3            PRWG    = -0.0141301     PRWB    = -0.0244506
+WR      = 1              WINT    = 3.028868E-7    LINT    = 5.401612E-8
+XL      = 0              XW      = 0              DWG     = -1.178746E-8
+DWB     = 1.985576E-8    VOFF    = -0.0803591     NFACTOR = 0.6185011
+CIT     = 0              CDSC    = 2.4E-4         CDSCD   = 0
+CDSCB   = 0              ETA0    = 0.1554071      ETAB    = -0.0681955
+DSUB    = 1              PCLM    = 2.2066095      PDIBLC1 = 0.0607184
+PDIBLC2 = 4.066172E-3    PDIBLCB = -0.0548437     DROUT   = 0.262009
+PSCBE1  = 5.132209E9     PSCBE2  = 5E-10          PVAG    = 0
+DELTA   = 0.01           RSH     = 103.3          MOBMOD  = 1
+PRT     = 0              UTE     = -1.5           KT1     = -0.11
+KT1L    = 0              KT2     = 0.022          UA1     = 4.31E-9
+UB1     = -7.61E-18      UC1     = -5.6E-11       AT      = 3.3E4
+WL      = 0              WLN     = 1              WW      = 0
+WWN     = 1              WWL     = 0              LL      = 0
+LLN     = 1              LW      = 0              LWN     = 1
+LWL     = 0              CAPMOD  = 2              XPART   = 0.5
+CGDO    = 2.75E-10       CGSO    = 2.75E-10       CGBO    = 1E-9
+CJ      = 7.244604E-4    PB      = 0.9552323      MJ      = 0.4965082
+CJSW    = 2.658719E-10   PBSW    = 0.99           MJSW    = 0.27553
+CJSWG   = 6.4E-11        PBSWG   = 0.99           MJSWG   = 0.27553
+CF      = 0              PVTH0   = 5.98016E-3     PRDSW   = 14.8598424
+PK2     = 3.73981E-3     WKETA   = 4.809974E-3    LKETA   = -4.843129E-3    )
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
.temp 25
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
