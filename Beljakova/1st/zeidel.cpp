#include <cmath>
#include <cstdlib>
#include <ctime>
#include <string>
#include <fstream>
#include <climits>
#include <iostream>
#pragma optimize( "", off )

using namespace std;

const double eps = 0.001;

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

void Jacobi1(int N, double** A, double* F, double* X)
{
	double* TempX = new double[N];
	double norm;
	
	do {
		for (int g = 0; g < N; g++) {
			for (int i = 0; i < N; i++) {
				TempX[i] = F[i];
				if (i != g)
					TempX[i] -= A[i][g] * X[g];
				TempX[i] /= A[i][i];
			}
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

void Jacobi4and5(int N, double** A, double* F, double* X)
{
	double* TempX = new double[N];
	double norm;
	
	
	for (int i = 0; i < N; i++) {
		TempX[i] = F[i];
	}
	
	do {
		for (int i = 0; i < N; i+=2) {
			for (int g = 0; g < N; g++) {
				if (i != g)
					TempX[i] -= A[i][g] * X[g];
				if (i+1 != g)
					TempX[i+1] -= A[i+1][g] * X[g];
			}
			
		}
		for (int i = 0; i < N; i+=2) {
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


double checkMethod(int N, double** A, double* F, double* X){
	double maxDelta = -1.0;
	for (int i=0; i<N; i++){
		double sum = 0.0;
		for (int j=0; j<N; j++){
			sum += A[i][j]*X[j];
			cout << A[i][j] << " " << X[j] << endl;
		}	
		cout << sum << endl;
		maxDelta = max(maxDelta, abs(sum-F[i]));  	
	}
	return maxDelta;
}


int main()
{
	for (int n=100; n<=1000; n+=400){
		if (n > 500) n = 1000;
		double **A = new double*[n + 1];
		double *F = new double[n + 1];
		double *X = new double[n + 1];	
	
		for (int i = 0; i < n; i++)
			A[i] = new double[n];
		
		
		cout << n << endl;
		char* str;
		if (n == 100)
			str = "100";
		else if (n == 500)
			str = "500";
		else if (n == 1000)
			str = "1000";
			
  		ifstream in(str);
		for (int i = 0; i < n; i++)
		{
			in >> F[i];
			in >> X[i];
			for (int j = 0; j < n; j++) 
				in >> A[i][j];
		}
		JacobiNorm(n, A, F, X);
		cout << checkMethod(n, A, F, X) << endl;	
		return;
		double avr = 0.0;
		double maxT = -1.0;
		for (int i=0; i<1000; i++){
			JacobiNorm(n, A, F, X);
			
			double t = clock()/1000000.0;
			double dt = t-avr;
			avr = t; 
			maxT = max(dt, maxT);
		}                                                                                                                                        
		cout << maxT << endl << endl;
	}
	
	return 0;
}