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
    string key;
    unsigned char height;
    node* left;
    node* right;
    node(string k) { key = k; left = right = 0; height = 1; }
};

unsigned char height(node* p)
{
    return p?p->height:0;
}

int bfactor(node* p)
{
    return height(p->right)-height(p->left);
}

void fixheight(node* p)
{
    int hl = height(p->left);
    int hr = height(p->right);
    p->height = (hl>hr?hl:hr)+1;
}

node* rotateright(node* p)
{
    node* q = p->left;
    p->left = q->right;
    q->right = p;
    fixheight(p);
    fixheight(q);
    return q;
}

node* rotateleft(node* q)
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
    if(bfactor(p) == 2)
    {
        if (bfactor(p->right) < 0)
            p->right = rotateright(p->right);
        return rotateleft(p);
    }
    if( bfactor(p)==-2 )
    {
        if (bfactor(p->left) > 0)
            p->left = rotateleft(p->left);
        return rotateright(p);
    }
    return p;
}

node* add(node* p, string k) 
{
    if(!p) 
		return new node(k);
    if(k < p->key)
        p->left = add(p->left,k);
    else
        p->right = add(p->right,k);
    return balance(p);
}

node* findmin(node* p) 
{
    return p->left?findmin(p->left):p;
}

node* removemin(node* p) 
{
    if(p->left == 0)
        return p->right;
    p->left = removemin(p->left);
    return balance(p);
}

node* del(node* p, string k) 
{
    if(!p) return 0;
    if(k < p->key)
        p->left = del(p->left,k);
    else if(k > p->key)
        p->right = del(p->right,k);	
    else
    {
        node* q = p->left;
        node* r = p->right;
        delete p;
        if(!r) return q;
        node* min = findmin(r);
        min->right = removemin(r);
        min->left = q;
        return balance(min);
    }
    return balance(p);
}

int search(node* p, string k, int h)
{
	if(!p)
		return 0;
	if (p->key == k )
	{
	    cout << "das?!" <<h <<endl;
	    return h;
	}
	
	int l = search(p->left, k, ++h);
	int r = search(p->right, k, ++h);
	
	cout << l << " " << r << " " << h  << " " << p->key<< endl;
	
	return l>r?l:r; 
}

void print_tree(node* p)
{
	if (p)
		cout << p->key << " : ";
	else
		return;
	
	if (p->left)
		cout << " left -  " << p->left->key; 
	if (p->right)
		cout << " right -  " << p->right->key;
	cout << endl;
	
	if (p->left)
		print_tree(p->left);
	
	if (p->right)
		print_tree(p->right);
}
int main()
{
// 	ifstream in("input.txt");
	ifstream in("04.in");
	ofstream out("output.txt");

	string s = "";

	node *head = 0;
//	cout << head << endl;
    int i =0;
	while (s[0] != 'E'){
		getline(in, s);
        
		cout << i++ << " " << s ;
		
		if (s[0] == '+')
			head = add(head, s.substr(1, s.length()));
		else if (s[0] == '-')
			head = del(head, s.substr(1, s.length()));	
		else if (s[0] == '?'){
		    cout << endl;
			int h = search(head, s.substr(1, s.length()), 1);
			cout << endl;
			if (h == 0)
			{
				out << 'n';
				cout<< " !!!!!!!!!!!!!!! n";
			}else{
				out << h;
				cout<< " !!!!!!!!!!!!!! "<<h;
		    }
		}
		cout << endl;
		print_tree(head);
		cout << endl;
	}
	
	in.close();
	out.close();

  return 0;
}
