#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <math.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>

using namespace std;

int **A;
int *Sum;

bool exist_negative_elemts(int n)
{
  for (int  i = 0; i < n; ++i)
  {
    for (int  j = 0; j < i; ++j)
    {
      if (*(*(A)+n*i+j) < 0)
      {
        return true;
      }
    }    
  }
  return false;
}

void generate_sum(int n)
{
  for (int i = 0; i < n; ++i)
  {
    *(Sum+i) = 0;
    for (int j = 0; j < n; ++j)
    {
      *(Sum+i) += *(*(A)+n*i+j); 
    }    
  }
}

int get_max(int n)
{
  int max = -10000;
  int max_i = 0;
  for (int i = 0; i < n; ++i)
  {
    if (max < *(Sum+i))
    {
      max_i = i;
      max = *(Sum+i);
    }
  }
  return max_i;
}

int get_min(int n)
{
  int min = 10000;
  int min_i = 0;
  for (int i = 0; i < n; ++i)
  {
    if (min > *(Sum+i))
    {
      min_i = i;
      min = *(Sum+i);
    }
  }
  return min_i;
}

void change_fields(int n, int* column1, int* column2)
{
  for (int i = 0; i < n; ++i)
  {
    int tmp = *(column1+i);
    *(column1+i) = *(column2+i);
    *(column2+i) = tmp;
  }
}

int main()
{ 
  int x = 3;

  FILE *ifp;
  ifp = fopen("input.txt","r");
  
  int n;
  fscanf(ifp,"%d ",&n);
  
  Sum = new int[n];
  // init A
  A = new int*[n];
  for (int i = 0; i < n; ++i)
  {
    *(A+i*n) = new int[n];
  }

  
  for (int i=0; i<n; i++)
  {
    for (int j=0; j<n; j++)
    {
      int tmp;
      fscanf(ifp,"%d ", &tmp);
      *(*A+n*i+j) = tmp;
    }
  }

  for (int i=0; i<n; i++)
  {
    for (int j=0; j<n; j++)
    {
      cout << *(*A+n*i+j) << " ";
    }
    cout << endl;
  }
  cout << endl;

  if (!exist_negative_elemts(n))
  {
    generate_sum(n);
    cout << get_min(n) << " " << get_max(n) << endl;
    change_fields(n, *A+get_min(n)*n, *A+get_max(n)*n);
  }

  cout << endl;
  for (int i=0; i<n; i++)
  {
    for (int j=0; j<n; j++)
    {
      cout << *(*(A)+n*i+j) << " ";
    }
    cout << endl;
  }

  return 0;
}
