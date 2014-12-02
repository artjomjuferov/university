#ifndef BARRIER
#define BARRIER
#include "Barrier.h"
#endif

#include <iostream>
#include <stdlib.h>


class Human: public Barrier{
	public:
		Human();
		void badAction(Hero *h);
		void goodAction(Hero *h);
};