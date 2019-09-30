
// C++ program for implementation of Newton Raphson Method 
#include<bits/stdc++.h> 
#define ERROR 0.001 
using namespace std; 
  
double func(double x) 
{ 
    return x*x*x - x*x + 2;  //Define a Function 
} 

double derivative(double x) 
{ 
    return 3*x*x - 2*x; //Define its derivative
} 
  
// Function to find the root 
void NRaphson(double x) 
{ 
    double h = func(x) / derivative(x); 
    while (abs(h) >= ERROR) 
    { 
        h = func(x)/derivative(x); 
        x = x - h; 
    } 
  
    cout << "One of the roots is : " << x; 
} 
  
int main() 
{ 
    double x_0 = -10; // Initial Guess 
    NRaphson(x_0); 
    return 0; 
} 

