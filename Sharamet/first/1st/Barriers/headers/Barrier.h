#ifndef HERO
#define HERO
#include "../../Heroes/headers/Hero.h"
#endif

#include <iostream>
#include <stdlib.h>

class Barrier{
	public:
		void doAction(Hero *h);
		virtual void badAction(Hero *h)=0;
		virtual void goodAction(Hero *h)=0;
	protected:
		int bad, good;
};