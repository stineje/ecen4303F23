stepsize 1500.0
vector A {A[7]} {A[6]} {A[5]} {A[4]} {A[3]} {A[2]} {A[1]} {A[0]}
vector B {B[7]} {B[6]} {B[5]} {B[4]} {B[3]} {B[2]} {B[1]} {B[0]}
vector Out {Z[8]} {Z[7]} {Z[6]} {Z[5]} {Z[4]} {Z[3]} {Z[2]} {Z[1]} {Z[0]}
ana -h A B cin Out clk en
analyzer
clock clk 0 1
h en
l gnd
h vdd
c
c
| loops
l cin
setvector A 10000001
setvector B 10100001
c
c
c
c
assert Out 100100010
h cin
setvector A 11001101
setvector B 11111101
c
c
c
c
assert Out 111001011
h cin
setvector A 00001100
setvector B 01110101
c
c
c
c
assert Out 010000010
h cin
setvector A 11011100
setvector B 00011111
c
c
c
c
assert Out 011111100
h cin
setvector A 10111100
setvector B 11110100
c
c
c
c
assert Out 110110001
h cin
setvector A 00010111
setvector B 00110111
c
c
c
c
assert Out 001001111
