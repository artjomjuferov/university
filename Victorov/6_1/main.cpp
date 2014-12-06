#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <math.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>
#include <fstream>

using namespace std;

class BigInt
{
public:
  BigInt(int n);
  BigInt(string st);
  
  string str;
  vector<int> digits;

  void levelUp();
  void convertStr();

  void operator = (BigInt *a);
  BigInt* operator + (BigInt *a);
  BigInt* operator / (int b);
  BigInt* operator - (BigInt *a);
  BigInt* operator * (BigInt *a);
};

BigInt::BigInt(int n)
{
  str = "";
  digits.resize(n+1);
} 

void BigInt::convertStr()
{
  str = "";
  for (int i = digits.size()-1; i >= 0; i--)
  {    
    str += (char)(((int)'0')+digits[i]); 
  }
}

BigInt::BigInt(string st)
{
  str = st;
  for (int i = str.length()-1; i >= 0; i--)
	{    
    digits.push_back(str[i]-'0'); 
  }
} 

void BigInt::operator = (BigInt *a)
{
  digits = a->digits;
  str = a->str;
}

BigInt* BigInt::operator + (BigInt *a)
{
  int carry = 0;
  for (size_t i=0; i<max(digits.size(),a->digits.size()) || carry; ++i) {
    if (i == digits.size())
      digits.push_back (0);
    
    digits[i] += carry + (i < a->digits.size() ? a->digits[i] : 0);
    carry = digits[i] >= 10;
    if (carry)  digits[i] -= 10;
  }

  this->convertStr();
  return this;
}

BigInt* BigInt::operator - (BigInt *a)
{
  BigInt* res = this;
  int r = 0;
  
  for (int i = 0;i<res->digits.size();i++)
  {
    int tmp_a = 0;
    if (a->digits.size() > i)
    {
      tmp_a = a->digits[i];
    }

    res->digits[i] -= tmp_a + r;
    if (res->digits[i]<0)
    {
      res->digits[i] += 10;
      res->digits[i+1]--;
    }   
  }
  int pos = res->digits.size();
  while (pos && !res->digits[pos])
  {
    pos--;
  }
  res->convertStr();
  return res;
}


BigInt* BigInt::operator * (BigInt *a)
{
  BigInt* c = new BigInt(digits.size()+a->digits.size());
  
  for (size_t i=0; i<digits.size(); ++i)
    for (int j=0, carry=0; j<(int)a->digits.size() || carry; ++j) {
      long long cur = c->digits[i+j] + digits[i] * 1ll * (j < (int)a->digits.size() ? a->digits[j] : 0) + carry;
      c->digits[i+j] = int (cur % 10);
      carry = int (cur / 10);
    }
  while (c->digits.size() > 1 && c->digits.back() == 0)
    c->digits.pop_back();

  c->convertStr();
  return c;
}

BigInt* BigInt::operator / (int a)
{
  int carry = 0;
  for (int i=(int)digits.size()-1; i>=0; --i) {
    long long cur = digits[i] + carry * 1ll * 10;
    digits[i] = int (cur / a);
    carry = int (cur % a);
  }
  while (digits.size() > 1 && digits.back() == 0)
    digits.pop_back();

  this->convertStr();
  return this;
}

int main()
{ 
  
  char c = 'y';
  while(c != 'n')
  {
    cout << "Enter operation (/, +, -, *, n) : ";
    cin >> c;
    
    string a, b;
    int b1;
    cout << "a = ";
    cin >> a;
    BigInt* bigA = new BigInt(a);

    cout << "b = ";
    cin >> b1;
    BigInt* bigB;
    
    if (c =='/')
    {
      cout << bigA->str << " " << c << " " << b1 << " = ";
    }else{
      bigB = new BigInt(b);
      cout << bigA->str << " " << c << " " << bigB->str << " = ";
    }
    
    if (c == '+')
    {
      BigInt *res = *bigA + bigB; 
      cout << res->str << endl;
    }
    else if (c == '-')
    {
      BigInt * res = *bigA - bigB;
      cout << res->str << endl;
    } 
    else if (c == '/')
    {
      BigInt * res = *bigA / b1;
      cout << res->str << endl;
    }
    else if (c == '*')
    {
      BigInt * res = (*bigA) * bigB;
      cout << res->str << endl;
    }
  }

  system("PAUSE");

  return 0;
}
