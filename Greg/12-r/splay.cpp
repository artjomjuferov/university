#include <iostream>
#include <fstream>
#include <string>

using namespace std;

struct node
{
	char* data;
	node *left, *right, *parent;
};

void SLR(node*& a)
{
	node* b = a->left;
	node* p = b->left;
	node* q = b->right;
	node* r = a->right;
	a->right = b;
	b->right = r;
	b->left = q;
	a->left = p;
	if (p != NULL)p->parent = a;
	if (r != NULL)r->parent = b;
	swap(a->data, b->data);
}

void SRR(node*& a)
{
	node* b = a->right;
	node* q = b->left;
	node* p = a->left;
	node* r = b->right;
	a->left = b;
	a->right = r;
	b->left = p;
	b->right = q;
	if (r != NULL)r->parent = a;
	if (p != NULL)p->parent = b;
	swap(a->data, b->data);
}

void SPLAY(node*& x)
{
	if (x->parent == NULL)return;
	node* p = x->parent;
	if (p->parent == NULL)
	{
		if (x == p->left)SLR(p);
		else SRR(p);
		return;
	}
	node* g = p->parent;
	if (p == g->left)
	{
		if (x == p->left)
		{
			SLR(g);
			SLR(g);
		}
		else
		{
			SRR(p);
			SLR(g);
		}
	}
	else
	{
		if (x == p->right)
		{
			SRR(g);
			SRR(g);
		}
		else
		{
			SLR(p);
			SRR(g);
		}
	}
	return SPLAY(g);
}


node* MAKE(char* x, node *p)
{
	node* v = new node;
	v->data = new char[11];
	strcpy(v->data, x);
	v->left = NULL;
	v->right = NULL;
	v->parent = p;
	return v;
}

void ADD(char* x, node*& root)
{
	if (root == NULL)
	{
		root = MAKE(x, NULL);
		return;
	}
	node* v = root;
	while ((strcmp(x, v->data)<0 && v->left != NULL) || (strcmp(x, v->data)>0 && v->right != NULL))v = strcmp(x, v->data)<0 ? v->left : v->right;
	if (!strcmp(x, v->data))return;
	node* u = MAKE(x, v);
	if (strcmp(x, v->data)<0)v->left = u;
	else v->right = u;
	SPLAY(u);
}

node* SEARCH(int t, char* k, node* v, int mode)
{
	if (v == NULL)
	{
		if (mode)cout << "n";
		return NULL;
	}
	else if (!strcmp(v->data, k))
	{
		if (mode)cout << t;
		return v;
	}
	else if (strcmp(k, v->data)<0) return SEARCH(t + 1, k, v->left, mode);
	else return SEARCH(t + 1, k, v->right, mode);
}

void DELETE(char* k, node*& v, node* root)
{
	node* t;
	node* u = SEARCH(1, k, v, 0);
	if (u == NULL)return;
	node* tmp = NULL;
	if (u->parent != NULL)tmp = u->parent;
	if (u->left == NULL && u->right == NULL && u == root)
	{
		root = NULL;
		return;
	}
	if (u->left != NULL && u->right == NULL && u == root)
	{
		u = u->left;
		u->parent = NULL;
		v->left = u->left;
		v->right = u->right;
		v->parent = u->parent;
		strcpy(v->data, u->data);
		return;
	}
	if (u->left == NULL && u->right != NULL && u == root)
	{
		u = u->right;
		u->parent = NULL;
		v->left = u->left;
		v->right = u->right;
		v->parent = u->parent;
		strcpy(v->data, u->data);
		return;
	}
	if (u->left != NULL && u->right != NULL)
	{
		t = u->left;
		while (t->right != NULL)t = t->right;
		u->data = t->data;
		u = t;
	}
	t = u->left == NULL ? u->right : u->left;
	if (u->parent->left == u)u->parent->left = t;
	else u->parent->right = t;
	if (t != NULL)t->parent = u->parent;
	if (tmp != NULL)SPLAY(tmp);
}

int main()
{
	freopen("input.txt", "r", stdin);
	freopen("output.txt", "w", stdout);
	char s;
	char word[100];
	node* u;
	node* root = new node;
	root = NULL;
	while (true)
	{
		scanf("%c%s\n", &s, word);
		if (s == '+')ADD(word, root);
		else if (s == '-')DELETE(word, root, root);
		else if (s == '?')
		{
			u = SEARCH(1, word, root, 1);
			if (u != NULL)SPLAY(u);
		}
		else if (s == 'E')break;
	}
	return 0;
}