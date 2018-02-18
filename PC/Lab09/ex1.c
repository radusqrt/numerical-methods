#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "../pointerutil.h"

int main() {
    int n, max, i, *v;

    srand(time(NULL));
    scanf("%d%d", &n, &max);
    v = malloc(n * sizeof(int));
    if (v == NULL) {
        exit(1);
    }

    for (i = 0; i < n; ++i) {
        v[i] = rand() % max;
    }

    printf("Inainte de sortare: ");
    printVector(v, n);

    qsort(v, n, sizeof(int), ascendingComparingFunction);
    printf("Dupa sortare: ");
    printVector(v, n);

    free(v);
    return 0;
}
