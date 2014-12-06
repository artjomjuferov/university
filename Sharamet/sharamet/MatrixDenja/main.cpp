#include <iostream>
#include <time.h>
#include "matrix.h"

using namespace std;

/*class matrix{
    
    private: int i,j,n,m;
    
    public: int data[1000][1000];
    
    matrix(int nu = 10, int mu = 10){ n = nu; m = mu;}//дефолтная инициализация n=10,m=10;
    //По идее тоже конструктор
    
    void init();
    void out();
    void add(matrix *a,matrix *b);
    void mul(matrix *a,matrix *b);
    void vec_mul(matrix *a,matrix *b);
    int get_n(){return n;};
    int get_m(){return m;};
    
};

void matrix::init()
{
    int r; //зарандомим нашу функцию
    
    for(i=1;i<=n;i++)
    {
        for(j=1;j<=m;j++)
        {
            
            r = rand()%100+1;//от 1 до 100
            data[i][j]=r;
        }
    }
   
}

void matrix::out()
{
    for (i=1;i<=n;i++)
    {
        for(j=1;j<=m;j++)
        {
            cout<<data[i][j]<<' ';
        }
        cout<<'\n';
    }
}

void matrix::add(matrix *a,matrix *b)
{
    for (i=1;i<=n;i++)
        for (j=1;j<=m;j++)
        {
            data[i][j]=a->data[i][j]+b->data[i][j];
        }
 }
void matrix::vec_mul(matrix *a,matrix *b)
{
    for(i=1;i<=n;i++)
    {
        data[i][1] = 0; //очищаем элемент массива
        for (j = 1; j <= n; j++)
        {
            data[i][1] +=a->data[i][j]*b->data[j][1];//производим умножение матрицы на вектор
        }
    }
}

void matrix::mul(matrix *a,matrix *b)
{
    for(i=1; i <= n; i++)
    {
        for(j=1; j <=m; j++)
        {
            data[i][j]=0;
            for(int k=0; k <=n; k++) data[i][j]+=a->data[i][k]*b->data[k][j];
        }
    }
    
}
*/

int main()
{   int n,m,r;
    matrix *matA;//наши 3 матрицы
    matrix *matB;
    matrix *matC;
    
    /*cout<<"Использовать стандартные значения n и m? \n";
    cin>>n;
    if (n==1)
    {
        matA= new matrix; //создаем динамические матрицы А,B
        matB= new matrix;
        matC= new matrix;
    }
    else
    {
        cout<<"Введите размерности матрицы A: \n";
        cin>>n;cin>>m;
        matA= new matrix(n,m); //создаем динамические матрицы А,B
        
        cout<<"Введите размерности матрицы B: \n";
        cin>>n;cin>>m;
        matB= new matrix(n,m);
        
        matC= new matrix(matA->get_n(),matB->get_m());// создаем матрицу С, размером n матрицы A и m матрциы B
    }
    
    cout<<"Чего изволите? \n";
    cout<<"1 для сложения \n2 для умножения матриц \n3 для умножения матрицы на вектор\n";
    cin>>r;
    switch (r)
    {
        case 1:
        {
            matC->add(matA,matB);//сложение матриц
            matC->out();
            cout<<'\n';
            break;
        }
        case 2:
        {
            *matC=matA->mul(matB);//умножение матриц
            matC->out();
            cout<<'\n';
            break;
        }
        case 3:
        {
            matC->vec_mul(matA,matB);//умножение матрицы на вектор B
            matC->out();
            cout<<'\n';
            break;
        
        }
        default:break;
    }
     */
    
    
    matA= new matrix; //создаем динамические матрицы А,B
    matB= new matrix;
    matC= new matrix;
    
    *matC=matA->mul(matB);//умножение матриц
    matC->out();
    cout<<'\n';
    delete matA;
    delete matB;
    delete matC;
    
        
    return 0;
}

