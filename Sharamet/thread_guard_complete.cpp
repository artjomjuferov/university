#include <thread>
#include <iostream>

using namespace std; 

class thread_guard
{
    std::thread &t;
public:
    explicit thread_guard(std::thread &t_)
    :
    t(t_)
    {}
    ~thread_guard()
    {
        if(t.joinable())
        {
            t.join();
        }
    }
    thread_guard(thread_guard const&)=delete;
    thread_guard& operator=(thread_guard const&)=delete;
};

int* initArr(int n, int k)
{
    int* A = new int[n];
    for(int i=0; i<n; i++)
    {
        A[i] = rand() % k;    
    }
    return A;
}

void sumArrSimple(int a, int b, int* A, int* B, int& sum)
{
    for(int i=a; i<b; i++)
    {
        sum += A[i]*B[i];    
    }
}

void printArr(int n, int* A)
{
    for(int i=0; i<n; i++)
    {
        cout<<A[i]<<" ";    
    }
    cout<<endl;
}


int main()
{
    srand(time(NULL));
    
    int n=112;
    
    int* A = initArr(n, 10);   
    printArr(n, A);
    
    int* B = initArr(n, 10);
    printArr(n, B);
    
    int sum = 0;
    sumArrSimple(0, n, A, B,sum);
    cout<<"Simple Sum = "<<sum<<endl;
    
    int k = 10;//thread::hardware_concurrency();
    if (k>n){
        k = n;
    }
    thread_guard* TG[1000];
    sum = 0;
    int b, a, i;
    for (i=0; i<n/(n/k); i++)
    {
        a = i*(n/k);
        b = a+(n/k);
        //cout << "STEP = " << i << endl;
        //cout << n/k <<endl;
        //cout << a << "  " << b <<endl;
        TG[i] = new thread_guard(*new thread(sumArrSimple, a, b, A, B, ref(sum)));
        //cout << sum << endl;
    }
    if (n%k != 0){
        TG[i+1] = new thread_guard(*new thread(sumArrSimple, b, n, A, B, ref(sum)));
    }
    for (i=0; i<n/(n/k); i++)
    {
        delete TG[i];
    }
    
    if (n%k != 0){
        delete TG[i+1];
    }
    cout<<"Thread Sum = "<<sum<<endl;
    
    return 0;
}