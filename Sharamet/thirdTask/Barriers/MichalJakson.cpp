#include "MichalJakson.h"

MichalJakson::MichalJakson(){
    bad = 5;
	good = 10;

    badImg = ":/img/badMichael";
    goodImg = ":/img/goodMichael";
    meetImg = ":/img/meetMichael";
    name = "Michal";
}

QString MichalJakson::badAction(Hero *h){
    h->decreaseHp(bad);
    QString text = "\"Listen to my music!\"\n";
         text += "hp: -";
         text += QString::number(bad);
    return text;
}

QString MichalJakson::goodAction(Hero *h){
    h->increaseHp(good);
    QString text = "\"Check out my moonwalk!\"\n";
         text += "hp: +";
         text += QString::number(good);
    return text;
}
