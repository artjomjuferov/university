#ifndef MICHALJAKSON_H
#define MICHALJAKSON_H

#include "Barrier.h"
#include "libs.h"


class MichalJakson: public Barrier{
	public:
		MichalJakson();
		void badAction(Hero *h);
		void goodAction(Hero *h);
};

#endif
