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
h cin
setvector A 11010110
setvector B 11001111
c
c
c
c
assert Out 110100110
l cin
setvector A 00100110
setvector B 01011000
c
c
c
c
assert Out 001111110
h cin
setvector A 01000001
setvector B 10000101
c
c
c
c
assert Out 011000111
l cin
setvector A 01101111
setvector B 10010101
c
c
c
c
assert Out 100000100
l cin
setvector A 01101000
setvector B 01111000
c
c
c
c
assert Out 011100000
h cin
setvector A 11111100
setvector B 11101010
c
c
c
c
assert Out 111100111
l cin
setvector A 10101101
setvector B 01100000
c
c
c
c
assert Out 100001101
l cin
setvector A 01000111
setvector B 10001111
c
c
c
c
assert Out 011010110
h cin
setvector A 01111111
setvector B 11111110
c
c
c
c
assert Out 101111110
l cin
setvector A 10100001
setvector B 01101000
c
c
c
c
assert Out 100001001
l cin
setvector A 00010000
setvector B 00111110
c
c
c
c
assert Out 001001110
l cin
setvector A 01010111
setvector B 01100100
c
c
c
c
assert Out 010111011
l cin
setvector A 01101011
setvector B 10100110
c
c
c
c
assert Out 100010001
h cin
setvector A 00001110
setvector B 00010101
c
c
c
c
assert Out 000100100
l cin
setvector A 10000011
setvector B 01111101
c
c
c
c
assert Out 100000000
l cin
setvector A 10001011
setvector B 01111001
c
c
c
c
assert Out 100000100
