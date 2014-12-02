#ifndef HUMAN_H
#define HUMAN_H

#include "Barrier.h"
#include "libs.h"


class Human: public Barrier{
    public:
        Human();
        void badAction(Hero *h);
        void goodAction(Hero *h);
};

#endif
