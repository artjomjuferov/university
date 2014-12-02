#ifndef BARRIER_H
#define BARRIER_H

#include "libs.h"
#include "Heroes/Hero.h"
#include <string>
#include "QGraphicsScene"
#include "QString"

class Barrier{
	public:
        QString doAction(Hero *h, QGraphicsScene*);
        virtual QString badAction(Hero *h)=0;
        virtual QString goodAction(Hero *h)=0;
        QString badImg;
        QString goodImg;
        QString meetImg;
        QString name;
	protected:
		int bad, good;
};

#endif
