#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <math.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>

using namespace std;

int best_prime(int x)
{
    int  N=10000;

    pair<int, int> primes;
    primes.first = 0;
    primes.second = 0;
    
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
          primes.first = primes.second;
          primes.second = i;
          if (primes.second >= x){
            if (abs(primes.first-x)>abs(primes.second-x))
            {
              return primes.second;
            }
            else
            {
              return primes.first;
            }
          }
        }
    }
    return  0;
}


bool is_polindrom(vector<int> arr)
{
  for (int i = 0; i < arr.size()/2; ++i)
  {
      if (arr[i] != arr[arr.size()-i-1])
      {
        return false;
      }  
  }
  
  return true;
}

vector<int> delete_4_and_5(vector<int> arr)
{
  vector<int> arrNew;
  for (int i = 0, j = 0; i < arr.size(); ++i, ++j)
  {
      if ((arr[j] != 4) && (arr[j] != 5))
      {
        arrNew.push_back(arr[i]);
      } 
  }
  return arrNew;
}

int main()
{ 
  int x = 3;

  vector<int> arr;
  
  int tmp = x;
  while (tmp > 0)
  {
    arr.push_back(tmp%10);
    tmp /= 10; 
  }

  if (is_polindrom(arr))
  {
    arr = delete_4_and_5(arr);
    for (int i = 0; i < arr.size(); ++i)
    {
      tmp += pow(10,i)*arr[i];
    }
    cout << best_prime(tmp);
  }
  else
  {
    vector<int> newArr;
    while (x > 0)
    {
      newArr.push_back(x%2);
      x = x /2;
    }
    for (int i = 0; i < newArr.size(); ++i)
    {
      cout << newArr[i];
    }
  }
  return 0;
}
