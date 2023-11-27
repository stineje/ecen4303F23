v {xschem version=3.4.3 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 340 -340 340 -320 {
lab=VDD}
N 80 -290 120 -290 {
lab=A}
N 260 -290 300 -290 {
lab=B}
N 230 -180 230 -160 {
lab=#net1}
N 230 -80 230 -60 {
lab=VDD}
N 230 -210 240 -210 {
lab=VDD}
N 230 -110 250 -110 {
lab=VDD}
N 250 -110 250 -70 {
lab=VDD}
N 230 -70 250 -70 {
lab=VDD}
N 340 -290 360 -290 {
lab=VDD}
N 340 -260 380 -260 {
lab=Y}
N 230 -160 230 -140 {
lab=#net1}
N 150 -260 340 -260 {
lab=Y}
N 150 -340 150 -320 {
lab=VDD}
N 230 -260 230 -240 {
lab=Y}
N 150 -290 160 -290 {
lab=VDD}
N 160 -330 160 -290 {
lab=VDD}
N 150 -330 160 -330 {
lab=VDD}
N 360 -330 360 -290 {
lab=VDD}
N 340 -330 360 -330 {
lab=VDD}
N 250 -210 250 -110 {
lab=VDD}
N 240 -210 250 -210 {
lab=VDD}
N 180 -210 190 -210 {
lab=A}
N 180 -110 190 -110 {
lab=B}
N 80 -170 100 -170 {
lab=VDD}
N 80 -150 100 -150 {
lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 210 -210 0 0 {name=M1
L=0.15
W=0.52
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
C {sky130_fd_pr/nfet_01v8.sym} 210 -110 0 0 {name=M2
L=0.15
W=0.52
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
C {sky130_fd_pr/pfet_01v8.sym} 320 -290 0 0 {name=M3
L=0.15
W=1.26
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
C {sky130_fd_pr/pfet_01v8.sym} 130 -290 0 0 {name=M4
L=0.15
W=1.26
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
C {devices/ipin.sym} 260 -290 0 0 {name=p1 lab=B}
C {devices/ipin.sym} 80 -290 0 0 {name=p2 lab=A}
C {devices/lab_pin.sym} 180 -210 0 0 {name=p3 sig_type=std_logic lab=A}
C {devices/lab_pin.sym} 180 -110 0 0 {name=p4 sig_type=std_logic lab=B}
C {devices/opin.sym} 380 -260 0 0 {name=p5 lab=Y}
C {devices/ipin.sym} 80 -170 0 0 {name=p6 lab=VDD}
C {devices/lab_pin.sym} 100 -170 0 1 {name=p7 sig_type=std_logic lab=VDD}
C {devices/ipin.sym} 80 -150 0 0 {name=p8 lab=GND}
C {devices/lab_pin.sym} 100 -150 0 1 {name=p9 sig_type=std_logic lab=GND}
C {devices/lab_pin.sym} 150 -340 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 340 -340 0 0 {name=p11 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 230 -60 0 0 {name=p12 sig_type=std_logic lab=GND}
