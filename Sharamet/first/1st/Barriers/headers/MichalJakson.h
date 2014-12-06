#ifndef BARRIER
#define BARRIER
#include "Barrier.h"
#endif

#include <iostream>
#include <stdlib.h>


class MichalJakson: public Barrier{
	public:
		MichalJakson();
		void badAction(Hero *h);
		void goodAction(Hero *h);
};

