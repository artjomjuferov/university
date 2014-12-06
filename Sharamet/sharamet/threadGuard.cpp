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
    
    int n=10;
    
    int* A = initArr(n, 10);   
    printArr(n, A);
    
    int* B = initArr(n, 10);
    printArr(n, B);
    
    cout<<"SIMPLE SUMMATION"<<endl;
    
    int sum = 0;
    sumArrSimple(0, n, A, B,sum);
    cout<<"Simple Sum = "<<sum<<endl;
    
    int k = thread::hardware_concurrency();
    
    thread_guard TG[k];
    sum = 0;
    int b, a;
    for (int i=0; i<k; i++)
    {
        a = i*n/k;
        b = a+n/k;
        cout << a << "  " << b <<endl;
        thread t(sumArrSimple, a, b, A, B, ref(sum));
        thread_guard TG[i](t);
    }
    for (int i=0; i<k; i++)
    {
        delete TG[i];
    }
    cout<<"Thread Sum = "<<sum<<endl;
    
    return 0;
}