#include <stdio.h>
#include <string>
#include <math.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <stdlib.h>


using namespace std;


#define ALPHABET_SIZE 26
#define D 1000000000LL

int get_index(char c)
{
  return int(c-'a');
}


unsigned long long int hash_func(string s)
{
  unsigned long long int f = 0;
  for (int i = 0; i < s.length(); ++i){
    f=(f*ALPHABET_SIZE+get_index(s[i]))%D;
  }
}

unsigned long long int Degree[10000001];

int main()
{
  ifstream in;
  in.open("input.txt");

  ofstream out;
  out.open("output.txt");


  Degree[0] = 1;
  for (int i = 1; i < 1000001; ++i){
    Degree[i] = (ALPHABET_SIZE*Degree[i-1])%D;
  }

  string a, x;
  in>>x;
  
  in>>a;
  in.close();
  

  unsigned long long int fx = hash_func(x);
  unsigned long long int fa = hash_func(a.substr(0,x.length()));

  bool flag = 0;
  for (int i = 0; i <= a.length()-x.length(); ++i)
  {
    if (fa == fx)
    {
      flag = 1;
      for (int j = 0; j < x.length(); ++j)
      {
        if (x[j] != a[j+i]){
          flag = 0;
          break;
        }
        if (flag){
          out << i+1;    
          out.close();
          return 0;
        }
      }
    }
    fa = (((fa-get_index(a[i])*Degree[x.length()-1]+ALPHABET_SIZE*D)%D)*ALPHABET_SIZE + get_index(a[i+x.length()])) % D;
  }  

  out << "-1";
  
  out.close();

  return 0;
}
