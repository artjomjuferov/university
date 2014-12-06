#include <string>
#include <fstream>

using namespace std;

struct node
{
	string data;
	node *left;
	node *right;
	node *parent;
};

node* make(string data, node* parent)
{
	node* v = new node;
	v->data = data;
	v->parent = parent;
	v->right = 0;
	v->left = 0;
	return v;
}


void add(string data, node* root)
{
	node *v, *u;
	v = root;
	while ((data<v->data && v->left != 0) || (data>v->data && v->right != 0)){
		if (data > v->data)
			v = v->right;
		else
			v = v->left;
		
	}
	if (v->data == data)
		return;

	u = make(data, v);

	if (data < v->data)
		v->left = u;
	else
		v->right = u;
}

node* search(int& h, string data, node *root)
{
	if (root == 0)
		return 0;

	node* v = root;

	while ((data<v->data && v->left != 0) || (data>v->data && v->right != 0)){
		h++;
		if (data > v->data)
			v = v->right;
		else
			v = v->left;
	}
	if (v->data == data)
		return v;	
	else
		return 0;
}

void del(string data, node *root){
	int h = 1;
	node *v = search(h, data, root);
	node *t;
	if (v == 0){
		return;
	}
	if (v == root && v->left == 0 && v->right == 0){
		root = 0;
		return;
	}
	if (v->left != 0 && v->right != 0){
		t = v->right;
		while (t->left != 0)
			t = t->left;
		v->data = t->data;
		v = t;
	}
	if (v->left == 0)
		t = v->right;
	else
		t = v->left;
	
	if (v->parent->left == v)
		v->parent->left = t;
	else
		v->parent->right = t;

	if (t != 0)
		t->parent = v->parent;
}

int main(){
	ifstream in("input.txt");
	ofstream out("output.txt");

	string s = "";
	node *tmp;
	node *root = 0;
	bool empty = true;
	while (s[0] != 'E'){

		getline(in, s);

		if (s[0] == '+'){
			if (empty == true){
				root = make(s.substr(1, s.length()), root);
				empty = false;
			}
			else
				add(s.substr(1, s.length()), root);

		}

		else if (s[0] == '-')
			del(s.substr(1, s.length()), root);		
		else if (s[0] == '?'){
			int h = 1;
			tmp = search(h, s.substr(1, s.length()), root);

			if (tmp == 0)
				out << 'n';
			else
				out << h;
		}
	}
	in.close();
	out.close();

	return 0;
}
