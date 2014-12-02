#include "Barrier.h"

QString Barrier::doAction(Hero *h, QGraphicsScene *qScene){

    qScene->clear();
    if ((rand()%200) > 100){
        qScene->addPixmap(QPixmap(this->badImg));
        return badAction(h);
    }else{
        qScene->addPixmap(QPixmap(this->goodImg));
        return goodAction(h);
	}
}
