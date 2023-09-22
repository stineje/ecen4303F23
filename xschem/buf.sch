v {xschem version=3.4.3 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -130 -40 -110 -40 {
lab=#net1}
N -160 100 -100 100 {
lab=GND}
N -160 70 -100 70 {
lab=VDD}
C {inv.sym} -210 -40 0 0 {name=x1 GND=GND VDD=VDD}
C {inv.sym} -60 -40 0 0 {name=x2 GND=GND VDD=VDD}
C {devices/ipin.sym} -260 -40 0 0 {name=p1 lab=A}
C {devices/opin.sym} 20 -40 0 0 {name=p2 lab=Y}
C {devices/ipin.sym} -160 70 0 0 {name=p3 lab=VDD}
C {devices/ipin.sym} -160 100 0 0 {name=p4 lab=GND}
C {devices/lab_pin.sym} -100 70 0 1 {name=p5 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} -100 100 0 1 {name=p6 sig_type=std_logic lab=GND}
