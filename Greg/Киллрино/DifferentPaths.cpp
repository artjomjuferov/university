#include <iostream>
#include <fstream>
#include <queue>

using namespace std;


const int NUM = 1000;
int n;
int max_path = 0;

int path[NUM];
int path1[NUM];
int pred[NUM];
bool marked[NUM];
int c[NUM][NUM];
int cf[NUM][NUM];
int f[NUM][NUM];

int minim(int l)
{
	int m = 1000000;
	for (int i = 1; i <= l; i++)
	if (cf[path[i]][path[i + 1]] < m) m = cf[path[i]][path[i + 1]];
	return m;
}

void init()
{
	for (int i = 0; i < NUM; i++)
	{
		marked[i] = false;
		pred[i] = 0;
		path[i] = 0;
		path1[i] = 0;
	}
}

void bfs(int v)
{
	queue<int> Q;

	Q.push(v);
	marked[v] = true;
	while (!Q.empty())
	{
		v = Q.front();
		Q.pop();
		for (int i = 1; i <= n; i++)
		{
			if (!marked[i] && (cf[v][i] != 0))
			{
				Q.push(i);
				marked[i] = true;
				pred[i] = v;
			}
		}
	}
}


void ff()
{	
	bfs(1);
	while (marked[n])
	{
		int v = n;
		int kol = 0;
		while (v != 1)
		{
			kol++;
			path1[kol] = v;
			v = pred[v];
		}
		path[1] = 1;
		for (int i = 2; i <= kol + 1; i++) path[i] = path1[kol - i + 2];
		int m = minim(kol);
		max_path += m;
		for (int i = 1; i <= kol; i++)
		{
			f[path[i]][path[i + 1]] += m;
			f[path[i + 1]][path[i]] = -f[path[i]][path[i + 1]];
			cf[path[i]][path[i + 1]] = c[path[i]][path[i + 1]] - f[path[i]][path[i + 1]];
			cf[path[i + 1]][path[i]] += f[path[i + 1]][path[i]];
		}
		init();
		bfs(1);
	}
}

int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");

	int u, v;

	in >> n;
	while (!in.eof())
	{
		in >> u >> v;
		c[u][v] = 1;
		cf[u][v] = 1;
		cf[v][u] = -1;
		f[u][v] = 0;
		f[v][u] = 0;
	}

	ff();

	out << max_path;

	return 0;
}