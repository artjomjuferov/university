#include <stdio.h>
#include <string>
#include <stdlib.h>
#include <math.h>
#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <iomanip>
#include <cmath>

using namespace std;

struct point
{
	double x;
	double y;
};

point p[1000000];
point t[1000000];
double delta = 100000.0;

void delta_upd(point a, point b)
{
	double dist = sqrt((a.x - b.x)*(a.x - b.x) + (a.y - b.y)*(a.y - b.y));
	if (dist < delta)
		delta = dist;
}

bool cmpY(const point a, const point b)
{
	return a.y < b.y;
}

bool cmpX(const point a, const point b) 
{
	return a.x < b.x || a.x == b.x && a.y < b.y;
}

void rec(int l, int r) {
	if (r - l <= 25) {
		for (int i = l; i < r; i++)
		for (int j = i + 1; j <= r; j++)
			delta_upd(p[i], p[j]);
		sort(p + l, p + r + 1, cmpY);
		return;
	}

	int m = (l + r) / 2;
	double midx = p[m].x;
	rec(l, m); 
	rec(m + 1, r);
	merge(p + l, p + m + 1, p + m + 1, p + r + 1, t, cmpY);
	for (int i = 0; i < r - l + 1; i++)
	{
		p[l + i] = t[i];
	}

	int tsz = 0;
	for (int i = l; i <= r; i++)
	if (abs(p[i].x - midx) < delta) {
		for (int j = tsz - 1; j >= 0 && p[i].y - t[j].y < delta; j--)
			delta_upd(p[i], t[j]);
		t[tsz++] = p[i];
	}
}

int main()
{
	ifstream in("input.txt");
	ofstream out("output.txt");

	int n;
	in >> n;

	for (int i = 0; i < n; i++)
	{
		in >> p[i].x >> p[i].y;
	}

	sort(p, p + n, cmpX);
	
	rec(0, n - 1);

	out << fixed << setprecision(3) << delta;
}
