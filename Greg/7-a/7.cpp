#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <math.h>
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

void searchL(string& A, string& x, int ind, int& count, int s[])
{
	int index = s[ind];
	while (x[0] == A[index])
	{
		for (int i = 0; i < x.length(); i++)
		{
			if (A[index + i] != x[i])
			{
				ind--;
				if (ind < 0) return;
				index = s[ind];
				break;
			}
			if (i == x.length() - 1) count++;
		}
		ind--;
		if (ind < 0) return;
		index = s[ind];
	}
}

void searchR(string& A, string& x, int ind, int& count, int s[])
{
	int index = s[ind];
	while (x[0] == A[index])
	{
		for (int i = 0; i < x.length(); i++)
		{
			if (A[index + i] != x[i])
			{
				ind++;
				if (ind > A.length() - 1) return;
				index = s[ind];
				break;
			}
			if (i == x.length() - 1) count++;
		}
		ind++;
		if (ind > A.length() - 1) return;
		index = s[ind];
	}
}

int searchB(string& A, string& x, int s[])
{
	int first = 0;
	int last = A.length() - 1;
	int count = 0;


	while (first < last)
	{
		int mid = (first + last) / 2;
		
		int j = 0;
		while (true)
		{

			if (x[j] < A[s[mid] + j])
			{
				last = mid;
				j = 0;
				break;
			}
			else if (x[j] > A[s[mid] + j])
			{
				first = mid + 1;
				j = 0;
				break;
			}
			else j++;
			if (j == x.length())
			{
				count++;
				searchL(A, x, mid - 1, count, s);
				searchR(A, x, mid + 1, count, s);
				return count;
			}
		}
	}
	return count;
}
 
int cc[sizeAlph];
int s1[sizeN], pos[sizeN], flag[sizeN];
int size[sizeN], start[sizeN], s[sizeN];



int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");

	string x;
	in >> x;
	
  string A;
	in >> A;
	A = A + char(int('a')-1);

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
			if (flag[i]) start[i] = i;
			else start[i] = start[i - 1];
		}
		h *= 2;
	}
	
// 	for (int i=0; i<n;i++){
// 	  cout << s[i] << endl;
// 	}
	out << searchB(A, x, s);

	return 0;
}
