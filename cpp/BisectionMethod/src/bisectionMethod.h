/*
 * @author: Sevval MEHDER
 * 
 * Bisection Method Class Header File
 *
 */

#include <iostream>
#include <string>

class Bisection{


public:

	/*
	 * Constructor
	 */
	Bisection(double (*function)(double));

	/* This function implements Bisection method
	 * Params:
	 *		start_a the start of the root search interval as a real value
	 *		finish_b the end of the root search interval as a real value
	 *		stoppingCriterion  the type of stopping criterion as a String
	 *		epsilon ϵ as a real value
	 *		boolean, if we find a root before 100 iterations return true, otherwise false
	 */
	bool bisectionMethod(double start_a, double finish_b, std::string stoppingCriterion,
		double epsilon);

	/*
	 * This function checks the error
	 * Params:
	 * 		errorType the type of error
	 * 		rootF first root (P(n-1))
	 * 		rootS second root (P(n))
	 * 		epsilonValue the epsilon value
	 */
	bool ErrorChecks(std::string errorType, double rootF, double rootS, double epsilonValue );

	/*
	 * This function calculates the absolute error
	 * Params:
	 * 		root is the first root (P(n-1))
	 * 		rootNext is the second root (P(n))
	 * Return:
	 * 		the value of absolute error as double
	 */
	double calculateAbsoluteError(double root, double rootNext);

	/*
	 * This function calculates the relative error
	 * Params:
	 * 		root is the first root (P(n-1))
	 * 		rootNext is the second root (P(n))
	 * Return:
	 * 		the value of relative error as double
	 */
	double calculateRelativeError(double root, double rootNext);

	/*
	 * Setter for test function pointer
	 */
	void setTestFunction(double (*function)(double));

private:

	// The test function pointer
	double (*test_function)(double);

};