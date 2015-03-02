#include <stdlib.h>
#include <stdio.h>
#include <algorithm>
#include <vector>
#include <queue>
#define IN "input.in"
#define OUT "output.out"
#define NMAX 502
#define MMAX 1004

std::vector<int> graph[MMAX];
int W[MMAX][MMAX],ST[MMAX],PR[MMAX],F[MMAX][MMAX];

void read(int &n){
    int a,b;
    scanf("%d",&n);
    while(scanf("%d %d",&a,&b)!=EOF){
        graph[a].push_back(b+NMAX);
        graph[b+NMAX].push_back(a);
        W[a][b+NMAX]=1;
        W[b+NMAX][a]=0;
    }
    for(int i=0;i<MMAX;++i)
        for(int j=0;j<MMAX;++j)F[i][j]=0;
    int tmp=MMAX-1;
    for(int i=1;i<=n;++i){
        graph[0].push_back(i);
        W[0][i]=1;
        W[i][0]=0;
        W[i+NMAX][tmp]=1;
        W[tmp][i+NMAX]=0;
        graph[i+NMAX].push_back(tmp);
    }
}

void nullify(){
    for(int i=0;i<MMAX;++i){
        PR[i]=0;
        ST[i]=0;
    }
}

std::queue<int> q;

void bfs(){
    q.push(0);
    ST[0]=1;
    while(!q.empty()){
        int cur=q.front();
        q.pop();
        for(int i=0;i<graph[cur].size();++i)
            if(!ST[graph[cur][i]] && W[cur][graph[cur][i]]-F[cur][graph[cur][i]]>0){
                PR[graph[cur][i]]=cur;
                ST[graph[cur][i]]=1;
                q.push(graph[cur][i]);
            }
    } 
}

void minflow(int &ans){
    int c=100,p=MMAX-1,k;
    while(p>0){
        k=PR[p];
        c=std::min(c,W[k][p]-F[k][p]);
        p=k;
    }
    if(c==100)return;
    p=MMAX-1;
    ans+=c;
    while(p>0){
        k=PR[p];
        F[k][p]+=c;
        F[p][k]=-F[k][p];
        p=k;
    }
}

int main(){
    freopen(IN,"r",stdin);
    freopen(OUT,"w",stdout);
    int n,tmp=MMAX-1,ans=0;
    read(n);
    do{
        nullify();
        bfs();
        minflow(ans);
    }while(ST[tmp]);
    printf("%d\n",n-ans);
    return 0;
}
