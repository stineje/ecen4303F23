v {xschem version=3.4.3 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 140 -140 140 -100 {
lab=Y}
N 60 -170 100 -170 {
lab=A}
N 60 -170 60 -70 {
lab=A}
N 60 -70 100 -70 {
lab=A}
N 140 -40 140 -20 {
lab=GND}
N 140 -220 140 -200 {
lab=VDD}
N 140 -120 180 -120 {
lab=Y}
N 30 -120 60 -120 {
lab=A}
N 140 -170 160 -170 {
lab=VDD}
N 160 -210 160 -170 {
lab=VDD}
N 140 -210 160 -210 {
lab=VDD}
N 140 -70 160 -70 {
lab=GND}
N 160 -70 160 -30 {
lab=GND}
N 140 -30 160 -30 {
lab=GND}
C {devices/opin.sym} 180 -120 0 0 {name=p1 lab=Y}
C {devices/ipin.sym} 30 -120 0 0 {name=p2 lab=A}
C {sky130_fd_pr/pfet_01v8.sym} 120 -170 0 0 {name=M1
L=0.15
W=0.42
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 120 -70 0 0 {name=M2
L=0.15
W=0.42
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/vdd.sym} 140 -220 0 0 {name=l1 lab=VDD}
C {devices/gnd.sym} 140 -20 0 0 {name=l2 lab=GND}
