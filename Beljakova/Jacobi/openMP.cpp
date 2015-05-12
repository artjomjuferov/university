#include <iostream>
#include <iomanip>
#include <cstdlib>
#include <omp.h>
#include <cmath>

using namespace std;

double **u, **f, **uNext;
int N, IterCnt = 0;
double EPS, h;

double F(double x, double y)
{
 	return 0;
}

double G(double x, double y)
{
 	if (x == 0) return 1 - 2 * y;
 	if (x == 1) return -1 + 2 * y;
 	if (y == 0) return 1 - 2 * x;
 	if (y == 1) return -1 + 2 * x;
}

void UOutput()
{
	cout << fixed << setprecision(3);
	for (int i = 0; i < 11; i++)
	{
		for (int j = 0; j < 11; j++)
			cout << setw(7) << u[i * (N + 1) / 10][j * (N + 1) / 10];
			cout << endl;
	}
	cout << endl;
}

void Init()
{
	N = 99;
	EPS = 0.0001;
	h = 1.0 / (N + 1);
	f = new double*[N];
	for (int i = 0; i < N; i++)
	{
		f[i] = new double[N];
		for (int j = 0; j < N; j++)
			f[i][j] = F((i + 1) * h, (j + 1) * h);
	}
	u = new double*[N+2];
	uNext = new double*[N+2];
	
	for (int i = 1; i < N + 1; i++)
	{
		u[i] = new double[N + 2];
		uNext[i] = new double[N + 2];
		
		for (int j = 1; j < N + 1; j++)
			u[i][j] = 0;
		u[i][0] = G(i * h, 0);
		u[i][N + 1] = G(i * h, (N + 1) * h);
	}
	u[0] = new double[N + 2];
	uNext[0] = new double[N + 2];
	
	u[N + 1] = new double[N + 2];
	uNext[N + 1] = new double[N + 2];
	
	for (int j = 0; j < N + 2; j++)
	{
		u[0][j] = G(0, j * h);
		u[N + 1][j] = G((N + 1) * h, j * h);
	}
	UOutput();
}

void Calc()
{
    omp_lock_t dmax_lock;
    omp_init_lock (&dmax_lock);
	double dmax;
	IterCnt = 0;
	do
	{
		IterCnt++;
		dmax = 0;
        
        #pragma omp parallel for 
		for (int i = 1; i < N + 1; i++)
		    for (int j = 1; j < N + 1; j++)
			{
				uNext[i][j] = 0.25*(u[i-1][j]+u[i+1][j]+u[i][j-1]+u[i][j+1]);
				uNext[i][j] -= 0.25*h*h*f[i-1][j-1];
				double d = abs(u[i][j] - uNext[i][j]);
				
				omp_set_lock(&dmax_lock);
				if (d > dmax) dmax = d;
				omp_unset_lock(&dmax_lock);
			}
		
		//#pragma omp parallel for
		for (int i = 1; i < N + 1; i++)
			for (int j = 1; j < N + 1; j++)
			{
				u[i][j] = uNext[i][j];
			}
	}
	while (dmax > EPS);
	
	omp_destroy_lock(&dmax_lock);
}

int main(int argc, char **argv)
{
	Init();
	double tt= omp_get_wtime();
	cout << omp_get_num_threads() << endl;
	Calc();
	tt = omp_get_wtime() - tt;
	cout << "Time = " << tt << " IterCnt = " << IterCnt << endl;
	UOutput();
	cin.get();
	
	return 0;
}