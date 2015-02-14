#include <iostream>
#include <fstream>
#include <string>

using namespace std;

struct node
{
	string key;
	int h;
	node* left;
	node* right;
	node(string k) { key = k; left = right = 0; h = 1; }
};

int d = 0;

int height(node* p)
{
	if (p != 0) return p->h;
	else return 0;
}

int diff(node* p)
{
	return height(p->right) - height(p->left);
}

void fixheight(node* p)
{
	int hl = height(p->left);
	int hr = height(p->right);
	if (hl > hr) p->h = hl + 1;
	else p->h = hr + 1;
}

node* rotate_right(node* p)
{
	node* q = p->left;
	p->left = q->right;
	q->right = p;
	fixheight(p);
	fixheight(q);
	return q;
}

node* rotate_left(node* q)
{
	node* p = q->right;
	q->right = p->left;
	p->left = q;
	fixheight(q);
	fixheight(p);
	return p;
}

node* balance(node* p)
{
	fixheight(p);
	if (diff(p) == 2)
	{
		if (diff(p->right)<0)
			p->right = rotate_right(p->right);
		return rotate_left(p);
	}
	if (diff(p) == -2)
	{
		if (diff(p->left)>0)
			p->left = rotate_left(p->left);
		return rotate_right(p);
	}
	return p;
}

node* insert(node* p, string k)
{
	if (!p) return new node(k);
	if (k<p->key)
		p->left = insert(p->left, k);
	else
		p->right = insert(p->right, k);
	return balance(p);
}

bool find(node* p, string k)
{
	while (p != 0)
	{
		if (p->key == k) return true;
		++d;
		if (k<p->key) p = p->left;
		else p = p->right;
	}
	return false;
}


node* findmin(node* p)
{
	if (p->left != 0) return findmin(p->left);
	else return p;
}

node* removemin(node* p)
{
	if (p->left == 0)
		return p->right;
	p->left = removemin(p->left);
	return balance(p);
}

node* remove(node* p, string k)
{
	if (!p) return 0;
	if (k<p->key)
		p->left = remove(p->left, k);
	else if (k>p->key)
		p->right = remove(p->right, k);
	else
	{
		node* q = p->left;
		node* r = p->right;
		delete p;
		if (!r) return q;
		node* min = findmin(r);
		min->right = removemin(r);
		min->left = q;
		return balance(min);
	}
	return balance(p);
}

int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");

	string s;
	node* p = 0;
	while (true)
	{
		getline(in, s);
		if (s[0] == '+')
		{
			s.erase(0, 1);
			if (!find(p, s)) p = insert(p, s);
		}
		else if (s[0] == '-')
		{
			s.erase(0, 1);
			p = remove(p, s);
		}
		else if (s[0] == '?')
		{
			d = 1;
			s.erase(0, 1);
			if (find(p, s)) out << d;
			else out << "n";
		}
		else if (s[0] == 'E') break;

	}

	delete p;

	return 0;
}

