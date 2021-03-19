#include<bits/stdc++.h>
using namespace std;

#define EPSILON 0.01
#define MOD 1000

int MAX_POWER;
double coef_arr[MAX_POWER+1];

double get_val(double x){
	double val = 0;
	for(int i=0; i<=MAX_POWER; i++){
		val += coef_arr[i]*pow(x, i);
	}
	return val;
}

double get_roots_by_bisection(double a, double b){
	double c;
	if(get_val(b)<0){
		c=b;
		b=a;
		a=c;
	}
	while (abs(b-a) >= EPSILON){
		c = (a+b)/2;

		if (get_val(c) == 0.0)
			break;

		else if (get_val(c)*get_val(a) < 0)
			b = c;

		else
			a = c;
	}
	return c;
}

int main(){
	srand(time(0));
	double a, b, ans; 
  
  cout << "Enter highest power in polynomial";
  cin >> MAX_POWER;
  
  cout << "Enter co-effecients of polynomial starting from degree 0 to " << MAX_POWER;
	for(int i=0; i<=MAX_POWER; i++){
		cin >> coef_arr[i];
	}
  
	a = -rand()%MOD;
	b = rand()%MOD;
	ans = get_roots_by_bisection(a, b);
  
	cout << " The value of root is : " << ans;
	return 0;
}
