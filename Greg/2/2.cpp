#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <math.h>
#include <iostream>
#include <vector>
#include <fstream> 
#include <algorithm>


using namespace std;


int M[27], L[1000001], T[1000001][27];
char C[27];

void prefix_kmp(string x, int L[])
{
  for (int i = 1; i < x.length(); ++i)
  {
    L[i] = 0;
  }

  for (int i = 2; i < x.length(); i++)
  {
    int l = L[i-1];

    while ((l > 0) && (x[l+1] != x[i]))
    {
      // cout << "   ";
      // cout << l << " "<< x[l] << " " << x[i] << " " << i<<endl;
      l = L[l-1];
    }

    // cout << x[l+1] << " "<< x[i]<<endl;
    if (x[l+1] == x[i]){
      l++;
    }
    
    L[i] = l;
    // cout << l << " "<< i<<endl;
    
  }
}

int make_table(string x, char C[], int M[], int T[1000000][27])
{
  for(int i = 1; i <= 27; ++i)
  {
    M[i] = 0;
  }
  
  int k = 0;
  for (int i = 1; i < x.length(); ++i)
  {
    int ind = int(x[i]-'a')+1; 
    // cout << x[i] << endl;
    if (M[ind] == 0)
    {
      k++;
      M[ind] = k;
      C[k] = x[i];
    }
  }

  prefix_kmp(x, L);

  // for (int i = 1; i < x.length(); ++i)
  // {
  //   cout << L[i] << " ";
  // }
  // cout << endl;

  L[0] = 0;
  for (int i = 0; i < x.length()-1; ++i)
  {
    T[i][0] = 0;
    for (int j = 1; j <= k; ++j)
    {
      if (C[j] == x[i+1])
      {
        T[i][j] = i+1;
      } 
      else
      {
        int l = L[i];
        // cout << i <<endl;
        while( (l > 0) && (x[l+1] != C[j]) )
        {
            // return 0;
          // cout << "   ";
          // cout << l << " "<< x[l] << " " << C[j] << " " << j<<endl;
          l = L[l];
        }

        // cout << endl;
        if (x[l+1] == C[j])
        {
          T[i][j] = l+1;
        }
        else
        {
          T[i][j] = 0;
        }
      }
    }
  }
  return k;
}


int main()
{
  ifstream in;
  in.open("input.txt");
  // in.open("07.in");
  
  ofstream out;
  out.open("output.txt");
  
  string a, x;
  
  getline(in, x);
  x = "0"+x;//.substr(0,x.length()-1);
  
  getline(in, a);
  a = "0"+a;//.substr(0,a.length()-1);
  
  in.close();

  // prefix_kmp(a, L);
  // for (int i = 0; i < a.length(); ++i)
  // {
  //   cout<<L[i]<<" ";
  // }

  int unique_amount = make_table(x, C, M, T);

  // cout << "  ";
  // for (int i = 1; i <= unique_amount; ++i)
  // {
  //   cout << C[i] << " ";
  // }
  // cout << endl;

  // for (int i = 0; i < x.length()-1; ++i)
  // {
  //   cout << i << ":";
  //   for (int j = 1; j <= unique_amount; ++j)
  //   {
  //     cout << T[i][j] << " ";
  //   }
  //   cout << endl;
  // }

  int s = 0;
  for (int i = 1; i < a.length(); ++i)
  {
    int ind = int(a[i]-'a')+1;

    s = T[s][M[ind]];
    // cout << i <<endl;
    // if (i>=664086 && i<(664086+23)){

    //   cout << s << " " << i<<" "<< a[i] << endl;
    // }
    // printf("%d\n\n", x.length()-1);

    // cout << s ;
    if (s == (x.length()-1))
    {
      out << i-x.length()+2;
      out.close();

      return 0;
      
    }
  }

  out << "-1";
  out.close();


  return 0;
}
