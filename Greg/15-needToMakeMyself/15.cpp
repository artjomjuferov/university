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
  
    
void push(int u,int v){
  int delta = min(E[u], G[u][v] - F[u][v]);
  // cout << u <<" " << v << endl;
  // cout << delta << endl;
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
	  // cout << sib << " " << u << endl;
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
	
	// show2d(n, F, "F");
	// show1d(n, E, "E");
 // show1d(n, H, "H");

	// int k =0;
  while (true)
	{
		// k++;
	  // show1d(n, E, "E");
   // show1d(n, H, "H");
    
		int u = firstE(n);
		if (u == -1)
			break;

		int v = firstToPush(u, n);
		
		// cout << u << v << endl;
		if (v == -1){
			lift(u);
		}else{
			push(u, v);
		}
		// if (k>50)
		// 	return 0;
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
