/*
 * Author: James E. Stine, Jr.
 * Affiliation: Oklahoma State University
 * Objective: IRSIM test vectors 
 * Project Fall 2023
 * 
 * Notes: gcc -o bit_test bit_test.c -lm
 *
 *
 */

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

/*
  Binary Conversion
*/

void disp_bin(double x, int bits_to_left, int bits_to_right) {

  double diff;
  int i;
  if (fabs(x) <  pow(2.0, -bits_to_right)) {
    for (i = -bits_to_left + 1; i <= bits_to_right; i++) {
      printf("0");
    }
    return;
  }
  if (x < 0.0) {
    x = pow(2.0, ((double) bits_to_left)) + x;
  }
  for (i = -bits_to_left + 1; i <= bits_to_right; i++) {
    diff = pow(2.0, -i);
    if (x < diff) {
      printf("0");
    }
    else {
      printf("1");
      x -= diff;
    }
    if (i == 0) {
      printf("");
    }
  }
}


/* main loop */
int main() {

  /* Number of Bits */
  int bits = 8;
  /* Number of Loops (set 0 for no loops) */
  int loops = 16;
  /* Random Initialize for Q */
  srand(time(NULL)); 

  /* input operands */
  int b;
  int a;
  int cin;
  int Q;
  /* loop counter */
  int i;
  /* sum or difference */
  int sum;

  /* Add comment to IRSIM CMD file */
  printf("| loops\n");

  /* Initialize : you never know */
  sum = 0;
  /* Perform Loop */
  for (i=0; i < loops; i++) {    
    a = (int) rand() % 256;
    b = (int) rand() % 256;
    cin = (int) rand() % 2;
    // Easy: set cin = 0
    if (cin == 1)
      printf("h cin\n");
    else
      printf("l cin\n");
    printf("setvector A ");
    disp_bin(a, bits, 0);
    printf("\n");
    printf("setvector B ");
    disp_bin(b, bits, 0);
    /* Compute true answer */
    Q = a + b + cin;
    // Let's wait 4 cycles for correct answer
    printf("\n");
    printf("c\n");
    printf("c\n");
    printf("c\n");
    printf("c\n");
    printf("assert Out ");
    // Add 1 bit for cout
    disp_bin(Q, bits+1, 0);
    printf("\n");
  }

}


