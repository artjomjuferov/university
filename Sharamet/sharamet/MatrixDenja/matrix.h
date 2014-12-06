#include <iostream>
#include <time.h>

class matrix{
    
private: int i,j,n,m;
    
public: int data[100][100];
        int tmp[100][100];
        int **data1;
    
    matrix(int nu = 10, int mu = 10)//дефолтный конструктор и инициализатор матриц
    {
        n = nu; m = mu;
        
        int r; //зарандомим нашу функцию
        
        data1= new int*[n];
        for(i=1;i<=n;i++)
            data1[i]= new int [m];
        
        for(i=1;i<=n;i++)
        {
            for(j=1;j<=m;j++)
            {
                
                              data[i][j]=1;
            }
        }
    }
    
    ~matrix()
    {
        std::cout<<"DESTROY\n";
         //   delete data1[i];
        
       // delete data1;
    }
    
    matrix(const matrix &M)
    {
        for (i=1;i<=M.n;i++ )
            for (j=1;j<=M.m;j++)
                data[i][j]=M.tmp[i][j];
        n=M.n;
        m=M.m;
        std::cout<<"Transfer\n";
    }
    
    void out();
    void add(matrix *a,matrix *b);
    matrix mul(matrix *b);
    void vec_mul(matrix *a,matrix *b);
    int get_n(){return n;};
    int get_m(){return m;};

 };

