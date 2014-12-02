#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <math.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>

using namespace std;

void prefix_func(string s, int L[])
{
  int k = 0;
  L[0] = 0;
  for (int i = 1; i < s.length(); i++)
  {
    while (k > 0 && s[k] != s[i])
    {
      k = L[k - 1];
    }
    if (s[k] == s[i])
    {
      k++;
    }
    L[i] = k;
  }
}


int L[10000001];

int main()
{
  ifstream in("input.txt");
  // ifstream in("07.in");
  ofstream out("output.txt");

  string x, A;

  getline(in, x);
  if (int(x[x.length()-1])==13)
  {
    x = x.substr(0, x.length()-1);
  }

  getline(in, A);
  if (int(A[A.length()-1])==13)
  {
    A = A.substr(0, A.length()-1);
  }

  prefix_func(x, L);
  
  // for (int i = 0; i < x.length(); i++)
  // {
  //   cout << L[i] << " ";
  // }
  // cout << endl;

  int l = 0;
  for (int i = 0; i < A.length(); i++)
  {
    while (l>0 && x[l] != A[i])
    {
      l = L[l-1];
    } 

    if (x[l] == A[i])
    {
       l++;
    } 
    else
    {
      l = 0;
    } 
    if (l == x.length())
    {
      out << i + 2 - x.length();
      return 0;
    }
  }
  out << "-1";

  return 0;
}