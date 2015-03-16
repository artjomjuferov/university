#include <fstream>
#include <iostream>
#include <vector>
#include <list>
#include <algorithm>
#include <climits>

using namespace std;

typedef vector < vector < int > > vvInt;
typedef vector < int > vInt;
typedef list < int >::iterator lIter;

int N, size;
vvInt c;
vvInt f;
vInt e;
vInt h;
vector < lIter > current;
list < int > L;
vector < list < int > > neighbor;

void showVector(vector<int> &A, string name){
  cout << name << endl;
  for (int i=0; i<A.size(); i++)
    cout << A[i] << " ";
  cout << endl << endl; 
}

void init()
{
	int source = 0;

	h.assign(size, 0);
	e.assign(size, 0);
	f.assign(size, vector < int >(size, 0));
	h[0] = N;
	for (int u = 1; u < N; u++)
	{
		if (c[source][u] > 0)
		{
			e[u] = c[source][u];
			f[source][u] = c[source][u];
			f[u][source] = -c[source][u];
		}
	}

}

void push(int u, int v)
{
	int delta = min(e[u], c[u][v] - f[u][v]);
	f[u][v] += delta;
	f[v][u] = -f[u][v];
	e[u] -= delta;
	e[v] += delta;
}

void lift(int u)
{
	int height = INT_MAX;
	lIter i = neighbor[u].begin();
	for (lIter it = i; it != neighbor[u].end(); it++)
	if (c[u][*it] > f[u][*it])
		height = min(height, h[*it]);
	h[u] = height + 1;
}

void discharge(int u)
{
	while (e[u] > 0)
	{
		if (current[u] == neighbor[u].end())
		{
			lift(u);
			current[u] = neighbor[u].begin();
			continue;
		}
		int v = *current[u];
		if (c[u][v] > f[u][v] && h[u] == h[v] + 1)
			push(u, v);
		else
			current[u]++;
	}
}

void lift_to_front()
{
	init();
	for (int u = 1; u < N - 1; u++) L.push_back(u);

	current.resize(size);
	neighbor.resize(size);

	for (int u = 1; u < N - 1; u++)
	{
		for (int v = 0; v < N; v++)
		{
			if (c[u][v]>0 || c[v][u]>0) neighbor[u].push_back(v);
		}
		lIter it = neighbor[u].begin();
		current[u] = it;
	}

	lIter cur = L.begin();
	while (cur != L.end())
	{
		int u = *cur;
		int h_o = h[u];
		discharge(u);
		if (h[u] > h_o)
		{
			L.erase(cur);
			cur = L.insert(L.begin(), u);
		}
		cur++;
	}
}

int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");

	in >> N;
	size = N;
	c.assign(size, vector <int>(size, 0));

	while (!in.eof())
	{
		int x, y, z;
		in >> x >> y >> z;
		c[x - 1][y - 1] = z;
	}

	lift_to_front();

	out << e[N - 1] << endl;

	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < N; j++)
			out << f[i][j] << ' ';
		out << endl;
	}


	return 0;
}