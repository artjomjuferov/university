#ifndef HERO_H
#define HERO_H

#include "libs.h"

class Hero{
    public:
        void decreaseHp(int);
        void increaseHp(int);
        int getLuck();
        int getSpeed();
        int getHp();
        bool isAlive();
        void makeStep();
        virtual void yelName()=0;
        QString img;
        QString hideImg;
        void hideHp();
    protected:
        int hp, speed, luck, hide;
};
#endif
