#ifndef HUMAN_H
#define HUMAN_H

#include "Barrier.h"
#include "libs.h"


class Human: public Barrier{
    public:
        Human();
        QString badAction(Hero *h);
        QString goodAction(Hero *h);
};

#endif
