#include <stdio.h>

int main() {

  unsigned int sum_sq = 0;
  for (int i = 1; i < 101; i++) {
    sum_sq += i;
  }
  sum_sq *= sum_sq;

  unsigned int sq_sum = 0;
  for (int i = 1; i < 101; i++) {
    sq_sum += i * i;
  }

  printf("%d\n", sum_sq - sq_sum);

  return 0;
}
