#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

bool is_palindrome(int n) {
  int l = floor(log10(abs(n))) + 2;
  char *s = malloc(l * sizeof(char));

  sprintf(s, "%d", n);

  for (int i = 0; i < (l - 1) / 2; i++) {
    if (s[i] != s[l - i - 2])
      return false;
  }
  return true;
}

int main(int argc, char *argv[]) {

  unsigned int pal = 0;
  for (int i = 999; i > 99; i--) {
    for (int j = 999; j > 99; j--) {
      unsigned int n = i * j;
      if (is_palindrome(n) && n > pal)
        pal = n;
    }
  }

  printf("%d\n", pal);

  return 0;
}
