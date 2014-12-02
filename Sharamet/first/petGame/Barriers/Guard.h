#ifndef GUARD_H
#define GUARD_H

#include "Barrier.h"
#include "libs.h"

class Guard: public Barrier{
	public:
		Guard();
		void badAction(Hero *h);
		void goodAction(Hero *h);
};
#endif

