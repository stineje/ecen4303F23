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
setvector A 01100001
setvector B 01001110
c
c
c
c
assert Out 010101111
l cin
setvector A 11101111
setvector B 10110011
c
c
c
c
assert Out 110100010
l cin
setvector A 00110011
setvector B 11010100
c
c
c
c
assert Out 100000111
l cin
setvector A 00101011
setvector B 10111110
c
c
c
c
assert Out 011101001
