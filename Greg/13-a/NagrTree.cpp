#include <iostream>
#include <fstream>
#include <deque>
#include <vector>
#include <algorithm>
#include <string>

using namespace std;

class trie
{
public:
	trie()
	{
		descendants.assign(32, (trie *)0);
		current = 0;
		status = false;
	}
	bool look(string s, int position);
	void add(string s, int position);
	void vipe(string s, int position);

private:
	vector <trie *> descendants;
	bool status;
	int c;
	int current;

};

bool trie::look(string s, int position)
{
	int tmp = (int)s[position] - 96;

	if (position + 1 == s.size())
	{
		if (status)
		{
			if (current == tmp) return true;
			else return false;
		}
		else return false;
	}
	else
	{
		int next = (int)s[position + 1] - 96;

		if (descendants[next] != (trie *)0)
			return (descendants[next])->look(s, position + 1);
		else return false;
	}
}

void trie::add(string s, int position)
{
	int tmp = (int)s[position] - 96;

	current = tmp;

	if (position + 1 == s.size()) status = true;
	else
	{
		int next = (int)s[position + 1] - 96;

		if (descendants[next] == (trie *)0)
			descendants[next] = new trie();

		descendants[next]->add(s, position + 1);
	}
}

void trie::vipe(string s, int position)
{
	int tmp = (int)s[position] - 96;

	if (position + 1 == s.size())
	{
		if (status && current == tmp) status = false;
	}
	else
	{
		int next = (int)s[position + 1] - 96;

		if (descendants[next] != (trie *)0)
			(descendants[next])->vipe(s, position + 1);
	}
}


int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");

	trie tree;
	string s;
	string pattern = "+-? E";
	pattern[3] = 96;

	while (!in.eof())
	{
		in >> s;

		if (s[0] == '+')   
		{
			s[0] = pattern[3];
			tree.add(s, 0);
		}
		else if (s[0] == '-')   
		{
			s[0] = pattern[3];
			tree.vipe(s, 0);
		}
		else if (s[0] == '?')   
		{
			s[0] = pattern[3];
			if (tree.look(s, 0)) out << "y";
			else out << "n";
		}
		else break;
	}

	return 0;
}