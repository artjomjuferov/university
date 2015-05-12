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
int State[M];
int Parent[M];
int F[M][M];


void bfs(vector<int> G[], int State[], int Parent[], int W[M][M], int F[M][M])
{
  queue<int> que;
	
	que.push(0);
	State[0] = 1;
	while (!que.empty())
	{
		int u = que.front();
		que.pop();
		for (int v = 0; v < G[u].size(); v++)
		{
			if (!State[G[u][v]] && W[u][G[u][v]] - F[u][G[u][v]]>0)
			{
				Parent[G[u][v]] = u;
				State[G[u][v]] = 1;
				que.push(G[u][v]);
			}
		}
	}
}

int minFlow(int ans, int Parent[], int W[M][M], int F[M][M])
{
	int minV = INT_MAX;
	int p = M - 1;
	while (p > 0)
	{
		int tmp = Parent[p];
		minV = min(minV, W[tmp][p] - F[tmp][p]);
		p = tmp;
	}
	
	if (minV == INT_MAX) 
	  return ans;
	  
	p = M - 1;
	while (p > 0)
	{
		int tmp = Parent[p];
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
  		Parent[i] = 0;
  		State[i] = 0;
  	}
  	bfs(G, State, Parent, W, F);
		ans = minFlow(ans, Parent, W, F);
	} while (State[tmp]);

	out << n - ans;
	return 0;
}
