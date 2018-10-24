#include <cmath>
#include <iostream>
#include <vector>

using namespace std;


void cholesky(vector <vector <double> > & Matrix){
	int i, j, k;
	double sum=0;
    int n = Matrix.size();
    vector <vector <double> >  Cholesky(n, vector<double> (n,0));

	/*------------CHOLESKY-------------------*/
    // doing it for the lower triangular matrix because it's the its transpose for the other part
	for(k=1; k<=n; k++) {
		for(j=1; j<=k-1; j++) {
			sum+=pow(Cholesky[k][j],2);
		}
        if (Cholesky[k][k]<1) return; 
		else Cholesky[k][k]=pow((Matrix[k][k]-sum),1/2);

		sum=0.;
		for(i=k+1; i<=n; i++) {
			for(j=1; j<=(k-1); j++) {
		    	sum+=Cholesky[i][j]*Cholesky[k][j];
			}
			Cholesky[i][k]=(1/Cholesky[k][k])*(Matrix[i][k]-sum);
		}
	}

	for(int i = 0; i<n; i++){
        for(int j = 0; j < n; j++)
            Cholesky[j][i] = Cholesky[i][j];
    }
       
    for (int i = 0; i < n; i++) { 
        for (int j = 0; j < n; j++) 
            cout << Cholesky[i][j] <<""; 
        cout << endl; 
    } 
}

