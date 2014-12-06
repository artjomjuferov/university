#ifndef BARRIER_H
#define BARRIER_H

#include "libs.h"
#include "Heroes/Hero.h"

class Barrier{
	public:
		void doAction(Hero *h);
		virtual void badAction(Hero *h)=0;
		virtual void goodAction(Hero *h)=0;
	protected:
		int bad, good;
};

#endif
