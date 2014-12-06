#include <fstream>
#include <deque>
#include <vector>
#include <algorithm>
#include <math.h>
#define MAX  32767
#define LIM 4

using namespace std;


int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");

    string a; // incoming row string

    vector<int> m; //string as integers, a=1 $=1
    vector<int> s; //suffix array
    vector<int> s1; // temporary s.a.
    vector<int> start;
    vector<int> siz;
    vector<bool> flag; //suffix buckets
    vector<int> pos;  //
    vector< vector<int> > counter; //countsort

    counter.resize(32);

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
    /*
           for (int l=0;l< s.size();l++)
            {
            printf ("%d ",s[l]);
            }
            printf("\n");
    */

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



    vector<int> lcp;

    lcp.resize(s.size());


    for (int i=1;i<lcp.size();i++)
    {
        //printf("!%d    %d %d    %d \n",i,1+s[i-1],1+s[i],s.size()-max(s[i],s[i-1]));

        int comm=0;
        for (int j=0;j<s.size()-max(s[i-1],s[i]);j++)
        {
            //printf("~%d\n",j);
            if (m[s[i]+j]==m[s[i-1]+j])
            {
                //printf("    %d\n",m[s[i]+j]);

                comm++;
            }
            else
            {
                lcp[i]=comm;
                break;
            }


        }

    }



    for (int i=2;i<lcp.size();i++)
    {
        out<<lcp[i];
        out<<" ";
    }





    in.close();
	out.close();

	return 0;
}
