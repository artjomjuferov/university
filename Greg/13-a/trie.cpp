#include <iostream>
#include <deque>
#include <vector>
#include <cstdio>
#include <cstdlib>
#include <algorithm>

#define MAX  32767

using namespace std;

class associative
{
private:
    vector <associative *> descendants;
    bool status;
    int c;
    int current;
public:
    associative()
    {
        descendants.assign(32,(associative *)0);
        current=0;
        status=false;
    }
    bool look(string s,int position)
    {
        int tmp=(int)s[position]-96;
        if (position+1==s.size())
        {
            if (status)
            {
                if(current==tmp)return true;
                else return false;
            }
            else return false;
        }
        else
        {
            int next=(int)s[position+1]-96;
            if (descendants[next]!=(associative *)0)return (descendants[next])->look(s,position+1);
            else return false;
        }
    }
    
    void add (string s,int position)
    {
        int tmp=(int)s[position]-96;
        current=tmp;
        if (position+1==s.size())status=true;
        else
        {
            int next=(int)s[position+1]-96;
            if (descendants[next]==(associative *)0)descendants[next]= new associative();
            descendants[next]->add(s,position+1);
        }
    }

    void vipe(string s,int position)
    {
        int tmp=(int)s[position]-96;
        if (position+1==s.size())
        {
            if (status && current==tmp)status=false;
        }
        else
        {
            int next=(int)s[position+1] -96;
            if (descendants[next]!=(associative *)0)(descendants[next])->vipe(s,position+1);
        }
    }
};


int main()
{
	freopen("input.txt","r",stdin);
	freopen("output.txt","w",stdout);
    associative tree;
    string s;
    string pattern="+-? E";
    pattern[3]=96;
    while (s[0]!='E')
    {
        cin >> s;
	    if (s[0]==pattern[0]) 
        {
            s[0]=pattern[3];
            tree.add(s,0);
	    }
	    else if (s[0]==pattern[1])
	    {
            s[0]=pattern[3];
            tree.vipe(s,0);
	    }
	    else if (s[0]==pattern[2]) 
	    {
            s[0]=pattern[3];
            if (tree.look(s,0))cout << "y";
            else cout << "n";
    	}
	    else break;
    }
	return 0;
}
