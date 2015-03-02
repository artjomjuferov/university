#include <cstdlib>
#include <cstdio>
#include <algorithm>
#include <vector>
#include <deque>
#include <cmath>

#define IN "input.txt"
#define OUT "output.txt"
const int NMAX=501;
const int MMAX=1000000000;

using namespace std;

typedef int m[NMAX];
typedef vector<int> mm[NMAX];

deque<int> M1;
mm graph,weight,cost,flow,back;
m ST,D,PR,EDGE;

int init(const int&u, const int&v, const int&w, const int&c)
{
    graph[u].push_back(v);
    weight[u].push_back(w);
    cost[u].push_back(c);
    flow[u].push_back(0);
    return graph[u].size()-1;
}

void reading(const int&n)
{
    int u,v,c,w;
    while(scanf("%d %d %d %d",&u,&v,&w,&c)!=EOF)
    {
        int l=init(u,v,w,c);
        int r=init(v,u,0,-c);
        back[u].push_back(r);
        back[v].push_back(l);
    }
}

bool network(const int&u, const int&i)
{
    return (weight[u][i]-flow[u][i]>0);
}

void nullify(const int&n,const int&s)
{
    M1.clear();
    for(int i=1;i<=n;++i)
    {
        ST[i]=2;
        D[i]=MMAX;
        PR[i]=0;
        EDGE[i]=0;
    }
    D[s]=0;
    ST[s]=1;
    M1.push_front(s);
}

bool findway(const int&n,const int&s,const int&t)
{
    nullify(n,s);
    while(!M1.empty())
    {
        int cur = M1.front();
        ST[cur]=0;
        M1.pop_front();
        for(int i=0;i<graph[cur].size();++i)
            if(network(cur,i))
            {
                int v = graph[cur][i];
                if(ST[v]==2)
                {
                    M1.push_back(v);
                    ST[v]=1;
                    D[v]=D[cur]+cost[cur][i];
                    PR[v]=cur;
                    EDGE[v]=i;
                }
                else if(D[v]>D[cur]+cost[cur][i])
                {
                    if(ST[v]==0)
                    {
                        ST[v]=1;
                        M1.push_front(v);
                    }
                    D[v]=D[cur]+cost[cur][i];
                    PR[v]=cur;
                    EDGE[v]=i;
                }
            }
    }
    return (ST[t]==0);
}

void getway(const int&n, int&fl,const int&s, const int&t)
{
    int cur=t,f=MMAX;
    while(cur!=s)
    {
        int pr = PR[cur];
        f = min(f,weight[pr][EDGE[cur]]-flow[pr][EDGE[cur]]);
        cur = pr;
    }
    cur = t;
    while(cur!=s)
    {
        int pr = PR[cur];
        int edge = EDGE[cur];
        flow[pr][edge]+=f;
        flow[cur][back[pr][edge]]=-flow[pr][edge];
        cur = pr;
    }
    fl+=f;
}

void ans(const int&n,int &fl,int &co,const int&s, const int&t)
{
    while(findway(n,s,t))
        getway(n,fl,s,t);
    
    for(int i=1;i<=n;++i)
        for(int j=0;j<graph[i].size();++j)
            if(flow[i][j]>0)co+=flow[i][j]*cost[i][j];
}

int main()
{
    freopen(IN,"r",stdin);
    freopen(OUT,"w",stdout);
    int n,s,t;
    scanf("%d %d %d",&n,&s,&t);
    reading(n);
    int fl=0,co=0;
    ans(n,fl,co,s,t);
    printf("%d %d\n",fl,co);
    return 0;
}
