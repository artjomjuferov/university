#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

void rights(string x, int right[])
{
	for (int i=0; i<255; i++)
		right[i] = 0;
	for (int i=0; i<x.length(); i++)
		right[x[i]] = i;
}

vector<int> prefixFunc(string s)
{
	vector<int> p(s.length());

	p[0] = 0;
	for (int i=1; i<s.length(); i++)
	{
		int k = p[i-1];
		while (k>0 && s[k+1]!=s[i])
			k = p[k-1];
		if (s[k+1] == s[i])
			k++;
		p[i] = k;
	}
	return p;
}

void jumps(string x, int jump[])
{
	vector <int> p(x.length());
	vector <int> pr(x.length());

	p = prefixFunc(x);
	pr = prefixFunc(string(x.rbegin(), x.rend()));
	for (int j = 0; j < x.length(); j++)
	{
		jump[j] = x.length()-p.back();
	}

	for (int i=0; i<x.length(); i++)
	{
		int j = x.length()-1-pr[i];
		if (jump[j] > i-pr[i])
			jump[j] = i-pr[i];
	}

}

int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");

 	string x;
	in >> x;
	
	string A;
	in >> A;

	int right[255];
	int jump[255];

	rights(x, right);
	jumps(x, jump);

	int s = 0;
	while (s <= A.length()-x.length()){
		int j = x.length()-1;
		while (j>-1 && x[j]==A[j+s])
			j--;	
		if (j == -1){
			out << s + 1;
			return 0;
		}
		s += max(1, max(j-right[A[s+j]], jump[j]));
	}

	out << -1;
	return 0;
}