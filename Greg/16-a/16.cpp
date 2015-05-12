#include <cstdlib>
#include <cstdio>
#include <algorithm>
#include <vector>
#include <deque>
#include <iostream>
#include <cmath>
#include <fstream>
#include <utility>

using namespace std;

const int MAX = 100000000;

int Flow[501][501], Weight[501][501], Cost[501][501];
int Parent[501], D[501];
long Res[501];
bool State[501];
int n, s, t;

struct heap
{
	int data, rate;
};

heap h[501];
int l;

void MAKE()
{
	l = 0;
}

void LIFT(int c)
{
	int p;
	while (c>1)
	{
		p = c / 2;
		if (h[p].rate >= h[c].rate)
			break;
		swap(h[p], h[c]);
		c = p;
	}
}

void SIFT(int p)
{
	int c;
	while (2 * p <= l)
	{
		c = 2 * p;
		if (2 * p<l && h[c + 1].rate>h[c].rate)
			c++;
		if (h[p].rate >= h[c].rate)
			break;
		swap(h[p], h[c]);
		p = c;
	}
}

int GET()
{
	int res = h[1].data;
	h[1] = h[l];
	l--;
	SIFT(1);
	return res;
}

void PUT(int x, int rate)
{
	l++;
	h[l].rate = rate;
	h[l].data = x;
	LIFT(l);
}

bool EMPTY()
{
	return l == 0;
}

void DECREASE_KEY(int x, int rate)
{
	int i = 1;
	while (i <= l)
	{
		if (h[i].data == x)break;
		i++;
	}
	h[i].rate = rate;
	LIFT(i);
	SIFT(i);
}


bool dijkstra()
{
	for (int i = 1; i <= n; i++)
	{
		D[i] = MAX;
		Parent[i] = 0;
	}
	D[s] = 0;
	MAKE();
	for (int i = 1; i <= n; i++)
	{
		PUT(i, MAX - D[i]);
		State[i] = true;
	}

	while (!EMPTY())
	{
		int u = GET();
		State[u] = false;
		for (int v = 1; v <= n; v++)
		{
			if (Weight[u][v]>Flow[u][v] && State[v] && D[v]>D[u] + Cost[u][v] - Res[v] + Res[u])
			{
				D[v] = D[u] + Cost[u][v] - Res[v] + Res[u];
				Parent[v] = u;
				DECREASE_KEY(v, MAX - D[v]);
			}
		}
	}
	for (int i = 1; i <= n; i++)
		Res[i] += D[i] == MAX ? D[t] : D[i];
	return D[t] != MAX;
}

void fordFalkerson(int& maxFlow, int& minCost)
{
	for (int i = 1; i <= n; i++)
		Res[i] = 0;
	for (int i = 1; i <= n; i++)
	for (int j = 1; j <= n; j++)
		Flow[i][j] = 0;
	while (dijkstra())
	{
		int cf = MAX;
		int v = t;
		int cost = 0;
		while (Parent[v] != 0)
		{
			cf = min(cf, Weight[Parent[v]][v] - Flow[Parent[v]][v]);
			cost += Cost[Parent[v]][v];
			v = Parent[v];
		}
		minCost += Res[t] * cf;
		v = t;
		while (Parent[v] != 0)
		{
			Flow[Parent[v]][v] += cf;
			Flow[v][Parent[v]] = -Flow[Parent[v]][v];
			v = Parent[v];
		}
		maxFlow += cf;
	}
}

int main()
{
	freopen("input.txt","r",stdin);
	ofstream out("output.txt");
    
    scanf("%d %d %d",&n,&s,&t);
	
	int u, v, w,c;
	while(scanf("%d %d %d %d",&u,&v,&w,&c)!=EOF)
    {	
		Weight[u][v] = w; 
		Cost[u][v] = c;
		Cost[v][u] = -Cost[u][v];
	}

	int maxFlow = 0, minCost = 0;
	fordFalkerson(maxFlow, minCost);

	out << maxFlow << endl;
	out << minCost;

	return 0;
}