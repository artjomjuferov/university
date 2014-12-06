#ifndef MICHALJAKSON_H
#define MICHALJAKSON_H

#include "Barrier.h"
#include "libs.h"


class MichalJakson: public Barrier{
	public:
		MichalJakson();
        QString badAction(Hero *h);
        QString goodAction(Hero *h);
};

#endif
