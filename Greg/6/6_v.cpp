#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <math.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>

using namespace std;

void print_arr(vector< pair<string,int> > S)
{
  for (int i = 1; i < S.size(); i++)
  {
    cout << S[i].second << " - "<< S[i].first << endl;
  }
  cout << endl;
}

void c_sort(vector< pair<string,int> > &S)
{
  vector< pair <int, vector<int> > > count(int('z')-int('a')+2);
  
  for (int i=1;i<S.size();i++)
  {
    int ind = S[i].first[0]-int('a')+1; 
    count[ind].first++;
    count[ind].second.push_back(i);
  }
  
  vector< pair<string,int> > S1(S.size());
  
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

vector< pair<string,int> > pre_const_suffix(string x)
{
  vector< pair<string,int> > S(x.size());
  for (int i = 1; i < x.size(); ++i)
  {
    S[i].first = x.substr(i, x.size());
    S[i].second = i;
  }
  return S;
}


vector< pair<string,int> >const_suffix(string x)
{
  vector< pair<string,int> > S = pre_const_suffix(x);
  
  print_arr(S);
  c_sort(S);
  print_arr(S);
    
  int n = S.size(); 
  
  vector <int> pos(n);
  vector <int> flag(n);
  vector <int> size(n);
  vector <int> s1(n);
  vector <int> start(n);

  for (int i = 1; i < n; ++i)
  {
    pos[S[i].second] = i;
    flag[i] = 0;
  } 

  flag[1] = 1;
  start[1] = 1;
  for (int i = 2; i < n; ++i)
  {
    if (x[S[i].second] != x[S[i-1].second])
    {
      flag[i] = 1;
      start[i] = i;
    }
    else
    {
      start[i] = start[i-1];
    }
  }

  int h = 1;
  while(h<n)
  {
    for (int i = 1; i < n; ++i)
    {
      size[i] = 0;
    }

    for (int i = 1; i < n; ++i)
    {
      if(S[i].second>h)
      {
        int j = S[i].second-h;
        int k = start[pos[j]]; 
        s1[k+start[k]] = j;
        if (size[k]>0)
        {
          int j1 = s1[k+size[k]-1];
          if (start[i] != start[pos[j1+h]])
          {
            flag[k+size[h]] = 1;
          }
        }
        size[k]++;
      }
      if ((S[i].second+h)>n)
      {
        s1[i] = S[i].second;
        cout << s1[i] << "  "<<i<<endl;
      }
    }

    for (int i = 1; i < n; ++i)
    {
      cout << s1[i] << " ";
    }
    cout << endl;

    for (int i = 1; i < n; ++i)
    {
      S[i].second = s1[i];
      pos[S[i].second] = i;
      if (flag[i] == 1)
      {
        start[i] = i;
      }
      else
      {
        start[i] = start[i-1];
      }
    }
    h *= 2;
  }
  print_arr(S);
  return S;
}

int main()
{
  ifstream in("input.txt");
  ofstream out("output.txt");

  string x;
  getline(in, x);
  x = "0"+x+"$";

  cout << x << endl << endl;
  vector < pair<string,int> > S = const_suffix(x);

  return 0;
}