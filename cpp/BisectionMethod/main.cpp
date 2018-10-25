/*
 * @author: Sevval MEHDER
 */

#include <iostream>
#include <math.h>    // for exp()
#include <stdlib.h>  // for atof()
#include "bisectionMethod.h"


double F(double x);

int main(int argc, char *argv[]){

	if(argc != 5){
		std::cout << "Usage: ./bisection start_point finish_point stoppingCriterion epsilon" << std::endl;
		return 0;
	}

	// Create a Bisection object
	Bisection bMethod(&F);
	
	// Call the method function
	bMethod.bisectionMethod(atof(argv[1]), atof(argv[2]), argv[3], atof(argv[4]));

	return 1;
}

// F is a function as like y = x + 2
double F(double x){

	double result;

	//std::cout << "Function: x + 1 − 2sin(πx) = 0 for 0.5 ≤ x ≤ 1" << std::endl;
	result = (x + 1 - (2*sin(x*M_PI)));

	return result;

}