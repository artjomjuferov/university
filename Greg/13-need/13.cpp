#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <math.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <deque>


#define MAX  32767

using namespace std;

struct Tree
{
  vector <Tree*> childs;
  bool status;
  int c;
  int current;
}

Tree* create()
{
  Tree* tmp = new Tree;
  tmp.childs.assign(32,(Tree *)0);
  tmp.current=0;
  tmp.status=false;
  return tmp;
}

bool look(string s,int position)
{
    int tmp=(int)s[position] -96;
    if (position+1==s.size())
    {
        if (status)
        {
            if (current==tmp)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }
    else
    {
        int next=(int)s[position+1] -96;

        if (childs[next]!=(Tree *)0)
        {
            return (childs[next])->look(s,position+1);
        }
        else
        {
            return false;
        }

    }

}

void add (string s,int position)
{

    int tmp=(int)s[position] -96;

    current=tmp;

    if (position+1==s.size())
    {
        status=true;
    }
    else
    {
        int next=(int)s[position+1] -96;

        if (childs[next]==(Tree *)0)
        {
            childs[next]= create();
        }
        childs[next]->add(s,position+1);

    }

}

void vipe(string s,int position)
{
    int tmp=(int)s[position] -96;

    if (position+1==s.size())
    {
        if (status && current==tmp)
        {
            status=false;
        }
    }
    else
    {
        int next=(int)s[position+1] -96;

        if (childs[next]!=(Tree *)0)
        {
            (childs[next])->vipe(s,position+1);
        }
    }

}


int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");

  string s;


  while (!in.eof())
  {
    in >> s;
    
    if (s[0]=="E")
      break;
      
  	if (s[0]=="+")
    {
      s[0]=96;
      Tree.add(s,0);
  	}
  	else if (s[0]=="-")
  	{
      s[0]=96;
      Tree.vipe(s,0);
  	}
  	else if (s[0]=="?")
  	{
      s[0]=96;
      if (Tree.look(s,0))
      {
          out << "y";
      }
      else
      {
          out << "n";
      }
  	}
  }


  in.close();
	out.close();

	return 0;
}
