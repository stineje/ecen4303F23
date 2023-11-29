v {xschem version=3.4.2 file_version=1.2
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
lab=GND}
N 230 -210 240 -210 {
lab=GND}
N 230 -110 250 -110 {
lab=GND}
N 250 -110 250 -70 {
lab=GND}
N 230 -70 250 -70 {
lab=GND}
N 340 -290 360 -290 {
lab=VDD}
N 570 -230 570 -210 {
lab=Y}
N 530 -260 530 -180 {
lab=#net2}
N 570 -150 570 -130 {
lab=GND}
N 570 -310 570 -290 {
lab=VDD}
N 570 -260 580 -260 {
lab=VDD}
N 580 -300 580 -260 {
lab=VDD}
N 570 -300 580 -300 {
lab=VDD}
N 570 -180 580 -180 {
lab=GND}
N 580 -180 580 -140 {
lab=GND}
N 570 -140 580 -140 {
lab=GND}
N 570 -220 610 -220 {
lab=Y}
N 230 -160 230 -140 {
lab=#net1}
N 150 -260 340 -260 {
lab=#net2}
N 150 -340 150 -320 {
lab=VDD}
N 230 -260 230 -240 {
lab=#net2}
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
lab=GND}
N 240 -210 250 -210 {
lab=GND}
N 340 -260 530 -260 {
lab=#net2}
N 180 -210 190 -210 {
lab=A}
N 180 -110 190 -110 {
lab=B}
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
C {devices/gnd.sym} 230 -60 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 150 -340 0 0 {name=l3 lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} 550 -260 0 0 {name=M5
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
C {sky130_fd_pr/nfet_01v8.sym} 550 -180 0 0 {name=M6
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
C {devices/vdd.sym} 570 -310 0 0 {name=l4 lab=VDD}
C {devices/gnd.sym} 570 -130 0 0 {name=l5 lab=GND}
C {devices/opin.sym} 610 -220 0 0 {name=p5 lab=Y}
C {devices/vdd.sym} 340 -340 0 0 {name=l2 lab=VDD}
