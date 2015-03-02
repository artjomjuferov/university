#include <stdlib.h>
#include <stdio.h>
#include <algorithm>
#include <vector>
#include <queue>
#include <stack>
#define IN "input.txt"
#define OUT "output.txt"
#define NMAX 501

typedef int mm[NMAX][NMAX];
typedef int m[NMAX];

std::vector<int> graph[NMAX];
std::vector<int>::iterator last[NMAX];
mm W,F;
m E,H;

void INITIALIZE_PREFLOW(const int n){
    for(int i=1;i<=n;++i){
        last[i]=graph[i].begin();
        H[i]=0;
        E[i]=0;
        for(int j=0;j<graph[i].size();++j)
            F[i][graph[i][j]]=0;
    }
    H[1]=n;
    for(int i=0;i<graph[1].size();++i){
        F[1][graph[1][i]]=W[1][graph[1][i]];
        F[graph[1][i]][1]=-W[1][graph[1][i]];
        E[graph[1][i]]=W[1][graph[1][i]];
        E[1]-=W[1][graph[1][i]];
    }
}

void LIFT(const int u){
    int height=1000;
    for(int i=0;i<graph[u].size();++i)
        if(W[u][graph[u][i]]>F[u][graph[u][i]])
            height=std::min(height,H[graph[u][i]]);
    H[u]=height+1;
}

std::queue<int> q;

void PUSH(const int u, const int v,const int n){
    int value=std::min(W[u][v]-F[u][v],E[u]);
    F[u][v]+=value;
    F[v][u]=-F[u][v];
    E[u]-=value;
    E[v]+=value;
    if(v!=n)q.push(v);
}


void DISCHARGE(const int u,const int n){
    while(E[u]>0){
        if(last[u]==graph[u].end()){
            LIFT(u);
            last[u]=graph[u].begin();
        }
        else if (W[u][*last[u]]>F[u][*last[u]] && H[u]==H[*last[u]]+1)
            PUSH(u,*last[u],n); 
        else 
            ++last[u];
    }
}

int LIFT_TO_FRONT(const int n){
    INITIALIZE_PREFLOW(n);
    for(int i=2;i<n;++i)q.push(i);
    while(!q.empty()){
        int cur=q.front();
        q.pop();
        int old_height=H[cur];
        DISCHARGE(cur,n);
    }
    return E[n];
}

int main(){
    freopen(IN,"r",stdin);
    freopen(OUT,"w",stdout);
    int n,u,v,c;
    scanf("%d",&n);
    while(scanf("%d %d %d",&u,&v,&c)!=EOF){
        graph[u].push_back(v);
        graph[v].push_back(u);
        W[u][v]=c;
    }
    int ans=LIFT_TO_FRONT(n);
    printf("%d\n",ans);
    for(int i=1;i<=n;++i){
        for(int j=1;j<=n;++j)printf("%d ",F[i][j]);
        printf("\n");
    }
    return 0;
}
