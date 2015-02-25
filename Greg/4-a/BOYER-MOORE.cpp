#include <cstdlib>
#include <cstdio>
#include <cstring>
#include <algorithm>
const int NMAX=1000*1010;
const int MMAX=26*10;

void prefix(char X[], int L[])
{
    L[0]=0;
    const int n = strlen(X);
    for(int i=1;i<n;++i)
    {
        int l = L[i-1];
        while(l>0 && X[i]!=X[l])l=L[l-1];
        if(X[i]==X[l])L[i]=l+1;
        else L[i]=l;
    }
}

void rights(char X[], int RIGHTS[])
{
    for(int i=0;i<MMAX;++i)RIGHTS[i]=0;
    const int n = strlen(X);
    for(int i=0;i<n;++i)RIGHTS[X[i]-'a']=i;
}

void jumps(char X[], int JUMPS[], char X1[], int L[], int L1[])
{
    const int n = strlen(X);
    for(int i=0;i<n;++i)X1[n-i-1]=X[i];
    prefix(X,L);
    prefix(X1,L1);
    for(int j=0;j<n;++j)JUMPS[j]=n-L[n-1]-1;
    for(int j=0;j<n;++j)
    {
        int i = n - L1[j] - 1;
        JUMPS[i]=std::min(JUMPS[i],j-L1[j]);
    }
}

int findans(char X[], char A[], char X1[], int L[], int RIGHTS[], int JUMPS[], int L1[])
{
    rights(X,RIGHTS);
    jumps(X,JUMPS,X1,L,L1);
    int s = 0;
    const int n = strlen(A);
    const int m = strlen(X);
    while(s<=n-m)
    {
        int j = m-1;
        while(j>=0 && X[j]==A[j+s])--j;
        if(j==-1)return s+1;
        s=s+std::max(1,std::max(j-RIGHTS[A[s+j]-'a'],JUMPS[j]));
    }
    return -1;
}

char X[NMAX],A[NMAX],X1[NMAX];
int L[NMAX],RIGHTS[MMAX],JUMPS[NMAX],L1[NMAX];
int main()
{
    freopen("input.txt","r",stdin);
    freopen("output.txt","w",stdout);
    scanf("%s\n",X);
    scanf("%s\n",A);
    printf("%d\n",findans(X,A,X1,L,RIGHTS,JUMPS,L1));
    return 0;
}
