#include <cstdio>
#include <cstdlib>
#include <list>
#include <iostream>

using namespace std;

const int inf = 10000000;

struct node
{
	node* par, *c, *s;
	int degree, data;
};

void link(node* y, node* z){
	y->par = z;
	y->s = z->c;
	z->c = y;
	z->degree++;
}

void pass(node* u)
{
	while (u != NULL)
	{
		printf("%d ", u->data);
		if (u->c != NULL)pass(u->c);
		u = u->s;
	}
}

node* unio(node* H1, node* H2)
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
			link(next, p);
		}
		else 
		{
			if (prev == NULL)H = next;
			else prev->s = next;
			link(p, next);
			p = next;
		}
		next = p->s;
	}
	return H;
}

void add(int x, node*& H)
{
	node* v = new node;
	v->data = x;
	v->par = NULL;
	v->c = NULL;
	v->s = NULL;
	v->degree = 0;
	H = unio(H, v);
}

bool search(node* H, int k, node*& adr)
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
			if (search(H->c, k, adr))
				return true;
		}
		H = H->s;
	}
	return false;
}

void decreaseKey(node*& adr, int k)
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

node* min(node* H)
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

void extractMin(node*& H, int& x)
{
	if (H == NULL)return;
	node* adr = min(H);
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
	H = unio(H, h);
}

void del(node*& H, node*& adr, int x)
{
	decreaseKey(adr, -inf);
	extractMin(H, x);
}

int main()
{
	freopen("input.txt", "r", stdin);
	freopen("output.txt", "w", stdout);
	char c;
	int x, y;
	node* head, *adr;
	head = new node;
	head = NULL;
	bool res;
	while (!feof(stdin))
	{
		scanf("%c", &c);
		if(c=='E'){
			return 0;
		}else if(c=='+'){
			scanf("%d\n", &x);
			if (!search(head, x, adr))
			    add(x, head);
		}else if(c=='?'){
			scanf("%d\n", &x);
			res = search(head, x, adr);
			printf("%c ", res == true ? 'y' : 'n');
		}else if(c=='-'){
			scanf("%d\n", &x);
			if (search(head, x, adr))
			    del(head, adr, x);
		}else if(c=='d'){
			scanf("%d %d\n", &x, &y);
			if (search(head, x, adr))
			    decreaseKey(adr, y);
	    }else if(c=='m'){
			if (head==NULL)
			    printf("- ");
			else
			{
				extractMin(head, x);
				printf("%d ", x);
			}
	    }
	}
	return 0;
}