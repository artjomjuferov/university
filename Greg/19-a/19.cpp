#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <math.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <queue>
#include <climits>

using namespace std;

int const MAX = 10001, N = 201;

int A[N][N], Min[N], Mark[N], W[N];
int U[N], Result[N], V[N], P[N];

void init(int n, int Min[], int Mark[]){
	for (int i = 1; i<=n; i++){
		Min[i] = MAX;
		Mark[i] = 0;		
	}
}

int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");

	int n;
	in >> n;
	
	for (int i = 1; i <= n; i++)
		for (int j = 1; j <= n; j++) 
			in >> A[i][j];


	for (int i = 1; i <= n; i++) 
	{
		P[0] = i;
		int tmpJ = 0;
		
		init(n, Min, Mark);
		do
		{
			Mark[tmpJ] = 1;
			int tmpI = P[tmpJ], delta = MAX, j1;
			for (int j = 1; j <= n; j++)
			{
				if (Mark[j] == 0)
				{
					int tmp = A[tmpI][j] - U[tmpI] - V[j];
					if (tmp < Min[j])
					{
						Min[j] = tmp;
						W[j] = tmpJ;
					}
					if (Min[j] < delta)
					{
						delta = Min[j];
						j1 = j;
					}
				}
			}
			for (int j = 0; j <= n; j++)
			{
				if (Mark[j] == 1)
				{
					U[P[j]] += delta;
					V[j] -= delta;
				}
				else 
					Min[j] -= delta;
			}
			tmpJ = j1;
		} while (P[tmpJ] != 0);
		do 
		{
			int j1 = W[tmpJ];
			P[tmpJ] = P[j1];
			tmpJ = j1;
		} while (tmpJ);
	}


	for (int i = 1; i <= n; i++)
		Result[P[i]] = i;

	out << (-1)*V[0] << endl;

	for (int i = 1; i <= n; i++)
		out << Result[i] << " ";

	return 0;

}