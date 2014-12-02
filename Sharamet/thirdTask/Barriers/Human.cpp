#include "Human.h"

Human::Human(){
    bad = 10;
    good = 5;

    badImg = ":/img/badHuman";
    goodImg = ":/img/goodHuman";
    meetImg = ":/img/meetHuman";
    name = "Human";
}

QString Human::badAction(Hero *h){
    h->decreaseHp(bad);
    QString text = " - \"I will punish you!\"\n";
         text += "hp: - ";
         text += QString::number(bad);
   return text;
}

QString Human::goodAction(Hero *h){
    h->increaseHp(good);
    QString text = " - \"Do you want to eat!\"\n";
         text += "hp: +";
         text += QString::number(good);
    return text;
}

