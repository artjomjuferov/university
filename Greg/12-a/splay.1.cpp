#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <math.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>

using namespace std;

struct node
{
	char* data;
	node *left, *right, *parent;
};

void smallLeft(node*& a)
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

void smallRight(node*& a)
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

void splay(node*& x)
{
	if (x->parent == NULL)return;
	node* p = x->parent;
	if (p->parent == NULL)
	{
		if (x == p->left)smallLeft(p);
		else smallRight(p);
		return;
	}
	node* g = p->parent;
	if (p == g->left)
	{
		if (x == p->left)
		{
			smallLeft(g);
			smallLeft(g);
		}
		else
		{
			smallRight(p);
			smallLeft(g);
		}
	}
	else
	{
		if (x == p->right)
		{
			smallRight(g);
			smallRight(g);
		}
		else
		{
			smallLeft(p);
			smallRight(g);
		}
	}
	return splay(g);
}


node* make(char* x, node *p)
{
	node* v = new node;
	v->data = new char[11];
	strcpy(v->data, x);
	v->left = NULL;
	v->right = NULL;
	v->parent = p;
	return v;
}

void add(char* x, node*& root)
{
	if (root == NULL)
	{
		root = make(x, NULL);
		return;
	}
	node* v = root;
	while ((strcmp(x, v->data)<0 && v->left != NULL) || (strcmp(x, v->data)>0 && v->right != NULL))v = strcmp(x, v->data)<0 ? v->left : v->right;
	if (!strcmp(x, v->data))return;
	node* u = make(x, v);
	if (strcmp(x, v->data)<0)v->left = u;
	else v->right = u;
	splay(u);
}

node* search(int t, char* k, node* v, int mode)
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
	else if (strcmp(k, v->data)<0) return search(t + 1, k, v->left, mode);
	else return search(t + 1, k, v->right, mode);
}

void del(char* k, node*& v, node* root)
{
	node* t;
	node* u = search(1, k, v, 0);
	if (u == NULL)
		return;
	node* tmp = NULL;
	if (u->parent != NULL)
		tmp = u->parent;
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
		while (t->right != NULL)
			t = t->right;
		u->data = t->data;
		u = t;
	}
	t = u->left == NULL ? u->right : u->left;
	if (u->parent->left == u)
		u->parent->left = t;
	else
		u->parent->right = t;
	if (t != NULL)
		t->parent = u->parent;
	if (tmp != NULL)
		splay(tmp);
}

int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");
	string s;
	
	node* u, root = new node;
	root = NULL;
	while (true)
	{
		in >> s;
		
		if (s[i] == 'E')
			break;
		
		s
		
		if (s[i] == '+')
			add(s, root);
		else if (s[i] == '-')
			del(s, root, root);
		else if (s[i] == '?')
		{
			u = search(1, s, root, 1);
			if (u != NULL)
				splay(u);
		}
	}
	return 0;
}