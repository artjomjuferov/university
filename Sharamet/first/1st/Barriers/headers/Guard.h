#ifndef BARRIER
#define BARRIER
#include "Barrier.h"
#endif

#include <iostream>
#include <stdlib.h>


class Guard: public Barrier{
	public:
		Guard();
		void badAction(Hero *h);
		void goodAction(Hero *h);
};