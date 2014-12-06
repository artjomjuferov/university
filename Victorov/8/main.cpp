#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <math.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>
#include <fstream>
#include <bitset>


using namespace std;

class Integer
{
public:
  virtual void show()=0;
  virtual Integer* operator+ (Integer *a)=0;
  int x;
};


class Decimal : public Integer
{
public:
  Decimal(int);
  void show();
  Integer* operator + (Integer *a);
};

Decimal::Decimal(int _x)
{
  x = _x;
} 

Integer* Decimal::operator + (Integer *a)
{
  x += a->x;
  return this;
}

void Decimal::show()
{
  cout << x <<"(decimal)"<<endl; 
}

class Binary : public Integer
{
public:
  Binary(int);
  void show();
  Integer* operator + (Integer *a);
};

Binary::Binary(int _x)
{
  x = _x;
} 

Integer* Binary::operator + (Integer *a)
{
  x = x xor a->x;
  return this;
}

void Binary::show()
{
  int dec = x, sum = 0, rem, i=1;
  while(dec>0)
  {
    rem=dec%2;
    sum=sum + (i*rem);
    dec=dec/2;
    i=i*10;
  } 
  cout << sum << endl;
  x = sum;
  cout << sum <<"(binary)"<<endl; 
}


int main()
{ 
  
  char c = 'y';
  while(c != 'n')
  {
    cout << "Enter type (d, b, n) : ";
    cin >> c;
    
    if (c == 'n')
    {
      break;
    }
    
    int _x1, _x2;
    Integer *x2, *x1;
    
    cout << "x1 = ";
    cin >> _x1;

    cout << "x2 = ";
    cin >> _x2;

    if (c == 'd')
    {
      x1 = new Decimal(_x1);
      x2 = new Decimal(_x2);
    }
    else if (c == 'b')
    {
      x1 = new Binary(_x1);
      x2 = new Binary(_x2);
    }
    Integer* x3 = *x1 + x2;
    x3->show();
  }

  system("PAUSE");

  return 0;
}
