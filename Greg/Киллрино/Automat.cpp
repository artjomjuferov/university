#include <string>
#include <vector>
#include <fstream> 
#include <algorithm>


using namespace std;


int T[1000001][30];

vector<int> prefix_func(string s)
{
	vector<int> p(s.length());

	
	p[1] = 0;
	for (int i = 2; i < s.length(); i++)
	{
		int k = p[i-1];
		while (k > 0 && s[k+1] != s[i])
			k = p[k - 1];
		if (s[k+1] == s[i])
			k++;
		p[i] = k;
	}
	return p;
}

void make_table(string x, char* C, int* M)
{
	for (int i = 1; i <= 27; i++)
		M[i] = 0;

	int k = 0;
	for (int i = 1; i < x.length(); i++)
	{
		int tmp = int(x[i] - 'a') + 1;
		if (M[tmp] == 0)
		{
			k++;
			M[tmp] = k;
			C[k] = x[i];
		}
	}

	vector <int> L = prefix_func(x);

	L[0] = 0;
	for (int i = 0; i < x.length() - 1; i++)
	{
		T[i][0] = 0;
		for (int j = 1; j <= k; j++)
		{
			if (C[j] == x[i + 1])
				T[i][j] = i + 1;
			else
			{
				int l = L[i];
				while ((l > 0) && (x[l + 1] != C[j]))
					l = L[l];
				if (x[l + 1] == C[j])
					T[i][j] = l + 1;
				else
					T[i][j] = 0;
			}
		}
	}
}


int automat(string x, string A)
{
	int M[30];
	char C[30];

	make_table(x, C, M);

	int s = 0;
	for (int i = 1; i < A.length(); i++)
	{
		int tmp = int(A[i] - 'a') + 1;

		s = T[s][M[tmp]];
		if (s == (x.length() - 1))
			return i - x.length() + 2;
	}
	return -1;
}

int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");

	string A, x;

	getline(in, x);
	x = "0" + x;

	getline(in, A);
	A = "0" + A;

	out << automat(x,A);

	out.close();
	in.close();

	return 0;
}
