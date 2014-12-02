#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <math.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>

using namespace std;

int Primes[10000];


int generate_primes()
{
    int  N=1000;
    
    int count = 0;
    for (int  i =  2;  N > 0;  ++i)
    {
        bool  isPrime  =  true ;
        for (int  j =  2;  j < i;  ++j)
        {
            if (i  % j ==  0)
            {
                isPrime  =  false ;
                break ;
            }
        }
        if (isPrime)
        {
          Primes[count] = i;
          count++;
          N--;
        }
    }
    return  count;
}



int main()
{ 
  int x = 3;


  FILE *ifp;
  ifp = fopen("input.txt","r");
  
  int n;
  fscanf(ifp,"%d ",&n);
  vector<int> arr;
  
  for (int i =0; i<n; i++)
  {
    int tmp;
    fscanf(ifp,"%d", &tmp);
    arr.push_back(tmp);
  }

  int size_primes = generate_primes();
 

  int index = 0;
  for (int i = 0; i < arr.size(); ++i)
  {
    for (int j = 0; j < size_primes; ++j)
    {
      if (arr[i] == Primes[j])
      {
        index = i;
        break;
      }
    }
    if (index != 0)
    {
      break;
    }
  }

  for (int i = 0; i < arr.size(); ++i)
  {
    cout << arr[i] <<" ";
  }
  cout << endl;
  cout << index << endl;

  for (int i = 0; i < index; ++i)
  {
    for (int j = i+1; j <= index; ++j)
    {
      if (arr[i] < arr[j])
      {
        int tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
      }  
    }
  }

  for (int i = index+1; i < arr.size()-1; ++i)
  {
    for (int j = index+2; j < arr.size(); ++j)
    {
      if (arr[i] > arr[j])
      {
        int tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
      }  
    }
  }

  for (int i = 0; i < arr.size(); ++i)
  {
    cout << arr[i] <<" ";
  }

  return 0;
}
