#include <cmath>
#include <cstdlib>
#include <ctime>
#include <string>
#include <fstream>
#include <climits>
#include <iostream>
#pragma optimize( "", off )

using namespace std;

const double eps = 0.00001;

void JacobiNorm(int N, double** A, double* F, double* X)
{
	double* TempX = new double[N];
	double norm;

	do {
		for (int i = 0; i < N; i++) {
			TempX[i] = F[i];
			
			for (int g = 0; g < N; g++) {
				if (i != g)
					TempX[i] -= A[i][g] * X[g];
			}
			TempX[i] /= A[i][i];
		}
		
		norm = fabs(X[0] - TempX[0]);
		
		for (int h = 0; h < N; h++) {
			if (fabs(X[h] - TempX[h]) > norm)
				norm = fabs(X[h] - TempX[h]);
			X[h] = TempX[h];
		}
		
	} while (norm > eps);
	delete[] TempX;
}

void Jacobi2(int N, double** A, double* F, double* X)
{
	double* TempX = new double[N];
	double norm;
	
	do {
		for (int i = 0; i < N; i++) {
			TempX[i] = F[i];
			double sum = F[i];
			for (int g = 0; g < N; g++) {
				if (i != g)
					sum -= A[i][g] * X[g];
			}
			sum /= A[i][i];
			
			TempX[i] = sum;
		}
		norm = fabs(X[0] - TempX[0]);
		for (int h = 0; h < N; h++) {
			if (fabs(X[h] - TempX[h]) > norm)
				norm = fabs(X[h] - TempX[h]);
			X[h] = TempX[h];
		}
	} while (norm > eps);
	delete[] TempX;
}


void Jacobi4(int N, double** A, double* F, double* X)
{
	double* TempX = new double[N];
	double norm;

	do {
		for (int i = 0; i < N; i++) {
			for (int g = 0; g < N; g++) {
				if (i != g)
					TempX[i] -= A[i][g] * X[g];
			}
			TempX[i] /= A[i][i];
		}
		
		norm = fabs(X[0] - TempX[0]);
		for (int h = 0; h < N; h++) {
			if (fabs(X[h] - TempX[h]) > norm)
				norm = fabs(X[h] - TempX[h]);
			X[h] = TempX[h];
		}
	} while (norm > eps);
	delete[] TempX;
}

void Jacobi5(int N, double** A, double* F, double* X)
{
 double* TempX = new double[N];
 double norm;

 do {
  for (int i = 0; i < N-1; i+=2) {
   TempX[i] = F[i];
   TempX[i+1] = F[i+1];
   for (int g = 0; g < N; g++) {
    if (i != g)
     TempX[i] -= A[i][g] * X[g];
    if (i+1 != g)
     TempX[i+1] -= A[i+1][g] * X[g];
   }
   TempX[i] /= A[i][i];
   TempX[i+1] /= A[i+1][i+1];
  }
  norm = fabs(X[0] - TempX[0]);
  for (int h = 0; h < N; h++) {
   if (fabs(X[h] - TempX[h]) > norm)
    norm = fabs(X[h] - TempX[h]);
   X[h] = TempX[h];
  }
 } while (norm > eps);
 delete[] TempX;
}

void Jacobi6(int N, double** A, double* F, double* X, int step)
{
	double* TempX = new double[N];
	double norm;

	do {
		for (int i = 0; i < N; i++) {
			TempX[i] = F[i];
			for (int j = 0; j < N; j+=step) {
				for (int J = j; J < j+step; J++) {
					if (J != i)
					TempX[i] -= A[i][J] * X[J];				
				}
			}
			TempX[i] /= A[i][i];
		}
		
		norm = fabs(X[0] - TempX[0]);
		for (int h = 0; h < N; h++) {
			if (fabs(X[h] - TempX[h]) > norm)
				norm = fabs(X[h] - TempX[h]);
			X[h] = TempX[h];
		}
	} while (norm > eps);
	delete[] TempX;
}


int main()
{
	for (int n=100; n<=1000; n+=400){
		if (n > 500) n = 1000;
		
		double **A = new double*[n + 1];
		double *F = new double[n + 1];
		double *X = new double[n + 1];	
	
		double **Atmp = new double*[n + 1];
		double *Ftmp = new double[n + 1];
		double *Xtmp = new double[n + 1];	
	
	
		for (int i = 0; i < n; i++)
			A[i] = new double[n];
		
		
		cout <<"N is "<< n << endl;
		char* str;
		if (n == 100)
			str = "100";
		else if (n == 500)
			str = "500";
		else if (n == 1000)
			str = "1000";
		
  		ifstream in(str);
  		
		for (int i = 0; i < n; i++)
			in >> F[i];
		
		for (int i = 0; i < n; i++)
			in >> X[i];
			
		for (int i = 0; i < n; i++)
			for (int j = 0; j < n; j++) 
				in >> A[i][j];
		
		
		double avr = 0.0;
		double maxT = -1.0;
		
		for (int i=0; i<n; i++){
			Atmp[i] = A[i];
			Ftmp[i] = F[i];
			Xtmp[i] = X[i];
		}
		
		for (int i=0; i<1000; i++){
			Jacobi5(n, Atmp, Ftmp, Xtmp);
	
			double t = clock()/1000000.0;
			double dt = t-avr;
			avr = t; 
			maxT = max(dt, maxT);
		}                                                                                                                                        
		cout << maxT << endl << endl;
	}
	
	return 0;
}