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


int check(int ind, string& x, string& A)
{
    int i = 0;
    int n = A.size();
    int m = x.size();
    while(i<m && i+ind<n)
    {
        if(A[ind+i]>x[i])
        	return -1;
        else if (A[ind+i]<x[i])
        	return 1;
        ++i;
    }
    if(i<m)
    	return -1;
    else
    	return 0;
}

int searchL(int n, string& x, string& A, int s[])
{
    int l=0;
    int r=n-1;
    while(l+1<r)
    {
      int ind = (l+r)>>1;
      if(check(s[ind],x,A)<=0)
      	r=ind;
      else
      	l=ind;
    }
    if(check(s[r],x,A)==0)
    	return r;
    else
    	return 0;
}

int searchR(int n, string x, string A, int s[])
{
    int l=0;
    int r=n;
    while(l+1<r)
    {
        int ind=(l+r)>>1;
        if(check(s[ind],x,A)<0)
        	r=ind;
        else 
        	l=ind;
    }
    if(check(s[l],x,A)==0)
    	return l;
    else 
    	return 0;
}


int cc[sizeAlph];
int s1[sizeN], pos[sizeN], flag[sizeN];
int size[sizeN], start[sizeN], s[sizeN];


int main()
{
	ifstream in("input.txt");
	// ifstream in("14.in");
	ofstream out("output.txt");

  string A;
	in >> A;
	A = A + char(int('a')-1);

	int n = A.length();

	int K;
	in >> K;
	
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

	return 0;
}
