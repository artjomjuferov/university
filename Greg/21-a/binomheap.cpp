#include <cstdio>
#include <cstdlib>
#include <list>
#include <iostream>

using namespace std;
const int inf = 1000 * 1000 * 1000;

struct node
{
	node* par, *c, *s;
	int degree, data;
};

void LINK(node* y, node* z){
	y->par = z;
	y->s = z->c;
	z->c = y;
	z->degree++;
}

void PASS(node* u)
{
	while (u != NULL)
	{
		printf("%d ", u->data);
		if (u->c != NULL)PASS(u->c);
		u = u->s;
	}
}

node* UNION(node* H1, node* H2)
{
	if (H1 == NULL)return H2;
	if (H2 == NULL)return H1;
	node* q;
	bool first = true;
	node* _H = new node;
	_H->s = NULL;
	_H->par = NULL;
	_H->c = NULL;
	while (H1 != NULL && H2 != NULL)
	{
		if (H1->degree>H2->degree)
		{
			q = H1->s;
			H1->s = _H->s;
			_H->s = H1;
			H1 = q;
		}
		else
		{
			q = H2->s;
			H2->s = _H->s;
			_H->s = H2;
			H2 = q;
		}
	}
	while (H1 != NULL)
	{
		q = H1->s;
		H1->s = _H->s;
		_H->s = H1;
		H1 = q;
	}
	while (H2 != NULL)
	{
		q = H2->s;
		H2->s = _H->s;
		_H->s = H2;
		H2 = q;
	}
	node* H = new node;
	node* qq;
	H->s = NULL;
	q = _H->s;
	while (q != NULL)
	{
		qq = q->s;
		q->s = H->s;
		H->s = q;
		q = qq;
	}
	H = H->s;
	node* prev = NULL;
	node* p = H;
	node* next = p->s;
	while (next != NULL)
	{
		if (p->degree != next->degree ||(next->s != NULL && next->s->degree == p->degree))
		{
			prev = p;
			p = next;
		}
		else if (p->data <= next->data)
		{
			p->s = next->s;
			LINK(next, p);
		}
		else 
		{
			if (prev == NULL)H = next;
			else prev->s = next;
			LINK(p, next);
			p = next;
		}
		next = p->s;
	}
	return H;
}

void ADD(int x, node*& H)
{
	node* v = new node;
	v->data = x;
	v->par = NULL;
	v->c = NULL;
	v->s = NULL;
	v->degree = 0;
	H = UNION(H, v);
}

bool SEARCH(node* H, int k, node*& adr)
{
	while (H != NULL)
	{
		if (H->data == k)
		{
			adr = H;
			return true;
		}
		if (H->data<k && H->c != NULL)
		{
			if (SEARCH(H->c, k, adr))
				return true;
		}
		H = H->s;
	}
	return false;
}

void DECREASE_KEY(node*& adr, int k)
{
	adr->data = k;
	node* y = adr;
	node* z = y->par;
	while (z != NULL && y->data<z->data)
	{
		swap(y->data, z->data);
		swap(y->degree, z->degree);
		y = z;
		z = y->par;
	}
}

node* MINIMUM(node* H)
{
	int min = inf;
	node* adr = NULL;
	while (H != NULL)
	{
		if (min>H->data)
		{
			min = H->data;
			adr = H;
		}
		H = H->s;
	}
	return adr;
}

void EXTRACT_MIN(node*& H, int& x)
{
	if (H == NULL)return;
	node* adr = MINIMUM(H);
	x = adr->data;
	if (adr == H)H = H->s;
	else 
	{
		node* q = H;
		while (q->s != NULL)
		{
			if (q->s->data == x)
			{
				q->s = q->s->s;
				break;
			}
			q = q->s;
		}
	}
	node* h = NULL;
	node* next;
	node* v = adr->c;
	while (v != NULL)
	{
		next = v->s;
		v->s = h;
		v->par = NULL;
		h = v;
		v = next;
	}
	H = UNION(H, h);
}

void DELETE(node*& H, node*& adr, int x)
{
	DECREASE_KEY(adr, -inf);
	EXTRACT_MIN(H, x);
}

int main()
{
	freopen("input.txt", "r", stdin);
	freopen("output.txt", "w", stdout);
	char c;
	int x, y;
	node* H, *adr;
	H = new node;
	H = NULL;
	bool res;
	while (!feof(stdin))
	{
		scanf("%c", &c);
		switch (c)
		{
			case 'E':
				return 0;
			case '+':
				scanf("%d\n", &x);
				if (!SEARCH(H, x, adr))ADD(x, H);
				break;
			case '?':
				scanf("%d\n", &x);
				res = SEARCH(H, x, adr);
				printf("%c ", res == true ? 'y' : 'n');
				break;
			case '-':
				scanf("%d\n", &x);
				if (SEARCH(H, x, adr))DELETE(H, adr, x);
				break;
			case 'd':
				scanf("%d %d\n", &x, &y);
				if (SEARCH(H, x, adr))DECREASE_KEY(adr, y);
				break;
			case 'm':
				if (H == NULL)printf("- ");
				else
				{
					EXTRACT_MIN(H, x);
					printf("%d ", x);
				}
				break;
		}
	}
	return 0;
}