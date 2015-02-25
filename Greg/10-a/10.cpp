#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <cmath>
#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>

using namespace std;

#define sizeAlph 50
#define sizeN 10000000

void sort(string& x, int count[], int s[])
{
	for (int i = 0; i < sizeAlph; i++)
	  count[i] = 0;
	for (int i = 0; i < x.length(); i++)
	  count[x[i]-int('a')+1]++;
	for (int i = 1; i < sizeAlph; i++)
	  count[i] += count[i - 1];
	
	for (int i = 0; i < x.length(); i++){
		count[x[i]-int('a')+1]--;
		s[count[x[i]-int('a')+1]] = i;
	}
}

int cc[sizeAlph];
int s1[sizeN], pos[sizeN], flag[sizeN], lcp[sizeN];
int size[sizeN], start[sizeN], s[sizeN];

int main()
{
	ifstream in("input.txt");
	// ifstream in("14.in");
	ofstream out("output.txt");

  string A;
	in >> A;
	A = A+char(int('a')-1);
	int n = A.length();

	sort(A, cc, s);
	
	for (int i = 0; i < n; i++)
	{
		pos[s[i]] = i;
		flag[i] = 0;
	}
	flag[0] = 1;
	start[0] = 0;
	
	
	for (int i = 1; i < n; i++)
	{
		if (A[s[i]] != A[s[i - 1]])
		{
			flag[i] = 1;
			start[i] = i;
		}
		else start[i] = start[i - 1];
	}
	int h = 1;
	while (h < n)
	{
		for (int i = 0; i < n; i++) size[i] = 0;
		for (int i = 0; i < n; i++)
		{
			if (s[i] >= h)
			{
				int j = s[i] - h;
				int k = start[pos[j]];
				s1[k + size[k]] = j;
				if (size[k]>0)
				{
					int j1 = s1[k + size[k] - 1];
					if (start[i] != start[pos[j1 + h]])
						flag[k + size[k]] = 1;
				}
				size[k]++;
			}
			if (s[i] + h >= n) s1[i] = s[i];
		}
		for (int i = 0; i < n; i++)
		{
			s[i] = s1[i];
			pos[s[i]] = i;
			if (flag[i])
				start[i] = i;
			else 
				start[i] = start[i - 1];
		}
		h *= 2;
	}

	int p = 0;
	for (int i=0; i<n-1; i++)
	{
		int j = s[pos[i]-1];
		while (A[i+p] == A[j+p])
			p++;
		lcp[pos[i]] = p;
		if (p>0)
			p--;
	}
	
	int num, max = -999999;

	for (int i=2; i<n; i++)
	{
		if (lcp[i] == 0)
			continue;
		int count1 = s[i];
		int count2 = s[i-1];
		while ((A[count1]==A[count2]) && (count1<n) && (count2<n))
		{
			count1++;
			count2++;
		}
		// cout << max <<endl;
		// cout << s[i]<<endl;
		if (abs(s[i]-count1)> max)
		{
			p = s[i];
			num = abs(s[i]-count1);
			max = num;
		}
	}
	
	// cout << p << endl << num;
	for (int i=p; i<p+num; i++) 
		out<<A[i];

	return 0;
}
