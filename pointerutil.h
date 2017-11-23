#include <math.h>

int isPrime(int number) {
	int i, sqrtNumber = sqrt(number);

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