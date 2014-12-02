#include "Guard.h"

Guard::Guard(){
    bad = 12;
	good = 3;
    badImg = ":/img/badGuard";
    goodImg = ":/img/goodGurad";
    meetImg = ":/img/meetGuard";
    name = "Guard";
}

QString Guard::badAction(Hero *h){
    h->decreaseHp(bad);
    QString text = " - \"You are my enemy!\"\n";
         text += "hp: -";
         text += QString::number(bad);
    return text;
}

QString Guard::goodAction(Hero *h){
    h->increaseHp(good);
    QString text = " - \"You are my friend!\"\n";
         text += "hp: +";
         text = text + QString::number(good);
    return text;
}

