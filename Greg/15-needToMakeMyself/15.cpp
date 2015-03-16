#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <cmath>
#include <iostream>
#include <vector>
#include <algorithm>
#include <climits>
#include <fstream>

using namespace std;


int G[502][502], F[502][502]; 
int C[502], H[502], E[502];
vector<int> Sibs[502];

int Head[502], Current[502], Next[502];
vector<int> L;

void push(int u,int v){
  int delta = min(E[u], G[u][v] - F[u][v]);
  F[u][v] += delta;
	F[v][u] = -F[u][v];
	E[u] -= delta;
	E[v] += delta;
}

void lift(int u)
{
	int max = INT_MAX;
	for (int v=0; v<Sibs[u].size(); v++){
	  int sib = Sibs[u][v];
  	if (G[u][sib] > F[u][sib])
  		max = min(max, H[sib]);
	}	
	H[u] = max + 1;
}

void show2d(int n, int A[502][502], string name){
  cout << name << endl;
  for (int i=1; i<=n; i++){
    for (int j=1; j<=n; j++)
      cout << A[i][j] << " ";
    cout << endl;
  }
  cout << endl;
}

void show1d(int n, int A[502], string name){
  cout << name << endl;
  for (int i=1; i<=n; i++)
    cout << A[i] << " ";
  cout << endl << endl; 
}


void showSibs(int n){
  cout << "Sibs" << endl;
  for (int i=0; i<n; i++){
    cout << i << " : ";
    for (int j=0; j<Sibs[i].size(); j++)
      cout << Sibs[i][j] << " ";
    cout << endl;
  }
  cout << endl;
}


int firstE(int n){
	for (int u=2; u<n; u++)
		if (E[u] > 0)
			return u;
	return -1;
}

int firstToPush(int u, int n){
	for (int v=1; v<=n; v++)
			if (((G[u][v]-F[u][v]) > 0) && (H[u]==H[v]+1))
				return v;
	return -1;
}

int cutAndToBegin(vector<int> &L, int u){
	int tmp = L[u];
	for(int i=u; i>0;--i){
		L[i] = L[i-1];
	}
	L[0] = tmp;
}

void showVector(vector<int> &A, string name){
  cout << name << endl;
  for (int i=0; i<A.size(); i++)
    cout << A[i] << " ";
  cout << endl << endl; 
}

int main()
{
  ifstream in("input.txt");
  ofstream out("output.txt");

  int n;
	in >> n;
  
	while (!in.eof())
	{
		int u, v, c;
		in >> u >> v >> c;
		G[u][v] =c;
		Sibs[u].push_back(v);
		Sibs[v].push_back(u);
	}

  // showSibs(n);
  
	H[1] = n;
	for (int u = 1; u <= n; u++)
	{
		F[1][u] = G[1][u];
	  F[u][1] = -G[1][u];
		E[u] = F[1][u];
	}
	
	for (int u = 2; u<n; u++)
		L.push_back(u);
		
	for (int u = 1; u<=n; u++){
		Current[u] = 0;
	}
	
	int now = 0;
 	int i = 0;
  while(i<L.size()){
		
		int u = L[i];
		int nowH = H[u];
		
		while (E[u] > 0)
		{
			int ind = Current[u];
			int v = Sibs[u][ind];
			
			cout << "--------------------------"<<endl;
			cout << "i="<<i << endl;
			cout << "u="<<u << endl;
			cout << "v="<<v << endl;
			cout << "Current="<<Current[u] << endl;
			cout << "size="<<Sibs[u].size() << endl;
			show1d(n, H, "H");
			show1d(n, E, "E");
							
			showVector(L, "L");
			
			if (v == 0)
			{
				lift(u);
				Current[u] = 0;
			} else if (G[u][v] > F[u][v] && H[u] == H[v] + 1){
				push(u, v);
			} else{
				Current[u]++;
			}
		}
		if (H[u] > nowH){
			cutAndToBegin(L, u);
			i=1;
		}else{
			i++;
		}
	}
	
	out << E[n] << endl;

	for (int u = 1; u <= n; u++)
	{
		for (int v = 1; v <= n; v++)
			out << F[u][v] << ' ';
		out << endl;
	}

  return 0;
}
