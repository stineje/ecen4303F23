v {xschem version=3.4.3 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -60 -40 -40 -40 {
lab=#net1}
N 260 -40 280 -40 {
lab=Y}
N -370 -40 -360 -40 {}
C {inv.sym} -210 -40 0 0 {name=x1 GND=GND VDD=VDD}
C {inv.sym} 110 -40 0 0 {name=x2 GND=GND VDD=VDD}
C {devices/ipin.sym} -370 -40 0 0 {name=p1 lab=A}
C {devices/opin.sym} 280 -40 0 0 {name=p2 lab=Y}
