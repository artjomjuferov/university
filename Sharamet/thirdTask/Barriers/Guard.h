#ifndef GUARD_H
#define GUARD_H

#include "Barrier.h"
#include "libs.h"

class Guard: public Barrier{
	public:
		Guard();
        QString badAction(Hero *h);
        QString goodAction(Hero *h);
};
#endif

