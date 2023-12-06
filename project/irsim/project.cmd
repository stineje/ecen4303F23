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
setvector A 10010000
setvector B 11010010
c
c
c
c
assert Out 101100010
l cin
setvector A 01001111
setvector B 10111000
c
c
c
c
assert Out 100000111
h cin
setvector A 01101001
setvector B 10101101
c
c
c
c
assert Out 100010111
h cin
setvector A 10111001
setvector B 11110001
c
c
c
c
assert Out 110101011
h cin
setvector A 00101010
setvector B 01100101
c
c
c
c
assert Out 010010000
l cin
setvector A 01100110
setvector B 11000111
c
c
c
c
assert Out 100101101
h cin
setvector A 01111010
setvector B 01010011
c
c
c
c
assert Out 011001110
l cin
setvector A 00100010
setvector B 00010000
c
c
c
c
assert Out 000110010
h cin
setvector A 00010101
setvector B 10001100
c
c
c
c
assert Out 010100010
h cin
setvector A 01100000
setvector B 01110011
c
c
c
c
assert Out 011010100
h cin
setvector A 01010111
setvector B 00000011
c
c
c
c
assert Out 001011011
h cin
setvector A 11100000
setvector B 01010010
c
c
c
c
assert Out 100110011
l cin
setvector A 10111000
setvector B 10111011
c
c
c
c
assert Out 101110011
h cin
setvector A 00011011
setvector B 01110100
c
c
c
c
assert Out 010010000
h cin
setvector A 00001000
setvector B 10011110
c
c
c
c
assert Out 010100111
l cin
setvector A 10001011
setvector B 00000100
c
c
c
c
assert Out 010001111
l cin
setvector A 01010110
setvector B 01111111
c
c
c
c
assert Out 011010101
l cin
setvector A 11001001
setvector B 10100001
c
c
c
c
assert Out 101101010
l cin
setvector A 10001100
setvector B 10110111
c
c
c
c
assert Out 101000011
h cin
setvector A 01011011
setvector B 00010111
c
c
c
c
assert Out 001110011
h cin
setvector A 11110110
setvector B 01101111
c
c
c
c
assert Out 101100110
h cin
setvector A 01100011
setvector B 01001111
c
c
c
c
assert Out 010110011
h cin
setvector A 10001000
setvector B 00000111
c
c
c
c
assert Out 010010000
h cin
setvector A 01011010
setvector B 00100010
c
c
c
c
assert Out 001111101
l cin
setvector A 00011101
setvector B 00101010
c
c
c
c
assert Out 001000111
l cin
setvector A 01000110
setvector B 10110110
c
c
c
c
assert Out 011111100
h cin
setvector A 00110111
setvector B 00001100
c
c
c
c
assert Out 001000100
h cin
setvector A 01111011
setvector B 11010101
c
c
c
c
assert Out 101010001
l cin
setvector A 11001111
setvector B 01100001
c
c
c
c
assert Out 100110000
h cin
setvector A 10110000
setvector B 10111100
c
c
c
c
assert Out 101101101
l cin
setvector A 00000011
setvector B 10110010
c
c
c
c
assert Out 010110101
h cin
setvector A 01011010
setvector B 00010101
c
c
c
c
assert Out 001110000
l cin
setvector A 00000100
setvector B 10011101
c
c
c
c
assert Out 010100001
l cin
setvector A 01101001
setvector B 11110111
c
c
c
c
assert Out 101100000
h cin
setvector A 01000010
setvector B 00010101
c
c
c
c
assert Out 001011000
h cin
setvector A 10111010
setvector B 01011011
c
c
c
c
assert Out 100010110
h cin
setvector A 00110111
setvector B 10010010
c
c
c
c
assert Out 011001010
l cin
setvector A 00110010
setvector B 00001101
c
c
c
c
assert Out 000111111
l cin
setvector A 11001111
setvector B 11011101
c
c
c
c
assert Out 110101100
l cin
setvector A 00100011
setvector B 10001101
c
c
c
c
assert Out 010110000
h cin
setvector A 10001111
setvector B 10010000
c
c
c
c
assert Out 100100000
l cin
setvector A 01101001
setvector B 11101011
c
c
c
c
assert Out 101010100
l cin
setvector A 10010011
setvector B 11101111
c
c
c
c
assert Out 110000010
h cin
setvector A 11000011
setvector B 01011000
c
c
c
c
assert Out 100011100
l cin
setvector A 00010110
setvector B 10011010
c
c
c
c
assert Out 010110000
l cin
setvector A 10010011
setvector B 01010101
c
c
c
c
assert Out 011101000
l cin
setvector A 11000110
setvector B 10001100
c
c
c
c
assert Out 101010010
l cin
setvector A 00000101
setvector B 10111110
c
c
c
c
assert Out 011000011
h cin
setvector A 00011001
setvector B 10001110
c
c
c
c
assert Out 010101000
l cin
setvector A 10001111
setvector B 10110001
c
c
c
c
assert Out 101000000
l cin
setvector A 11000010
setvector B 01000000
c
c
c
c
assert Out 100000010
h cin
setvector A 10100111
setvector B 10101010
c
c
c
c
assert Out 101010010
l cin
setvector A 10100001
setvector B 00111101
c
c
c
c
assert Out 011011110
l cin
setvector A 00111001
setvector B 00000000
c
c
c
c
assert Out 000111001
h cin
setvector A 11001001
setvector B 00010110
c
c
c
c
assert Out 011100000
l cin
setvector A 01101101
setvector B 10101001
c
c
c
c
assert Out 100010110
l cin
setvector A 01101101
setvector B 01101111
c
c
c
c
assert Out 011011100
l cin
setvector A 00000000
setvector B 01110100
c
c
c
c
assert Out 001110100
l cin
setvector A 10100000
setvector B 10001110
c
c
c
c
assert Out 100101110
l cin
setvector A 00011101
setvector B 00011101
c
c
c
c
assert Out 000111010
l cin
setvector A 00100111
setvector B 11011111
c
c
c
c
assert Out 100000110
l cin
setvector A 11000001
setvector B 10000110
c
c
c
c
assert Out 101000111
h cin
setvector A 01000111
setvector B 00101000
c
c
c
c
assert Out 001110000
l cin
setvector A 10111011
setvector B 01100001
c
c
c
c
assert Out 100011100
l cin
setvector A 10001000
setvector B 00101010
c
c
c
c
assert Out 010110010
l cin
setvector A 11101111
setvector B 10011000
c
c
c
c
assert Out 110000111
h cin
setvector A 10101011
setvector B 00000101
c
c
c
c
assert Out 010110001
l cin
setvector A 11110011
setvector B 00000101
c
c
c
c
assert Out 011111000
l cin
setvector A 11111001
setvector B 10100101
c
c
c
c
assert Out 110011110
h cin
setvector A 10001110
setvector B 11000010
c
c
c
c
assert Out 101010001
h cin
setvector A 11010100
setvector B 11101001
c
c
c
c
assert Out 110111110
h cin
setvector A 01011010
setvector B 10101011
c
c
c
c
assert Out 100000110
h cin
setvector A 10001011
setvector B 11110010
c
c
c
c
assert Out 101111110
h cin
setvector A 11111000
setvector B 10101101
c
c
c
c
assert Out 110100110
h cin
setvector A 01100110
setvector B 00110101
c
c
c
c
assert Out 010011100
h cin
setvector A 11101011
setvector B 00100100
c
c
c
c
assert Out 100010000
h cin
setvector A 00011001
setvector B 11001111
c
c
c
c
assert Out 011101001
l cin
setvector A 10110110
setvector B 11000010
c
c
c
c
assert Out 101111000
l cin
setvector A 11001000
setvector B 10111100
c
c
c
c
assert Out 110000100
l cin
setvector A 01101000
setvector B 01001010
c
c
c
c
assert Out 010110010
l cin
setvector A 00100110
setvector B 00011110
c
c
c
c
assert Out 001000100
h cin
setvector A 11000011
setvector B 01111000
c
c
c
c
assert Out 100111100
h cin
setvector A 11100110
setvector B 00000011
c
c
c
c
assert Out 011101010
l cin
setvector A 00110010
setvector B 11111100
c
c
c
c
assert Out 100101110
l cin
setvector A 11011111
setvector B 01100010
c
c
c
c
assert Out 101000001
l cin
setvector A 10110110
setvector B 01001101
c
c
c
c
assert Out 100000011
l cin
setvector A 00100110
setvector B 01100110
c
c
c
c
assert Out 010001100
l cin
setvector A 10011011
setvector B 00011101
c
c
c
c
assert Out 010111000
l cin
setvector A 00010101
setvector B 11100101
c
c
c
c
assert Out 011111010
l cin
setvector A 00110101
setvector B 01001110
c
c
c
c
assert Out 010000011
l cin
setvector A 00011000
setvector B 01110100
c
c
c
c
assert Out 010001100
h cin
setvector A 11100100
setvector B 00110111
c
c
c
c
assert Out 100011100
l cin
setvector A 01011011
setvector B 00011101
c
c
c
c
assert Out 001111000
l cin
setvector A 11000100
setvector B 01001111
c
c
c
c
assert Out 100010011
h cin
setvector A 11011010
setvector B 00101110
c
c
c
c
assert Out 100001001
l cin
setvector A 00100110
setvector B 11100101
c
c
c
c
assert Out 100001011
h cin
setvector A 10010111
setvector B 00001011
c
c
c
c
assert Out 010100011
l cin
setvector A 11010111
setvector B 10100110
c
c
c
c
assert Out 101111101
h cin
setvector A 11011001
setvector B 10111011
c
c
c
c
assert Out 110010101
h cin
setvector A 10011000
setvector B 11110001
c
c
c
c
assert Out 110001010
h cin
setvector A 10100000
setvector B 00001001
c
c
c
c
assert Out 010101010
l cin
setvector A 11000111
setvector B 11101101
c
c
c
c
assert Out 110110100
l cin
setvector A 01100110
setvector B 01001000
c
c
c
c
assert Out 010101110
h cin
setvector A 00001000
setvector B 00001100
c
c
c
c
assert Out 000010101
l cin
setvector A 10100111
setvector B 11100110
c
c
c
c
assert Out 110001101
h cin
setvector A 10101000
setvector B 00001101
c
c
c
c
assert Out 010110110
l cin
setvector A 11110110
setvector B 10100100
c
c
c
c
assert Out 110011010
l cin
setvector A 10101011
setvector B 01111011
c
c
c
c
assert Out 100100110
h cin
setvector A 01111101
setvector B 01010100
c
c
c
c
assert Out 011010010
l cin
setvector A 00110101
setvector B 11101100
c
c
c
c
assert Out 100100001
h cin
setvector A 00111010
setvector B 10001101
c
c
c
c
assert Out 011001000
l cin
setvector A 10110100
setvector B 01010100
c
c
c
c
assert Out 100001000
l cin
setvector A 01100100
setvector B 10111010
c
c
c
c
assert Out 100011110
l cin
setvector A 00110010
setvector B 11000010
c
c
c
c
assert Out 011110100
h cin
setvector A 01010000
setvector B 01101001
c
c
c
c
assert Out 010111010
l cin
setvector A 10011100
setvector B 00010001
c
c
c
c
assert Out 010101101
l cin
setvector A 11001101
setvector B 00001000
c
c
c
c
assert Out 011010101
h cin
setvector A 00001001
setvector B 10110011
c
c
c
c
assert Out 010111101
h cin
setvector A 11101011
setvector B 00110001
c
c
c
c
assert Out 100011101
l cin
setvector A 10001000
setvector B 01100110
c
c
c
c
assert Out 011101110
h cin
setvector A 00010111
setvector B 10100000
c
c
c
c
assert Out 010111000
h cin
setvector A 10101110
setvector B 01010100
c
c
c
c
assert Out 100000011
h cin
setvector A 00110011
setvector B 10111001
c
c
c
c
assert Out 011101101
h cin
setvector A 11111111
setvector B 11101011
c
c
c
c
assert Out 111101011
h cin
setvector A 11011000
setvector B 00111011
c
c
c
c
assert Out 100010100
l cin
setvector A 10010111
setvector B 11010111
c
c
c
c
assert Out 101101110
l cin
setvector A 01100011
setvector B 10100100
c
c
c
c
assert Out 100000111
l cin
setvector A 11010011
setvector B 10101101
c
c
c
c
assert Out 110000000
h cin
setvector A 10111110
setvector B 10011000
c
c
c
c
assert Out 101010111
h cin
setvector A 11111101
setvector B 00100001
c
c
c
c
assert Out 100011111
h cin
setvector A 00101001
setvector B 00111000
c
c
c
c
assert Out 001100010
l cin
setvector A 11100010
setvector B 11100110
c
c
c
c
assert Out 111001000
h cin
setvector A 11101111
setvector B 00011001
c
c
c
c
assert Out 100001001
l cin
setvector A 10110110
setvector B 00011001
c
c
c
c
assert Out 011001111
l cin
setvector A 01000000
setvector B 11110001
c
c
c
c
assert Out 100110001
h cin
setvector A 00110011
setvector B 10001000
c
c
c
c
assert Out 010111100
l cin
setvector A 00110111
setvector B 11101011
c
c
c
c
assert Out 100100010
h cin
setvector A 01000100
setvector B 10111110
c
c
c
c
assert Out 100000011
l cin
setvector A 00000100
setvector B 01111100
c
c
c
c
assert Out 010000000
h cin
setvector A 11110101
setvector B 01111001
c
c
c
c
assert Out 101101111
h cin
setvector A 01001100
setvector B 10100011
c
c
c
c
assert Out 011110000
h cin
setvector A 01000011
setvector B 10000101
c
c
c
c
assert Out 011001001
h cin
setvector A 10001111
setvector B 01110101
c
c
c
c
assert Out 100000101
l cin
setvector A 10010100
setvector B 00101011
c
c
c
c
assert Out 010111111
h cin
setvector A 10000101
setvector B 01101011
c
c
c
c
assert Out 011110001
h cin
setvector A 10110001
setvector B 10011110
c
c
c
c
assert Out 101010000
l cin
setvector A 10110100
setvector B 11010110
c
c
c
c
assert Out 110001010
l cin
setvector A 01011100
setvector B 00011010
c
c
c
c
assert Out 001110110
l cin
setvector A 10110010
setvector B 00011110
c
c
c
c
assert Out 011010000
h cin
setvector A 10100000
setvector B 00010011
c
c
c
c
assert Out 010110100
l cin
setvector A 10101111
setvector B 01011111
c
c
c
c
assert Out 100001110
l cin
setvector A 11110110
setvector B 10100010
c
c
c
c
assert Out 110011000
h cin
setvector A 00100011
setvector B 00110010
c
c
c
c
assert Out 001010110
l cin
setvector A 01101010
setvector B 11000110
c
c
c
c
assert Out 100110000
l cin
setvector A 11001010
setvector B 01001011
c
c
c
c
assert Out 100010101
l cin
setvector A 00011011
setvector B 11111100
c
c
c
c
assert Out 100010111
l cin
setvector A 11110100
setvector B 10110001
c
c
c
c
assert Out 110100101
l cin
setvector A 10111000
setvector B 00001101
c
c
c
c
assert Out 011000101
l cin
setvector A 00111010
setvector B 10111111
c
c
c
c
assert Out 011111001
h cin
setvector A 00111000
setvector B 01011111
c
c
c
c
assert Out 010011000
l cin
setvector A 10110000
setvector B 00001110
c
c
c
c
assert Out 010111110
h cin
setvector A 11001010
setvector B 00000100
c
c
c
c
assert Out 011001111
h cin
setvector A 01101010
setvector B 00101000
c
c
c
c
assert Out 010010011
h cin
setvector A 01111111
setvector B 10010010
c
c
c
c
assert Out 100010010
h cin
setvector A 11000000
setvector B 01011101
c
c
c
c
assert Out 100011110
h cin
setvector A 01101100
setvector B 01111000
c
c
c
c
assert Out 011100101
l cin
setvector A 10110110
setvector B 01101101
c
c
c
c
assert Out 100100011
l cin
setvector A 11010111
setvector B 00100101
c
c
c
c
assert Out 011111100
h cin
setvector A 00010001
setvector B 01100000
c
c
c
c
assert Out 001110010
h cin
setvector A 01101010
setvector B 10011000
c
c
c
c
assert Out 100000011
h cin
setvector A 11010101
setvector B 01001000
c
c
c
c
assert Out 100011110
l cin
setvector A 10100000
setvector B 00010011
c
c
c
c
assert Out 010110011
l cin
setvector A 00001101
setvector B 01111101
c
c
c
c
assert Out 010001010
l cin
setvector A 10101100
setvector B 11111101
c
c
c
c
assert Out 110101001
h cin
setvector A 00010001
setvector B 10111101
c
c
c
c
assert Out 011001111
l cin
setvector A 11000010
setvector B 00101001
c
c
c
c
assert Out 011101011
h cin
setvector A 01110000
setvector B 11011111
c
c
c
c
assert Out 101010000
l cin
setvector A 11001110
setvector B 10110110
c
c
c
c
assert Out 110000100
l cin
setvector A 00111010
setvector B 11001000
c
c
c
c
assert Out 100000010
h cin
setvector A 01100110
setvector B 00110010
c
c
c
c
assert Out 010011001
h cin
setvector A 11110001
setvector B 00000111
c
c
c
c
assert Out 011111001
l cin
setvector A 10001010
setvector B 10100111
c
c
c
c
assert Out 100110001
l cin
setvector A 00101000
setvector B 10110100
c
c
c
c
assert Out 011011100
h cin
setvector A 11101110
setvector B 01100000
c
c
c
c
assert Out 101001111
l cin
setvector A 01000111
setvector B 01110010
c
c
c
c
assert Out 010111001
h cin
setvector A 11111100
setvector B 00110100
c
c
c
c
assert Out 100110001
l cin
setvector A 00101010
setvector B 10100100
c
c
c
c
assert Out 011001110
h cin
setvector A 11000101
setvector B 01110011
c
c
c
c
assert Out 100111001
h cin
setvector A 10000110
setvector B 10101101
c
c
c
c
assert Out 100110100
h cin
setvector A 10100110
setvector B 00010011
c
c
c
c
assert Out 010111010
l cin
setvector A 01011111
setvector B 00000100
c
c
c
c
assert Out 001100011
l cin
setvector A 01100001
setvector B 10001111
c
c
c
c
assert Out 011110000
l cin
setvector A 01110101
setvector B 10110111
c
c
c
c
assert Out 100101100
h cin
setvector A 00000111
setvector B 10100110
c
c
c
c
assert Out 010101110
h cin
setvector A 10010110
setvector B 11101101
c
c
c
c
assert Out 110000100
h cin
setvector A 11100010
setvector B 11101001
c
c
c
c
assert Out 111001100
l cin
setvector A 01010111
setvector B 00010100
c
c
c
c
assert Out 001101011
h cin
setvector A 10101100
setvector B 11011001
c
c
c
c
assert Out 110000110
l cin
setvector A 10110111
setvector B 01011111
c
c
c
c
assert Out 100010110
l cin
setvector A 10001010
setvector B 00000110
c
c
c
c
assert Out 010010000
l cin
setvector A 10001111
setvector B 01100101
c
c
c
c
assert Out 011110100
h cin
setvector A 10011011
setvector B 11000110
c
c
c
c
assert Out 101100010
h cin
setvector A 01001111
setvector B 00111100
c
c
c
c
assert Out 010001100
h cin
setvector A 10111000
setvector B 01000011
c
c
c
c
assert Out 011111100
l cin
setvector A 10000001
setvector B 11011010
c
c
c
c
assert Out 101011011
h cin
setvector A 10111100
setvector B 10111100
c
c
c
c
assert Out 101111001
h cin
setvector A 00101011
setvector B 00010100
c
c
c
c
assert Out 001000000
h cin
setvector A 00111111
setvector B 11000000
c
c
c
c
assert Out 100000000
l cin
setvector A 11000110
setvector B 01110111
c
c
c
c
assert Out 100111101
l cin
setvector A 11111011
setvector B 00000001
c
c
c
c
assert Out 011111100
l cin
setvector A 01000011
setvector B 10010000
c
c
c
c
assert Out 011010011
l cin
setvector A 10001111
setvector B 00101011
c
c
c
c
assert Out 010111010
l cin
setvector A 01101011
setvector B 01111011
c
c
c
c
assert Out 011100110
l cin
setvector A 11111110
setvector B 00110011
c
c
c
c
assert Out 100110001
l cin
setvector A 00110111
setvector B 10110100
c
c
c
c
assert Out 011101011
l cin
setvector A 01011101
setvector B 01110000
c
c
c
c
assert Out 011001101
l cin
setvector A 01101100
setvector B 10011011
c
c
c
c
assert Out 100000111
l cin
setvector A 10010000
setvector B 11011011
c
c
c
c
assert Out 101101011
h cin
setvector A 10001101
setvector B 10100001
c
c
c
c
assert Out 100101111
l cin
setvector A 11101001
setvector B 10011100
c
c
c
c
assert Out 110000101
l cin
setvector A 01001100
setvector B 11011111
c
c
c
c
assert Out 100101011
l cin
setvector A 00010100
setvector B 01101111
c
c
c
c
assert Out 010000011
h cin
setvector A 10100010
setvector B 11011010
c
c
c
c
assert Out 101111101
l cin
setvector A 01101101
setvector B 11011000
c
c
c
c
assert Out 101000101
l cin
setvector A 01111011
setvector B 00001111
c
c
c
c
assert Out 010001010
l cin
setvector A 01100011
setvector B 01101100
c
c
c
c
assert Out 011001111
h cin
setvector A 00000111
setvector B 11011000
c
c
c
c
assert Out 011100000
l cin
setvector A 11000000
setvector B 01101000
c
c
c
c
assert Out 100101000
l cin
setvector A 00111000
setvector B 11110101
c
c
c
c
assert Out 100101101
l cin
setvector A 00101000
setvector B 11011111
c
c
c
c
assert Out 100000111
l cin
setvector A 00011000
setvector B 00101011
c
c
c
c
assert Out 001000011
h cin
setvector A 10011001
setvector B 00111111
c
c
c
c
assert Out 011011001
h cin
setvector A 01000101
setvector B 11100001
c
c
c
c
assert Out 100100111
h cin
setvector A 01101100
setvector B 01001110
c
c
c
c
assert Out 010111011
l cin
setvector A 11000110
setvector B 11001001
c
c
c
c
assert Out 110001111
l cin
setvector A 11010100
setvector B 00101100
c
c
c
c
assert Out 100000000
l cin
setvector A 01010010
setvector B 00110100
c
c
c
c
assert Out 010000110
h cin
setvector A 01101011
setvector B 11110100
c
c
c
c
assert Out 101100000
l cin
setvector A 01100000
setvector B 00101100
c
c
c
c
assert Out 010001100
h cin
setvector A 11110110
setvector B 01010100
c
c
c
c
assert Out 101001011
l cin
setvector A 00101000
setvector B 01101101
c
c
c
c
assert Out 010010101
h cin
setvector A 00111010
setvector B 00000110
c
c
c
c
assert Out 001000001
h cin
setvector A 10111011
setvector B 01001011
c
c
c
c
assert Out 100000111
h cin
setvector A 00010110
setvector B 10110111
c
c
c
c
assert Out 011001110
h cin
setvector A 01001001
setvector B 01111101
c
c
c
c
assert Out 011000111
h cin
setvector A 10001011
setvector B 01010001
c
c
c
c
assert Out 011011101
h cin
setvector A 00111001
setvector B 10100011
c
c
c
c
assert Out 011011101
h cin
setvector A 11000000
setvector B 00001110
c
c
c
c
assert Out 011001111
l cin
setvector A 10101111
setvector B 01101110
c
c
c
c
assert Out 100011101
l cin
setvector A 10010011
setvector B 01100100
c
c
c
c
assert Out 011110111
h cin
setvector A 01010111
setvector B 10001101
c
c
c
c
assert Out 011100101
h cin
setvector A 01000101
setvector B 11000111
c
c
c
c
assert Out 100001101
l cin
setvector A 01110011
setvector B 10000011
c
c
c
c
assert Out 011110110
h cin
setvector A 10000010
setvector B 10011001
c
c
c
c
assert Out 100011100
l cin
setvector A 11011111
setvector B 11100011
c
c
c
c
assert Out 111000010
h cin
setvector A 00000110
setvector B 01101110
c
c
c
c
assert Out 001110101
