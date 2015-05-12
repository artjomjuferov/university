#include <cmath>
#include <iostream>
#include <cstring>
#include <cstdlib>

#pragma hdrstop
#include "mpi.h"

double *f, *u, *f1, *u1;
int Rank, Size;
int N, K;
double eps, h;
MPI_Comm BAND_COMM;

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
	//ShowLine();
	for (int i = 0; i < N + 2; i++)
	{
		for (int j = 0; j < N + 2; j++){}
			//Show(u[i * (N + 2) + j], 5);
		//ShowLine();
	}
}
void U1Output()
{
	//ShowLine();
	for (int i = 0; i < K + 2; i++)
	{
		for (int j = 0; j < N + 2; j++){}
			//Show(u1[i * (N + 2) + j], 5);
		//ShowLine();
	}
}

void ParallelInit()
{
	if (Rank == 0)
	{
		N = 9;
		eps = 0.01;
		h = 1.0 / (N + 1);
		f = new double[N * N];
		for (int i = 0; i < N; i++)
			for (int j = 0; j < N; j++)
				f[i * N + j] = F((i+1) * h, (j+1) * h);
		u = new double[(N + 2) * (N + 2)];
		for (int i = 1; i < N + 1; i++)
		{
			for (int j = 1; j < N + 1; j++)
				u[i * (N + 2) + j] = 0;
			u[i * (N + 2)] = G(i * h, 0);
			u[i * (N + 2) + N + 1] = G(i * h, (N + 1) * h);
		}
		for (int j = 0; j < N + 2; j++)
		{
			u[j] = G(0, j * h);
			u[(N + 1) * (N + 2) + j] = G((N + 1) * h, j * h);
		}
	}
	MPI_Bcast(&N, 1, MPI_INT, 0, MPI_COMM_WORLD);
	MPI_Bcast(&eps, 1, MPI_DOUBLE, 0, MPI_COMM_WORLD);
	K = N / Size;
	f1 = new double[K * N];
	u1 = new double[(K + 2) * (N + 2)];
	int *Cnts = new int[Size], *Displs = new int[Size];
	Cnts[0] = (K + 2) * (N + 2);
	Displs[0] = 0;
	for (int i = 1; i < Size; i++)
	{
		Cnts[i] = Cnts[0];
		Displs[i] = Displs[i - 1] + K * (N + 2);
	}
	MPI_Scatter(f, N * K, MPI_DOUBLE, f1, K * N, MPI_DOUBLE, 0, MPI_COMM_WORLD);
	MPI_Scatterv(u, Cnts, Displs, MPI_DOUBLE, u1, (K + 2) * (N + 2), MPI_DOUBLE, 0, MPI_COMM_WORLD);
	int Dims = Size, Periods = 0;
	MPI_Cart_create(MPI_COMM_WORLD, 1, &Dims, &Periods, 0, &BAND_COMM);
}

void ParallelCalc()
{
	double max, allmax;
	while (true)
	{
		max = 0;
		for (int i = 1; i < K + 1; i++)
			for (int j = 1; j < N + 1; j++)
			{
				double u0 = u1[i * (N + 2) + j];
				u1[i * (N + 2) + j] = 0.25 * (u1[(i - 1) * (N + 2) + j]
				+ u1[(i + 1) * (N + 2) + j] + u1[i * (N + 2) + j - 1]
				+ u1[i * (N + 2) + j + 1] - h * h * f1[(i - 1) * N + j - 1]);
				double d = abs(u1[i * (N + 2) + j] - u0);
				if (d > max)
					max = d;
			}
		MPI_Allreduce(&max, &allmax, 1, MPI_DOUBLE, MPI_MAX,
		MPI_COMM_WORLD);
		if (allmax <= eps)
			break;
		int RSrc, RDest;
		MPI_Status s;
		MPI_Cart_shift(BAND_COMM, 0, 1, &RSrc, &RDest);
		MPI_Sendrecv(&u1[K * (N + 2)], N + 2, MPI_DOUBLE, RDest, 0, u1, N + 2, MPI_DOUBLE, RSrc, 0, BAND_COMM, &s);
		MPI_Cart_shift(BAND_COMM, 0, -1, &RSrc, &RDest);
		MPI_Sendrecv(&u1[N + 2], N + 2, MPI_DOUBLE, RDest, 0, &u1[(K + 1) * (N + 2)], N + 2, MPI_DOUBLE, RSrc, 0, BAND_COMM,&s);
	}
}
void ParallelOutputRes()
{
	MPI_Gather(&u1[N + 2], K * (N + 2), MPI_DOUBLE, &u[N + 2],
	K * (N + 2), MPI_DOUBLE, 0, MPI_COMM_WORLD);
	if (Rank == 0)
	UOutput();
}

void Solve()
{
	int flag;
	MPI_Initialized(&flag);
	if (flag == 0)
	return;
	MPI_Comm_size(MPI_COMM_WORLD, &Size);
	MPI_Comm_rank(MPI_COMM_WORLD, &Rank);
	
	ParallelInit();
	ParallelCalc();
	ParallelOutputRes();
}
