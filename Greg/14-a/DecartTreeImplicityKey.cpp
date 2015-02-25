#include <cstdlib>
#include <cstdio>
#include <iostream>
#include <string>
#include <cstring>
#include <algorithm>
using namespace std;

struct node
{
	string data;
	node *l, *r;
	int size,y;
	node(string k) : data(k)
	{ 
		l = r = NULL; 
		size = 1; 
		y = 1 + rand() % 1000;
	}
	int SIZE()
	{
		if (this == NULL)return 0;
		return this->size;
	}
};

node* MERGE(node *l, node *r, node *u)
{
	if (l == NULL)return r;
	else if (r == NULL)return l;
	if (l->y >= r->y)
	{
		l->r = MERGE(l->r, r,u);
		u = l;
	}
	else
	{
		r->l = MERGE(l, r->l,u);
		u = r;
	}
	u->size = 1 + u->l->SIZE() + u->r->SIZE();
	return u;
}

void SPLIT(node *h, int ind, node *&l, node *&r)
{
	if (h == NULL)
	{
		l = NULL;
		r = NULL;
		return;
	}
	if (ind <= h->l->SIZE())
	{
		SPLIT(h->l, ind, l, r);
		h->l = r;
		r = h;
	}
	else
	{
		SPLIT(h->r, ind - h->l->SIZE() - 1, l, r);
		h->r = l;
		l = h;
	}
	h->size = 1 + h->l->SIZE() + h->r->SIZE();
}

void ADD(string s, node *&u)
{
	node *v = new node(s);
	u = MERGE(u, v,u);
}

void INS(string s, int k, node *&u)
{
	node *l, *r;
	l = r = NULL;
	SPLIT(u, k, l, r);
	node *v = new node(s);
	l = MERGE(l, v,u);
	u = MERGE(l, r,u);
}

void DEL(int a, int b, node *&u)
{
	int len = b - a + 1;
	node *l, *r,*v;
	l = r = v = NULL;
	SPLIT(u, a, l, r);
	SPLIT(r, len, v, r);
	u = MERGE(l, r,u);
}

string KEY(node *h, int p)
{
	if (h == NULL || p>h->SIZE())return "OUT OF RANGE";
	int l = h->l->SIZE();
	if (p == l)return h->data;
	else if (p < l)return KEY(h->l, p);
	else return KEY(h->r, p - l - 1);
}

int main()
{
	freopen("input.txt", "r", stdin);
	freopen("output.txt", "w", stdout);
	string s;
	int a,k;
	node *u = NULL;
	while (true)
	{
		cin >> s;
		if (s=="END")return 0;
		else if (s == "ADD")
		{
			cin >> s;
			ADD(s,u);
		}
		else if (s == "DEL")
		{
			cin >> a >> k;
			DEL(a - 1, k - 1,u);
		}
		else if (s=="INS")
		{
			cin >> k >> s;
			if (k > u->SIZE())ADD(s,u);
			else INS(s, k - 1,u);
		}
		else if (s == "KEY")
		{
			cin >> k;
			cout << KEY(u, k - 1) << endl;
		}
	}
	return 0;
}