#include <fstream>
#include <iostream>
#include <vector>
#include <stack>
#include <queue>
#include <list>
#include <algorithm>
#include <climits>

using namespace std;

vector<list<int> > graph;
vector<list<int>::iterator> last;

double c[102][102], f[102][102];
double e[102], h[102];
double w[102][102], d[102];
bool status[102], st[102];
int n;

void init(){
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
	
	graph.resize(n); 
	last.resize(n);
	for (int u = 0; u<n; u++) 
	{
		for (int v = 0; v<n; v++)
			if (c[u][v] > 0 || c[v][u] > 0)
				graph[u].push_back(v);
		last[u] = graph[u].begin();
	}
}


void lift(int u)
{
	double m = INT_MAX;
	for (list<int>::iterator it = graph[u].begin(); it != graph[u].end(); it++)
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


void discharge(int u){
    while (e[u] > 0) 
	{
		if (last[u] == graph[u].end()) 
		{
			lift(u);
			last[u] = graph[u].begin();
		}
		else if (c[u][*last[u]] > f[u][*last[u]] && h[u] == h[*last[u]] + 1)
			push(u, *last[u]);
		else
			last[u]++;
	}
}

double liftToFront()
{
	init();
	list<int> L;
	for (int u = 1; u<n - 1; u++)
		L.push_back(u);
	
	list<int>::iterator cur = L.begin();
	while (cur != L.end()) 
	{
		int u = *cur;
		double h0 = h[u];
		discharge(u);
		if (h[u]>h0) 
		{
			L.erase(cur);
			cur = L.insert(L.begin(), u);
		}
		cur++;
	}
	return e[n - 1];
}

void dfs(int u)
{
	status[u] = 1;
	for (int i = 0; i<n; i++)
		if (c[u][i]>f[u][i] && status[i] == 0)
			dfs(i);
}

int main(){
	ifstream in("input.txt");
	ofstream out("output.txt");
	
	int m, u, v, N;
	
	in >> N >> m;
	
	if (m == 0)
	{
		out << 1 << endl << 1 << endl;
		return 0;
	}
	for (int i = 1; i <= N; i++)
	{
		d[i] = 0;
		for (int j = 1; j <= N; j++)w[i][j] = 0;
	}
	for (int i = 0; i<m; i++)
	{
		in >> u >> v;
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

	out << cnt << endl;
	for (int i = 1; i<n; i++)
		if (st[i])
			out << i << endl;
}