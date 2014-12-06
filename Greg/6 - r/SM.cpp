#include <iostream>
#include <fstream>
#include <string>


using namespace std;

const int max_n = 1000000;
const int alpha = 256;
int S[max_n];

void count_sort(string& A, int n)
{
	int* cnt = new int[alpha];
	for (int i = 0; i < alpha; i++) cnt[i] = 0;
	for (int i = 0; i < n; i++) cnt[A[i]]++;
	for (int i = 1; i < alpha; i++) cnt[i] += cnt[i - 1];
	for (int i = 0; i < n; i++)
	{
		cnt[A[i]]--;
		S[cnt[A[i]]] = i;
	}

	delete[] cnt;
}

int pos[max_n], start[max_n], size[max_n], S1[max_n];
bool flag[max_n];

void construct_suffix_array(string& A, int n)
{
	count_sort(A, n);

	for (int i = 0; i < n; i++)
	{
		pos[S[i]] = i;
		flag[i] = false;
	}
	flag[0] = true;
	start[0] = 0;
	for (int i = 1; i < n; i++)
	{
		if (A[S[i]] != A[S[i - 1]])
		{
			flag[i] = true;
			start[i] = i;
		}
		else start[i] = start[i - 1];
	}
	int h = 1;
	while (h < n)
	{
		for (int i = 0; i < n; i++) size[i] = 0;
		for (int i = 0; i < n; i++)
		{
			if (S[i] >= h)
			{
				int j = S[i] - h;
				int k = start[pos[j]];
				S1[k + size[k]] = j;
				if (size[k]>0)
				{
					int j1 = S1[k + size[k] - 1];
					if (start[i] != start[pos[j1 + h]])
						flag[k + size[k]] = true;
				}
				size[k]++;
			}
			if (S[i] + h >= n) S1[i] = S[i];
		}
		for (int i = 0; i < n; i++)
		{
			S[i] = S1[i];
			pos[S[i]] = i;
			if (flag[i]) start[i] = i;
			else start[i] = start[i - 1];
		}
		h *= 2;
	}
}

int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");

	string A;
	getline(in, A);
	A = A + '$';

	int n;
	n = A.length();
	construct_suffix_array(A, n);
	for (int i = 1; i < n; i++) out << S[i] + 1 << ' ';

	return 0;
}
