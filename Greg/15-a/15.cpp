#include <fstream>
#include <iostream>
#include <vector>
#include <stack>
#include <queue>
#include <list>
#include <algorithm>
#include <climits>

using namespace std;

vector<int> graph[501];
vector<int>::iterator last[501];
queue<int> q;

int c[501][501], f[501][501];
int e[501], h[501];
int N;

void init(){
    for(int i = 1; i <= N; ++i){
        last[i] = graph[i].begin();
        h[i] = 0;
        e[i] = 0;
        for(int j = 0; j < graph[i].size(); ++j)
            f[i][graph[i][j]] = 0;
    }
    
    int source = 1;
    h[1] = N;
    for(int u = 0;u < graph[source].size(); ++u)
    {
        int v = graph[source][u];
        f[source][v] = c[source][v];
        f[v][source] = -c[source][v];
        e[v] = c[source][v];
        e[source] -= c[source][v];
    }
}

void push(const int u, const int v){
    int delta = min(c[u][v] - f[u][v], e[u]);
    f[u][v] += delta;
    f[v][u] =- f[u][v];
    e[u] -= delta;
    e[v] += delta;
    if(v != N)
    	q.push(v);
}


void lift(const int u){
    int height = INT_MAX;
    for(int v = 0; v < graph[u].size(); ++v){
        int tmp = graph[u][v];
        if(c[u][tmp] > f[u][tmp])
            height = min(height, h[tmp]);
    }
    h[u] = height + 1;
}



void discharge(const int u){
    while(e[u] > 0)
    {
        if(last[u] == graph[u].end())
        {
            lift(u);
            last[u] = graph[u].begin();
        }
        else if (c[u][*last[u]] > f[u][*last[u]] && h[u] == h[*last[u]] + 1)
            push(u, *last[u]); 
        else 
            ++last[u];
    }
}


void lift_to_front(){
    init();
    
    for(int i = 2; i < N; ++i)
    	q.push(i);
    
    while(!q.empty())
    {
        int cur = q.front();
        q.pop();
        int old_height = h[cur];
        discharge(cur);
    }
}

int main(){
	ifstream in("input.txt");
	ofstream out("output.txt");

    in >> N;
	
	while (!in.eof())
	{
		int x, y, z;
		in >> x >> y >> z;
		graph[x].push_back(y);
        graph[y].push_back(x);
        c[x][y] = z;
	}
	
    lift_to_front();
    
    out << e[N] << endl;
    
    for (int i = 1; i <= N; i++)
	{
		for (int j = 1; j <= N; j++)
			out << f[i][j] << ' ';
		out << endl;
	}

    return 0;
}
