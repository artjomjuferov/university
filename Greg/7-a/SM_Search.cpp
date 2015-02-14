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

void left_search(string& A, string& x, int ind, int& count)
{
	int index = S[ind];
	while (x[0] == A[index])
	{
		for (int i = 0; i < x.length(); i++)
		{
			if (A[index + i] != x[i])
			{
				ind--;
				if (ind < 0) return;
				index = S[ind];
				break;
			}
			if (i == x.length() - 1) count++;
		}
		ind--;
		if (ind < 0) return;
		index = S[ind];
	}
}

void right_search(string& A, string& x, int ind, int& count)
{
	int index = S[ind];
	while (x[0] == A[index])
	{
		for (int i = 0; i < x.length(); i++)
		{
			if (A[index + i] != x[i])
			{
				ind++;
				if (ind > A.length() - 1) return;
				index = S[ind];
				break;
			}
			if (i == x.length() - 1) count++;
		}
		ind++;
		if (ind > A.length() - 1) return;
		index = S[ind];
	}
}

int binary_search(string& A, string& x)
{
	int first = 0;
	int last = A.length() - 1;
	int count = 0;


	while (first < last)
	{
		int mid = (first + last) / 2;
		
		int j = 0;
		while (true)
		{

			if (x[j] < A[S[mid] + j])
			{
				last = mid;
				j = 0;
				break;
			}
			else if (x[j] > A[S[mid] + j])
			{
				first = mid + 1;
				j = 0;
				break;
			}
			else j++;
			if (j == x.length())
			{
				count++;
				left_search(A, x, mid - 1, count);
				right_search(A, x, mid + 1, count);
				return count;
			}
		}
	}
	return count;
 }

int main()
{
	// ifstream in("input.txt");
	ifstream in("14.in");
	ofstream out("output.txt");

	string x;
	getline(in, x);

	string A;
	getline(in, A);
	A = A + '$';

	int n;
	n = A.length();
	construct_suffix_array(A, n);
		for (int i=0; i<n;i++){
	  cout << S[i] << endl;
	}
	out << binary_search(A, x);
	

	return 0;
}
