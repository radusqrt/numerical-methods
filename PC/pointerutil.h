#include <math.h>

int isPrime(int number) {
	int i, sqrtNumber = sqrt(number);

	if (number < 2) return 0;
	if (number == 2) return 1;

	for (i = 2; i <= sqrtNumber; ++i) {
		if (number % i == 0)
			return 0;
	}

	return 1;
}

void getDataFromVector(int *v, int vLength, int *evenCount, int *primeCount, float *average) {
	int i;

	*evenCount = 0;
	*primeCount = 0;
	*average = 0;

	for (i = 0; i < vLength; ++i) {
		if (!(v[i] & 1)) { // equivalent to v[i] % 2 == 0
			(*evenCount) ++;
		}

		if (isPrime(v[i])) {
			(*primeCount) ++;
		}

		*average += v[i];
	}

	*average /= vLength;
}

int descendingComparingFunction (const void *first, const void *second) {
	// const se leaga de void, nu de *, deci elementele sunt constante,
	// nu pointerii

	// fiind (void *), dar noi stiind ca vom avea un vector de
	// elemente intregi pe care le comparam, putem face cast
	// la (int *) si cand se va dereferentia, va lua 4 octeti,
	// deci va compara elemente intregi. Analog, puteam face
	// cast la (char *) pentru elemente octeti etc.

	return *((int *) second) - *((int *) first);
}

int ascendingComparingFunction (const void *first, const void *second) {
	return *((int *) first) - *((int *) second);
}

void printVector(int v[], int length) {
	int i;
	for (i = 0; i < length; ++i) {
		printf("%d ", v[i]);
	}
	printf("\n");
}
