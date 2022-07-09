#include <stdbool.h>
#include <stdio.h>

int main() {
  for (int i = 20; true; i++) {

    bool d = true;
    for (int j = 11; j < 21; j++) {
      if (i % j != 0) {
        d = false;
        break;
      }
    }

    if (d) {
      printf("%d\n", i);
      return 0;
    }
  }

  return 1;
}
