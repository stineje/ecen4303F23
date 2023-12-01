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
setvector A 00111101
setvector B 10101101
c
c
c
c
assert Out 011101010
h cin
setvector A 11101011
setvector B 10100111
c
c
c
c
assert Out 110010011
l cin
setvector A 00000100
setvector B 11111110
c
c
c
c
assert Out 100000010
l cin
setvector A 11001111
setvector B 10001000
c
c
c
c
assert Out 101010111
l cin
setvector A 00011011
setvector B 10010001
c
c
c
c
assert Out 010101100
h cin
setvector A 10101001
setvector B 00101001
c
c
c
c
assert Out 011010011
l cin
setvector A 11111110
setvector B 00101110
c
c
c
c
assert Out 100101100
l cin
setvector A 10000110
setvector B 10000010
c
c
c
c
assert Out 100001000
l cin
setvector A 11010001
setvector B 00111101
c
c
c
c
assert Out 100001110
h cin
setvector A 01110000
setvector B 10110100
c
c
c
c
assert Out 100100101
l cin
setvector A 01100010
setvector B 11110001
c
c
c
c
assert Out 101010011
h cin
setvector A 10111010
setvector B 11011101
c
c
c
c
assert Out 110011000
h cin
setvector A 00010010
setvector B 11100001
c
c
c
c
assert Out 011110100
l cin
setvector A 01111100
setvector B 10110000
c
c
c
c
assert Out 100101100
h cin
setvector A 11010100
setvector B 11001011
c
c
c
c
assert Out 110100000
h cin
setvector A 00011101
setvector B 01110101
c
c
c
c
assert Out 010010011
