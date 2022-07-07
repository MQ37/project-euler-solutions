#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

bool is_prime(long long unsigned int n) {
  for (long long unsigned int i = 2; i * i < n; i++) {
    if (n % i == 0)
      return false;
  }
  return true;
}

long long unsigned int prime_factor(long long unsigned int n) {
  long long unsigned int f = 0;
  for (long long unsigned int i = 2; i * i < n + 1; i++) {
    if (n % i == 0) {
      if (is_prime(i) && i > f) {
        f = i;
      }

      long long unsigned int inv = n / i;
      if (is_prime(inv) && inv > f) {
        f = inv;
      }
    }
  }

  return f;
}

int main(int argc, char *argv[]) {
  long long unsigned int a = 600851475143LLU;

  long long unsigned int fact = prime_factor(a);
  printf("%llu\n", fact);
  return 0;
}
