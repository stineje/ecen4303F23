v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 340 -430 340 -410 {
lab=VDD}
N 80 -380 120 -380 {
lab=A}
N 260 -380 300 -380 {
lab=B}
N 230 -270 230 -250 {
lab=#net1}
N 230 -170 230 -150 {
lab=#net2}
N 230 -300 240 -300 {
lab=GND}
N 230 -200 250 -200 {
lab=GND}
N 250 -200 250 -160 {
lab=GND}
N 230 -40 250 -40 {
lab=GND}
N 340 -380 360 -380 {
lab=VDD}
N 570 -320 570 -300 {
lab=Y}
N 530 -350 530 -270 {
lab=#net3}
N 570 -240 570 -220 {
lab=GND}
N 570 -400 570 -380 {
lab=VDD}
N 570 -350 580 -350 {
lab=VDD}
N 580 -390 580 -350 {
lab=VDD}
N 570 -390 580 -390 {
lab=VDD}
N 570 -270 580 -270 {
lab=GND}
N 580 -270 580 -230 {
lab=GND}
N 570 -230 580 -230 {
lab=GND}
N 570 -310 610 -310 {
lab=Y}
N 230 -250 230 -230 {
lab=#net1}
N 150 -350 340 -350 {
lab=#net3}
N 150 -430 150 -410 {
lab=VDD}
N 230 -350 230 -330 {
lab=#net3}
N 150 -380 160 -380 {
lab=VDD}
N 160 -420 160 -380 {
lab=VDD}
N 150 -420 160 -420 {
lab=VDD}
N 360 -420 360 -380 {
lab=VDD}
N 340 -420 360 -420 {
lab=VDD}
N 250 -300 250 -200 {
lab=GND}
N 240 -300 250 -300 {
lab=GND}
N 340 -350 530 -350 {
lab=#net3}
N 180 -300 190 -300 {
lab=A}
N 180 -200 190 -200 {
lab=B}
N 470 -430 470 -410 {
lab=VDD}
N 470 -380 490 -380 {
lab=VDD}
N 490 -420 490 -380 {
lab=VDD}
N 470 -420 490 -420 {
lab=VDD}
N 230 -90 230 -70 {
lab=GND}
N 230 -120 250 -120 {
lab=GND}
N 250 -120 250 -80 {
lab=GND}
N 180 -120 190 -120 {
lab=C}
N 250 -160 250 -120 {
lab=GND}
N 250 -80 250 -40 {
lab=GND}
N 230 -70 230 -30 {
lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} 210 -300 0 0 {name=M1
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
C {sky130_fd_pr/nfet_01v8.sym} 210 -200 0 0 {name=M2
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
C {sky130_fd_pr/pfet_01v8.sym} 320 -380 0 0 {name=M3
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
C {sky130_fd_pr/pfet_01v8.sym} 130 -380 0 0 {name=M4
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
C {devices/ipin.sym} 260 -380 0 0 {name=p1 lab=B}
C {devices/ipin.sym} 80 -380 0 0 {name=p2 lab=A}
C {devices/lab_pin.sym} 180 -300 0 0 {name=p3 sig_type=std_logic lab=A}
C {devices/lab_pin.sym} 180 -200 0 0 {name=p4 sig_type=std_logic lab=B}
C {devices/gnd.sym} 230 -30 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 150 -430 0 0 {name=l3 lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} 550 -350 0 0 {name=M5
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
C {sky130_fd_pr/nfet_01v8.sym} 550 -270 0 0 {name=M6
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
C {devices/vdd.sym} 570 -400 0 0 {name=l4 lab=VDD}
C {devices/gnd.sym} 570 -220 0 0 {name=l5 lab=GND}
C {devices/opin.sym} 610 -310 0 0 {name=p5 lab=Y}
C {devices/vdd.sym} 340 -430 0 0 {name=l2 lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} 450 -380 0 0 {name=M7
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
C {devices/ipin.sym} 430 -380 0 0 {name=p6 lab=C}
C {devices/vdd.sym} 470 -430 0 0 {name=l6 lab=VDD}
C {sky130_fd_pr/nfet_01v8.sym} 210 -120 0 0 {name=M8
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
C {devices/lab_pin.sym} 180 -120 0 0 {name=p7 sig_type=std_logic lab=C}
