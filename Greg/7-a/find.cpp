#include <iostream>
#include <string>
#include <queue>
#include <cstdlib>
#include <cstdio>
using namespace std;

const int NMAX = 1000010;
const int alpha = 256;
int S[NMAX];

queue<int> q[alpha];

void count_sort(string& A, const int &n)
{
    for(int i=0;i<n;++i)q[A[i]].push(i);
    int cnt=0;
    for(int i=0;i<alpha;++i)
        while(!q[i].empty())
        {
            S[cnt]=q[i].front();
            q[i].pop();
            ++cnt;
        }
}

int pos[NMAX], start[NMAX], size[NMAX], S1[NMAX];
bool flag[NMAX];

void construct_suffix_array(string& A,const int &n)
{
    count_sort(A, n);
    for (int i = 0; i < n; i++)
    {
        pos[S[i]] = i;
        flag[i] = false;
    }
    flag[0] = true;
    start[0] = 0;
    for (int i = 1; i < n; i++)
    {
        if (A[S[i]] != A[S[i - 1]])
        {
            flag[i] = true;
            start[i] = i;
        }
        else start[i] = start[i - 1];
    }
    
    int h = 1;
    while (h < n)
    {
        for (int i = 0; i < n; i++) size[i] = 0;
        for (int i = 0; i < n; i++)
        {
            if (S[i] >= h)
            {
                int j = S[i] - h;
                int k = start[pos[j]];
                S1[k + size[k]] = j;
                if (size[k]>0)
                {
                    int j1 = S1[k + size[k] - 1];
                    if (start[i] != start[pos[j1 + h]])
                    flag[k + size[k]] = true;
                }
                size[k]++;
            }
            if (S[i] + h >= n) S1[i] = S[i];
        }
        for (int i = 0; i < n; i++)
        {
            S[i] = S1[i];
            pos[S[i]] = i;
            if (flag[i]) start[i] = i;
            else start[i] = start[i - 1];
        }
        h <<= 1;
    }
}

int check(const int&x, string &A, string &B)
{
    int i = 0;
    const int n = A.size();
    const int m = B.size();
    while(i<m && i+x<n)
    {
        if(A[x+i]>B[i])return -1;
        else if (A[x+i]<B[i])return 1;
        ++i;
    }
    if(i<m)return -1;
    return 0;
}

int binsearch_l(const int&n,string &A, string &B)
{
    int l=0,r=n-1;
    while(l+1<r)
    {
        int x = (l+r)>>1;
        if(check(S[x],A,B)<=0)r=x;
        else l=x;
    }
    if(check(S[r],A,B)==0)return r;
    else return 0;
}

int binsearch_r(const int&n, string &A, string &B)
{
    int l=0,r=n;
    while(l+1<r)
    {
        int x=(l+r)>>1;
        if(check(S[x],A,B)<0)r=x;
        else l=x;
    }
    if(check(S[l],A,B)==0)return l;
    else return 0;
}


int main()
{
    // freopen("14.in","r",stdin);
    freopen("input.txt","r",stdin);
    freopen("output.txt","w",stdout);
    string A,B;
    getline(cin, B);
    getline(cin, A);
    A = A + '$';
    const int n = A.length();
    construct_suffix_array(A, n);
    
    const int l=binsearch_l(n,A,B),r=binsearch_r(n,A,B);
    if(l==0)cout << 0;
    else cout << r-l+1;
    return 0;
}