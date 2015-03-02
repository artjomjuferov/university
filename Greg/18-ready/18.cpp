#include <iostream>
#include <vector>
#include <queue>
#include <fstream>
#include <climits>
#include <algorithm>

const int N = 500;
const int M = 1000;

using namespace std;

vector<int> G[M];
int W[M][M];
int state[M];
int parent[M];
int F[M][M];


void bfs(vector<int> G[], int state[], int parent[], int W[M][M], int F[M][M])
{
  queue<int> q;
	
	q.push(0);
	state[0] = 1;
	while (!q.empty())
	{
		int u = q.front();
		q.pop();
		for (int v = 0; v < G[u].size(); v++)
		{
			if (!state[G[u][v]] && W[u][G[u][v]] - F[u][G[u][v]]>0)
			{
				parent[G[u][v]] = u;
				state[G[u][v]] = 1;
				q.push(G[u][v]);
			}
		}
	}
}

int minFlow(int ans, int parent[], int W[M][M], int F[M][M])
{
	int minV = INT_MAX;
	int p = M - 1;
	while (p > 0)
	{
		int tmp = parent[p];
		minV = min(minV, W[tmp][p] - F[tmp][p]);
		p = tmp;
	}
	
	if (minV == INT_MAX) 
	  return ans;
	  
	p = M - 1;
	while (p > 0)
	{
		int tmp = parent[p];
		F[tmp][p] += minV;
		F[p][tmp] = -F[tmp][p];
		p = tmp;
	}
	return ans+minV;
}

int main(){

	ifstream in("input.txt");
	ofstream out("output.txt");

	int n;
	in >> n;
	
	while (!in.eof())
	{
	  int a, b;
		in >> a; 
		in >> b;
		G[a].push_back(b + N);
		G[b + N].push_back(a);
		W[a][b + N] = 1;
		W[b + N][a] = 0;
	}
	
	for (int i = 0; i < M; i++)
		for (int j = 0; j < M; j++) 
		    F[i][j] = 0;

	int tmp = M - 1;
	for (int i = 1; i <= n; i++)
	{
		G[0].push_back(i);
		W[0][i] = 1;
		W[i][0] = 0;
		W[i + N][tmp] = 1;
		W[tmp][i + N] = 0;
		G[i + N].push_back(tmp);
	}

  int ans = 0;
	do
	{
    for (int i = 0; i < M; i++)
  	{
  		parent[i] = 0;
  		state[i] = 0;
  	}
  	bfs(G, state, parent, W, F);
		ans = minFlow(ans, parent, W, F);
	} while (state[tmp]);

	out << n - ans;
	return 0;
}
