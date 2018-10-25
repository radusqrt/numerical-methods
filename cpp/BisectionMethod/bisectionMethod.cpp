/*
 * @author: Sevval MEHDER
 * 
 * Bisection Method Class soruce codes
 *
 */

#include "bisectionMethod.h"
#include <cmath> // for abs()
#include <iomanip> // for setw

Bisection::Bisection(double (*function)(double)){

	// Set the coming function as a test function
	setTestFunction(function);

}

bool Bisection::bisectionMethod(double start_a, double finish_b, std::string stoppingCriterion,
		double epsilon){

	// Current Iteration Value
	int curIterVal = 1; 
	double root, rootNext;
	double a = start_a, b = finish_b;

	// Find the root
	root = (start_a + finish_b) / 2;
	
	// Show the values
	std::cout << "Iteration: " << curIterVal 
		<< "\t the absolute error: " << calculateAbsoluteError(start_a, root)
		<< "\t the relative error: " << calculateRelativeError(start_a ,root) << std::endl;

	do{	
		// If they have opposite sign
		if( (*test_function)(start_a) * (*test_function)(root) < 0)
			b = root;
		else
			a = root;

		// Change the root
		rootNext = (a + b) / 2;

		//Before 100 iteration, search the given stopping criterion
        if( ErrorChecks(stoppingCriterion, root, rootNext, epsilon) ){

        	++curIterVal;

        	// Show the values
			std::cout << "Iteration: " << curIterVal 
				<< "\t the absolute error: " << std::setw(10) << calculateAbsoluteError(root, rootNext)
				<< "\t the relative error: " << std::setw(10) << calculateRelativeError(root, rootNext) << std::endl;

			// Show the result
			std::cout << "After " << curIterVal << " iterations, approximate root is found "
			<< rootNext << "\nTheoretically required " << curIterVal << "iterations" << std::endl; 
			return true;

        }
        // Increase the iteration
        ++curIterVal;

        // Show the values
		std::cout << "Iteration: " << curIterVal 
			<< "\t the absolute error: " << std::setw(10) << calculateAbsoluteError(root, rootNext)
			<< "\t the relative error: " << std::setw(10) << calculateRelativeError(root, rootNext) << std::endl;

		root = rootNext;
	}
	while(curIterVal <= 100);
	// After 100 iteration give an error message

	std::cout << "There is no root on this " << std::endl;

	return false;
}

bool Bisection::ErrorChecks( std::string errorType, double rootF, double rootS, double epsilonValue){

	if(errorType.compare("DISTANCE_TO_ROOT") == 0){

		if(std::abs((*test_function)(rootS)) < epsilonValue)
			return true;
		else
			return false;
	}
	else if(errorType.compare("ABSOLUTE_ERROR") == 0){

		if(std::abs( rootS - rootF ) < epsilonValue)
			return true;
		else
			return false;

	}
	else if(errorType.compare("RELATIVE_ERROR") == 0){

		if(std::abs( rootS - rootF ) / std::abs(rootS) < epsilonValue)
			return true;
		else
			return false;

	}
	else
		return false;
}


double Bisection::calculateAbsoluteError(double root, double rootNext){
	
	return std::abs(rootNext - root);

}

double Bisection::calculateRelativeError(double root, double rootNext){
	
	return std::abs(rootNext - root) / std::abs(rootNext);
	
}

void Bisection::setTestFunction(double (*function)(double)){

	test_function = function;

}