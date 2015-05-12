#include <iostream>
#include <fstream>
#include <algorithm>

using namespace std;

const int inf = 100000000;

struct heap
{
	int data, rate;
};

heap h[501];
int l;
int ans = 0, weight = 0;

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

int parent[501], f[501][501], c[501][501], w[501][501], n, s, t;
long fi[501];
bool in_queue[501];
int dist[501];

bool dijkstra()
{
	for (int i = 1; i <= n; i++)
	{
		dist[i] = inf;
		parent[i] = 0;
	}
	dist[s] = 0;
	MAKE();
	for (int i = 1; i <= n; i++)
	{
		PUT(i, inf - dist[i]);
		in_queue[i] = true;
	}

	while (!EMPTY())
	{
		int u = GET();
		in_queue[u] = false;
		for (int v = 1; v <= n; v++)
		{
			if (c[u][v]>f[u][v] && in_queue[v] && dist[v]>dist[u] + w[u][v] - fi[v] + fi[u])
			{
				dist[v] = dist[u] + w[u][v] - fi[v] + fi[u];
				parent[v] = u;
				DECREASE_KEY(v, inf - dist[v]);
			}
		}
	}
	for (int i = 1; i <= n; i++)
		fi[i] += dist[i] == inf ? dist[t] : dist[i];
	return dist[t] != inf;
}

void fordFalkerson()
{
	for (int i = 1; i <= n; i++)
		fi[i] = 0;
	for (int i = 1; i <= n; i++)
	for (int j = 1; j <= n; j++)
		f[i][j] = 0;
	while (dijkstra())
	{
		int cf = inf;
		int v = t;
		int cost = 0;
		while (parent[v] != 0)
		{
			cf = min(cf, c[parent[v]][v] - f[parent[v]][v]);
			cost += w[parent[v]][v];
			v = parent[v];
		}
		weight += fi[t] * cf;
		v = t;
		while (parent[v] != 0)
		{
			f[parent[v]][v] += cf;
			f[v][parent[v]] = -f[parent[v]][v];
			v = parent[v];
		}
		ans += cf;
	}
}

int main()
{
	ifstream in("input2.txt");
	ofstream out("output.txt");

	in >> n >> s >> t;
	int u, v;
	for (int i = 1; i <= n; i++)
		for (int j = 1; j <= n; j++)
			c[i][j] = 0;

	while (!in.eof())
	{
		in >> u >> v;
		in >> c[u][v] >> w[u][v];
		w[v][u] = -w[u][v];
	}

	fordFalkerson();

	out << ans << endl;
	out << weight;

	return 0;
}