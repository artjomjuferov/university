#include <vector>
#include <list>
#include <algorithm>
#include <iostream>
#include <stdio.h>

using namespace std;

const int NMAX = 102;
int n;
double c[NMAX][NMAX], f[NMAX][NMAX], h[NMAX], e[NMAX];
vector<list<int> > head;
vector<list<int>::iterator> current;

void lift(int u)
{
	double m = 1000000000;
	for (list<int>::iterator it = head[u].begin(); it != head[u].end(); it++)
		if (c[u][*it] > f[u][*it])
		{
			m = min(m, h[*it]);
			h[u] = m + 1;
		}	
}

void push(int u, int v)
{
	double value = min(c[u][v] - f[u][v], e[u]);
	f[u][v] += value;
	f[v][u] -= value;
	e[u] -= value;
	e[v] += value;
}

void INIT(){
	for (int i = 0; i<n; i++)
		for (int j = 0; j<n; j++)
			f[i][j] = 0;
	for (int i = 0; i<n; i++)
	{
		e[i] = 0;
		h[i] = 0;
	}
	h[0] = n;
	for (int u = 0; u<n; u++)
		if (c[0][u] > 0) 
		{
			e[u] = c[0][u];
			f[0][u] = c[0][u];
			f[u][0] = -f[0][u];
		}
}
double liftToFront()
{
	INIT();
	list<int> L;
	for (int u = 1; u<n - 1; u++) L.push_back(u);
	
	head.resize(n); 
	current.resize(n);
	for (int u = 0; u<n; u++) 
	{
		for (int v = 0; v<n; v++)
			if (c[u][v] > 0 || c[v][u] > 0)head[u].push_back(v);
		current[u] = head[u].begin();
	}
	list<int>::iterator cur = L.begin();
	while (cur != L.end()) 
	{
		int u = *cur;
		double h0 = h[u];
		while (e[u] > 0) 
		{
			if (current[u] == head[u].end()) 
			{
				lift(u);
				current[u] = head[u].begin();
				continue;
			}
			int v = *current[u];
			if (c[u][v] > f[u][v] && h[u] == h[v] + 1)push(u, v);
			else current[u]++;
		}
		if (h[u]>h0) 
		{
			L.erase(cur);
			cur = L.insert(L.begin(), u);
		}
		cur++;
	}
	return e[n - 1];
}

bool status[NMAX], st[NMAX];

void dfs(int u)
{
	status[u] = 1;
	for (int i = 0; i<n; i++)
		if (c[u][i]>f[u][i] && status[i] == 0)dfs(i);
}

int main(){
	freopen("input.txt", "r", stdin);
	freopen("output.txt", "w", stdout);
	int w[NMAX][NMAX], d[NMAX];
	int m, u, v, N;
	scanf("%d%d", &N, &m);
	if (m == 0)
	{
		cout << 1 << endl << 1 << endl;
		return 0;
	}
	for (int i = 1; i <= N; i++)
	{
		d[i] = 0;
		for (int j = 1; j <= N; j++)w[i][j] = 0;
	}
	for (int i = 0; i<m; i++)
	{
		scanf("%d%d", &u, &v);
		d[u]++;
		d[v]++;
		w[u][v] = 1;
		w[v][u] = 1;
	}
	n = N + 2;
	double eps = 2 / (double)(N*N - N);
	double xmin = 0;
	double xmax = m;
	int cnt = 0;
	while (xmax - xmin >= eps)
	{
		double x = (xmin + xmax) / 2.0;
		for (int i = 0; i<n; i++)
			for (int j = 0; j<n; j++)
				f[i][j] = 0;

		for (int i = 1; i <= N; i++)
			for (int j = 1; j <= N; j++)
			{
				if (w[i][j])c[i][j] = 1;
				c[0][i] = m;
				c[i][n - 1] = m - d[i] + 2 * x;
			}
		liftToFront();
		for (int i = 0; i<n; i++)status[i] = 0;
		dfs(0);
		cnt = 0;
		for (int i = 1; i<n - 1; i++)
			if (status[i] == 1)cnt++;

		if (cnt == 0)xmax = x;
		else
		{
			for (int i = 0; i<n; i++)st[i] = status[i];
			xmin = x;
		}
	}
	cnt = 0;
	for (int i = 1; i<n; i++)
		if (st[i])cnt++;

	cout << cnt << endl;
	for (int i = 1; i<n; i++)
		if (st[i])cout << i << endl;
}