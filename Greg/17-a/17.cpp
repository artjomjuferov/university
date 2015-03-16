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


const int maxN = 1001;

int P[maxN], TmpP[maxN],Parent[maxN],Mark[maxN];
int G[maxN][maxN], W[maxN][maxN], F[maxN][maxN];


void increase(int addW, int n){
  for (int i = 1; i <= n; i++){
    int u = P[i];
    int u1 = P[i+1];
  	F[u][u1] += addW;
  	F[u1][u] = -F[u][u1];
  	W[u][u1] = G[u][u1] - F[u][u1];
  	W[u1][u] += F[u1][u];
  }
}

void clear()
{
	for (int i = 0; i < maxN; i++)
	{
		Mark[i] = 0;
		Parent[i] = 0;
		P[i] = 0;
		TmpP[i] = 0;
	}
}

int getMin(int n)
{
	int min = INT_MAX;
	for (int i = 1; i <= n; i++){
	  int u = P[i];
	  int v = P[i + 1];
	  if (W[u][v] < min)
	    min = W[u][v];
	}
	return min;
}

int Queue[1000000];

void bfs(int v, int n)
{
	int front = 0;
	int back = 0;
	
	Queue[front] = v;
	front++;
	Mark[v] = 1;
	while (back < front)
	{
		v = Queue[back];
		back++;
		for (int u = 1; u <= n; u++)
			if ((Mark[u]==0) && (W[v][u] != 0))
			{
				Mark[u] = 1;
				Parent[u] = v;
			  Queue[front] = u;
			  front++;
			}
	}
}


int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");

  int n;
	in >> n;
	
	while (!in.eof())
	{
	  int u, v;
		in >> u >> v;
		G[u][v] = 1;
		W[u][v] = 1;
		W[v][u] = 0;
		F[u][v] = 0;
		F[v][u] = 0;
	}
  
  int maxP = 0;
  
  clear();
	bfs(1, n);
	
	while(Mark[n] == 1)
	{
		int v = n;
		int amount = 0;
		while (v != 1)
		{
			amount++;
			TmpP[amount] = v;
			v = Parent[v];
		}
		P[1] = 1;
		for (int i = 2; i <= amount + 1; i++)
		  P[i] = TmpP[amount-i+2];
		  
		int minW = getMin(amount);
		maxP += minW;
		increase(minW, amount);
		
	  clear();
		bfs(1, n);
	}
  
	out << maxP;

	return 0;
}
