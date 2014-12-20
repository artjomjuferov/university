#include <fstream>
#include <deque>
#include <vector>
#include <algorithm>
#include <math.h>
#define MAX  32767
#define LIM 4

using namespace std;

int common(string *pattern,string *s,int offset,int c_offset)
{
    int c=c_offset;

    for (int i=c_offset;i<min(pattern->size()-c_offset,s->size()-offset-c_offset);i++)
    {
        if (pattern->at(i+c_offset)==s->at(i+offset+c_offset))
        {
            c++;
        }
    }

    return c;
}

int compare(string *pattern,string *s,int offset)
{
    for (int i=0;i<min(pattern->size(),s->size()-offset);i++)
    {
        if (pattern->at(i)>s->at(i+offset))
        {
            return 1;
        }
        else if (pattern->at(i)<s->at(i+offset))
        {
            return -1;
        }
    }

    return 0;
}

int main()
{
    ifstream in("input.txt");
    ofstream out("output.txt");

    string a; // incoming row string
    string pattern;

    vector<int> m; //string as integers, a=1 $=1
    vector<int> s; //suffix array
    vector<int> s1; // temporary s.a.
    vector<int> start;
    vector<int> siz;
    vector<bool> flag; //suffix buckets
    vector<int> pos;  //
    vector< vector<int> > counter; //countsort

    counter.resize(32);

    in>>pattern;
    in>>a;

    for (int i=0;i<a.size();i++)
    {
        m.push_back((int)a[i]-96);
        //printf("%d \n",m[i]);
    }
    m.push_back(0);

    int n=m.size();


    flag.assign(n,false);
    pos.resize(n);
    start.resize(n);
    s1.resize(n);

    //counтsort
    for (int i=0;i<n;i++)
    {
        counter[m[i]].push_back(i);
    }

    for (int i=0;i<counter.size();i++)
    {
        for (int j=0;j<counter[i].size();j++)
        {
            s.push_back(counter[i][j]);
        }
    }
    //~counтsort

    for (int i=0;i<n;i++)
    {
        //printf("%d ",s[i]);
        pos[s[i]]=i;
    }

    flag[0]=true;
    start[0]=0;

    for (int i=1;i<n;i++)
    {
        if (m[s[i]] != m[s[i-1]])
        {
            flag[i]=true;
            start[i]=i;
        }
        else
        {
            start[i]=start[i-1];
        }
    }

    for (int h=1;h<n;h*=2) // <=
    {
        siz.assign(n,0);
        for (int i=0;i<n;i++)
        {

            if (s[i] >= h) //&&
            {
                int j=s[i]-h;
                int k=start[pos[j]];
                s1[k+siz[k]]=j;
                if (siz[k]>0)
                {
                    int j1=s1[k+siz[k]-1];
                    if (start[i]!=start[pos[j1+h]])
                    {
                        flag[k+siz[k]]=true;
                    }
                }
                siz[k]+=1;
            }
            if (s[i]+h>=n)
            {
                s1[i]=s[i];
            }

        }
        for (int i=0;i<n;i++)
        {
            s[i]=s1[i];
            pos[s[i]]=i;

            if (flag[i])
            {
                start[i]=i;
            }
            else
            {
                start[i]=start[i-1];
            }
        }
    }

    int bottom=1;
    int overhead=s.size()-1;

    int target=-1;
    int occurrence=0;

    int index=(bottom + overhead)/2;

    int c0=compare(&pattern,&a,s[bottom]);
    int c05=compare(&pattern,&a,s[index]);
    int c1=compare(&pattern,&a,s[overhead]);

    if (c0==0)
    {
        target=bottom;
    }
    else if (c05==0)
    {
        target=index;
    }
    else if (c1==0)
    {
        target=overhead;
    }
    else if (c1*c0==1 )                        // fail
    {

    }
    else
    {
        while (true)
        {
            if (bottom+1==overhead)
            {
                if (compare(&pattern,&a,s[bottom]))
                {
                    target=bottom;
                }
                else ша (compare(&pattern,&a,s[overhead]) )
                {
                    target=overhead;
                }

                break;
            }
            else
            {
                index=(bottom + overhead)/2;
                c05=compare(&pattern,&a,s[index]);   // need code

            }
        }
    }

    if (target>0)
    {}

    out<<occurrence;

    in.close();
    out.close();

    return 0;
}
