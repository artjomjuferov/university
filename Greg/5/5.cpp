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

int get_index(char c)
{
  return int(c-'a')+1;
}


unsigned long int hash_func(string s, int D)
{
  unsigned long int f = 0;
  for (int i = 1; i < s.length(); ++i)
  {
    f = (f*ALPHABET_SIZE + get_index(s[i])) % D;
  }
  return f;
}


unsigned long int Degree[ALPHABET_SIZE+1];


int main()
{
  ifstream in;
  in.open("input.txt");
  
  ofstream out;
  out.open("output.txt");


  Degree[0] = 1;
  for (int i = 1; i <= ALPHABET_SIZE; ++i)
  {
    Degree[i] = ALPHABET_SIZE*Degree[i-1];
  }

  string a, x;
  getline(in, x);
  x = "0"+x;
  int D = 2*x.length()+1;

  getline(in, a);
  a = "0"+a;
  in.close();
  

  unsigned long int fx = hash_func(x, D);
  unsigned long int fa = hash_func(a.substr(0,x.length()), D);

  bool flag = 0;
  for (int i = 1; i <= a.length()-x.length()+1; ++i)
  {
    if ((fa-fx)<10000){
      cout << i << endl;
      cout << a.substr(i, x.length()-1) << endl;
      cout << fa  << endl;

      cout << x.substr(1, x.length()-1) << endl;
      cout << fx << endl << endl;   
    }
    
    if (fa == fx)
    {
      flag = 1;
      for (int j = 1; j <= x.length(); ++j)
      {
        if (x[j] != a[j+i-1])
        {
          flag = 0;
          break;
        }
        if (flag)
        {
          out << i;    
          out.close();
          return 0;
        }
      }
    }
    fa = ((fa-get_index(a[i])*Degree[x.length()-2])*ALPHABET_SIZE + get_index(a[i+x.length()-1])) % D;
  }  

  out << "-1";
  
  out.close();

  return 0;
}
