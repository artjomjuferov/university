#include "matrix.h"
#include <time.h>
#include "connector.h"
#include <iostream>

using namespace std;

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

matrix matrix::mul(matrix *b)
{
   cuda_mul(n,this->data,data,tmp);

    return *this;
}
