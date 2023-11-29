v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 140 -180 140 -140 {
lab=#net1}
N 140 -180 270 -180 {
lab=#net1}
N 270 -180 270 -140 {
lab=#net1}
N 190 -230 190 -180 {
lab=#net1}
N 190 -310 190 -290 {
lab=#net2}
N 110 -340 150 -340 {
lab=A}
N 110 -260 150 -260 {
lab=B}
N 140 -80 140 -60 {
lab=GND}
N 270 -80 270 -60 {
lab=GND}
N 140 -110 150 -110 {
lab=GND}
N 150 -110 150 -70 {
lab=GND}
N 140 -70 150 -70 {
lab=GND}
N 270 -110 290 -110 {
lab=GND}
N 290 -110 290 -70 {
lab=GND}
N 270 -70 290 -70 {
lab=GND}
N 190 -390 190 -370 {
lab=VDD}
N 190 -340 210 -340 {
lab=VDD}
N 210 -380 210 -340 {
lab=VDD}
N 190 -380 210 -380 {
lab=VDD}
N 190 -260 210 -260 {
lab=VDD}
N 210 -340 210 -260 {
lab=VDD}
N 430 -190 430 -170 {
lab=Y}
N 390 -220 390 -140 {
lab=#net1}
N 270 -180 390 -180 {
lab=#net1}
N 430 -110 430 -90 {
lab=GND}
N 430 -270 430 -250 {
lab=VDD}
N 430 -220 440 -220 {
lab=VDD}
N 440 -260 440 -220 {
lab=VDD}
N 430 -260 440 -260 {
lab=VDD}
N 430 -140 440 -140 {
lab=GND}
N 440 -140 440 -100 {
lab=GND}
N 430 -100 440 -100 {
lab=GND}
N 430 -180 470 -180 {
lab=Y}
N 90 -110 100 -110 {}
N 220 -110 230 -110 {}
C {sky130_fd_pr/nfet_01v8.sym} 120 -110 0 0 {name=M1
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
C {sky130_fd_pr/nfet_01v8.sym} 250 -110 0 0 {name=M2
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
C {sky130_fd_pr/pfet_01v8.sym} 170 -260 0 0 {name=M3
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
C {sky130_fd_pr/pfet_01v8.sym} 170 -340 0 0 {name=M4
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
C {devices/ipin.sym} 110 -260 0 0 {name=p1 lab=B}
C {devices/ipin.sym} 110 -340 0 0 {name=p2 lab=A}
C {devices/lab_pin.sym} 90 -110 0 0 {name=p3 sig_type=std_logic lab=A}
C {devices/lab_pin.sym} 220 -110 0 0 {name=p4 sig_type=std_logic lab=B}
C {devices/gnd.sym} 140 -60 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 270 -60 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} 190 -390 0 0 {name=l3 lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} 410 -220 0 0 {name=M5
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
C {sky130_fd_pr/nfet_01v8.sym} 410 -140 0 0 {name=M6
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
C {devices/vdd.sym} 430 -270 0 0 {name=l4 lab=VDD}
C {devices/gnd.sym} 430 -90 0 0 {name=l5 lab=GND}
C {devices/opin.sym} 470 -180 0 0 {name=p5 lab=Y}
