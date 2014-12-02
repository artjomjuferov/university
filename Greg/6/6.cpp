#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <math.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>

using namespace std;

void print_arr(vector<int> S)
{
  for (int i = 1; i < S.size(); i++)
  {
    cout << S[i]<<" ";
  }
  cout << endl;
}

void c_sort(string x, vector< int> &S)
{
  vector< pair <int, vector<int> > > count(int('z')-int('a')+3);

  for (int i=1;i<S.size();i++)
  {
    int ind = x[S[i]]-int('a')+2; 
    count[ind].first++;
    count[ind].second.push_back(i);
  }
  vector<int> S1(S.size());
  
  int outputindex=1;
  for (int j=1;j<count.size();j++)
  {
    while (count[j].first>0)
    {
      count[j].first--;
      int ind = count[j].second[count[j].second.size()-1];
      count[j].second.pop_back();
      S1[outputindex++] = S[ind]; 
    }
  }

  for (int i=1;i<S.size();i++)
  {
    S[i] = S1[i];
  }
}

vector<int> pre_const_suffix(string x)
{
  vector<int> S(x.size());
  for (int i = 1; i < x.size(); ++i)
  {
    S[i] = i;
  }
  return S;
}


vector<int> const_suffix(string x)
{
  vector <int> S = pre_const_suffix(x);
  int n = S.size(); 
  c_sort(x, S);
  
  vector <int> pos(n);
  vector <int> flag(n);
  vector <int> size(n);
  vector <int> s1(n);
  vector <int> start(n);

  for (int i = 1; i < n; ++i)
  {
    pos[S[i]] = i;
    flag[i] = 0;
  } 

  flag[1] = 1;
  start[1] = 1;
  for (int i = 2; i < n; ++i)
  {
    if (x[S[i]] != x[S[i-1]])
    {
      flag[i] = 1;
      start[i] = i;
    }
    else
    {
      start[i] = start[i-1];
    }
  }

  print_arr(S);
  print_arr(start);


  int h = 1;
  cout << n <<" +++ "<<endl;
  while(h<(n-1))
  {
    for (int i = 1; i < n; ++i)
    {
      size[i] = 0;
    }

    cout << endl << h << " : "<<endl;

    for (int i = 1; i < n; ++i)
    {

      if(S[i]>h)
      {
        int j = S[i]-h;
        int k = start[pos[j]]; 
        s1[k+size[k]] = j;
        cout << k<<" "<<j<<" "<< size[k]<<endl;
        print_arr(s1);
        if (size[k]>0)
        {
          int j1 = s1[k+size[k]];
          cout << S[i]<< " "<< pos[j1+h]<<" " <<endl;
          if (start[i] != start[pos[j1+h]])
          {
            flag[k+size[h]] = 1;
          }
        }
        size[k]++;
      }

      if ((S[i]+h)>=n)
      {
        s1[i] = S[i];
      }
    }


    for (int i = 1; i < n; ++i)
    {
      S[i] = s1[i];
      pos[S[i]] = i;
      if (flag[i] == 1)
      {
        start[i] = i;
      }
      else
      {
        start[i] = start[i-1];
      }
    }

    cout << "s'    ";print_arr(s1);
    cout << "flag  ";print_arr(flag);
    cout << "start "; print_arr(start);

    h *= 2;
  }
  return S;
}

int main()
{
  ifstream in("input.txt");
  ofstream out("output.txt");

  string x;
  getline(in, x);
  x = "0"+x+char(int('a')-1);
  vector <int> S = const_suffix(x);

	 print_arr(S);
  for (int i = 1; i < S.size()-1; ++i)
  {
    cout << x.substr(S[i], S.size()-S[i]-1) << endl;
    out << S[i] << " ";
  }


  return 0;
}
