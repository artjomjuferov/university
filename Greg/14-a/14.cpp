#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <math.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>

using namespace std;

const int NMAX = 1000;
const int MMAX = 1004;

using namespace std;

vector<int> graph[MMAX];
int W[MMAX][MMAX];
int mark[MMAX];
int pred[MMAX];
int F[MMAX][MMAX];

void init()
{
	for (int i = 0; i < MMAX; i++)
	{
		pred[i] = 0;
		mark[i] = 0;
	}
}

queue<int> q;

void bfs()
{
	q.push(0);
	mark[0] = 1;
	while (!q.empty())
	{
		int u = q.front();
		q.pop();
		for (int v = 0; v < graph[u].size(); v++)
		{
			if (!mark[graph[u][v]] && W[u][graph[u][v]] - F[u][graph[u][v]]>0)
			{
				pred[graph[u][v]] = u;
				mark[graph[u][v]] = 1;
				q.push(graph[u][v]);
			}
		}
	}
}

void minflow(int &ans)
{
	int c = 100, p = MMAX - 1, k;
	while (p > 0)
	{
		k = pred[p];
		c = min(c, W[k][p] - F[k][p]);
		p = k;
	}
	if (c == 100) return;
	p = MMAX - 1;
	ans += c;
	while (p > 0)
	{
		k = pred[p];
		F[k][p] += c;
		F[p][k] = -F[k][p];
		p = k;
	}
}

int main(){

	ifstream in("input.txt");
	ofstream out("output.txt");

	int n, tmp = MMAX - 1, ans = 0;

	int a, b;
	in >> n;
	while (!in.eof())
	{
		in >> a >> b;
		graph[a].push_back(b + NMAX);
		graph[b + NMAX].push_back(a);
		W[a][b + NMAX] = 1;
		W[b + NMAX][a] = 0;
	}
	for (int i = 0; i < MMAX; i++)
		for (int j = 0; j < MMAX; j++)
		  F[i][j] = 0;

	for (int i = 1; i <= n; i++)
	{
		graph[0].push_back(i);
		W[0][i] = 1;
		W[i][0] = 0;
		W[i + NMAX][tmp] = 1;
		W[tmp][i + NMAX] = 0;
		graph[i + NMAX].push_back(tmp);
	}
	
	do
	{
		init();
		bfs();
		minflow(ans);
	} while (mark[tmp]);

	out << n - ans;
	return 0;
}
