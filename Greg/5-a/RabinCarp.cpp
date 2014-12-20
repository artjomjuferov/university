#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string.h>
#define IN "14.in"
#define OUT "output.txt"
#define NMAX 10000001
#define MOD 1000000000LL
#define ull unsigned long long int
typedef char m[NMAX];

m A,X;
ull M[NMAX];

ull get_hash(m T, int n){
    ull ans=0;
    for(int i=0;i<n;++i)
    {
        ans=(ans*26+T[i]-'a')%MOD;
        // std::cout << T[i]<< std::endl;
        // std::cout << T[i]-'a' << std::endl;
        // std::cout << ans << std::endl;
        // std::cout << "----" << std::endl;
    }
    // std::cout << MOD <<std::endl;
    // std::cout << MOD <<std::endl;
  
    return ans;
}

int main(){
    freopen(IN,"r",stdin);
    // freopen(OUT,"w",stdout);
    scanf("%s\n",X);
    scanf("%s\n",A);
    M[0]=1;
    for(int i=1;i<NMAX;++i)M[i]=(M[i-1]*26)%MOD;
    int a=strlen(X),b=strlen(A);
    ull x = get_hash(X,a);
    ull cur = get_hash(A,a);
    std::cout << "ok";
    for(int i=0;i<=b-a;++i){
        if (i>50)
            return 0;
        std::cout << i << std::endl;
         std::cout << (A[i]-'a') << std::endl;
        std::cout << cur  << std::endl;
        std::cout << x << std::endl << std::endl;   
        
        if(cur==x){
            bool f=true;
            for(int j=0;j<a;++j){
                if(X[j]!=A[j+i])f=false;
            }
            if(f){
                printf("%d\n",i+1);
                return 0;
            }
        }
        
        cur=(((cur-(A[i]-'a')*M[a-1]+26*MOD)%MOD)*26+A[i+a]-'a')%MOD;
    }
    printf("-1");
    return 0;
}
