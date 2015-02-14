#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

vector<int> prefix_func(string s)
{
	vector<int> p(s.length());

	int k = 0;
	p[0] = 0;
	for (int i = 1; i < s.length(); i++)
	{
		while (k > 0 && s[k] != s[i])
			k = p[k - 1];
		if (s[k] == s[i])
			k++;
		p[i] = k;
	}
	return p;
}

int knuth_moris_pratt(string A, string x)
{
	vector < int > p(x.length());

	p = prefix_func(x);
	int l = 0;
	for (int i = 0; i < A.length(); i++)
	{
		while (l>0 && x[l] != A[i])
			l = p[l-1];
		if (x[l] == A[i])
			l++;
		else l = 0;
		if (l == x.length())
			return i + 2 - x.length();
	}
	return -1;
}

int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");

	string s1, s2;

	getline(in, s1);
	getline(in, s2);

	out << knuth_moris_pratt(s2, s1);
}