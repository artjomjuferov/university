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
    node* left;
    node* right;
    node* parent;
    node(string k) { key = k; left = right = parent = 0; }
};


node* rotate_right(node* p)
{
    node* q = p->left;
    p->left->parent = p->parent; 
    p->left = q->right;
    q->right = p;
    p->parent = q;
    return q;
}

node* rotate_left(node* q)
{
    node* p = q->right;
    p->right->parent = p->parent; 
    q->right = p->left;
    p->left = q;
    p->parent = q;
    return p;
}

node* splay(node* p)
{
    if (!p->parent)
        return p;
    node* parent = p->parent;
    if(!parent->parent){
        if(p == p->left)
            return rotate_left(p);
        else
            return rotate_right(p);
    }
    
    node* g_parent = parent->parent;
    if (parent == g_parent->left)
        if (p == parent->left){
            rotate_left(g_parent);
            rotate_left(g_parent);
        }else{
            rotate_right(g_parent);
            rotate_left(g_parent);
        }
    else
        if (p == parent->right){
            rotate_right(g_parent);
            rotate_right(g_parent);
        }else{
            rotate_left(g_parent);
            rotate_right(g_parent);
        }
    return splay(g_parent);
}

node* add(node* p, string k) 
{
    if(!p) 
		return new node(k);
    if(k < p->key){
        p->left = add(p->left,k);
        p->left->parent = p;
    }
    else{
        p->right = add(p->right,k);
        p->right->parent = p;
    }
    return splay(p);
}

node* find_min(node* p) 
{
    return p->left?find_min(p->left):p;
}

node* remove_min(node* p) 
{
    if(p->left == 0)
        return p->right;
    p->left = remove_min(p->left);
    return splay(p);
}

node* del(node* p, string k) 
{
    if(!p) return 0;
    if(k < p->key){
        p->left = del(p->left,k);
        // p->left->parent = p;
    }else if(k > p->key){
        p->right = del(p->right,k);	
        // p->right->parent = p;
    }else{
        node* l = p->left;
        node* r = p->right;
        node* t_parent = p->parent; 
        delete p;
        if(!r) return l;
        node* min = find_min(r);
        min->right = remove_min(r);
        min->left = l;
        min->parent = t_parent;
        return splay(min);
    }
    return splay(p);
}

int search(node* p, string k, int h)
{
	if(!p)
		return 0;
// 	cout << p->key << " " << k << endl;
	if(p->key == k)
		return h;
// 	cout << "okay" << endl;
	int l = search(p->left, k, h++);
	int r = search(p->right, k, h++);
	
	if (r+l == 0)
	    return 0;
	
	return r>0?r:l;
}

void print_tree(node* p)
{
	if (p)
		cout << p->key << " : ";
	else
		return;
	
		
	if (p->parent)
		cout << " parent -  " << p->parent->key; 
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
	while (s[0] != 'E'){
		getline(in, s);

		if (s[0] == '+')
			head = add(head, s.substr(1, s.length()));
		else if (s[0] == '-')
			head = del(head, s.substr(1, s.length()));	
		else if (s[0] == '?'){
			int h = search(head, s.substr(1, s.length()), 1);
			if (h == 0)
				out << 'n';
			else
				out << h;
		}
		
		cout << s << endl;
// 		print_tree(head);
// 		cout << endl;
	}
	
	in.close();
	out.close();

  return 0;
}
