#ifndef DIALOGGAME_H
#define DIALOGGAME_H

#include <QDialog>
#include "QGraphicsScene"


#include "Heroes/Hero.h"

#include "Barriers/Barrier.h"
#include "Barriers/Guard.h"
#include "Barriers/Human.h"
#include "Barriers/MichalJakson.h"

namespace Ui {
class DialogGame;
}

class DialogGame : public QDialog
{
    Q_OBJECT

public:
    explicit DialogGame(Hero*, QWidget *parent = 0);
    ~DialogGame();

private slots:
    void on_pushButton_clicked();

    void on_pushButton_2_clicked();

    void on_pushButton_6_clicked();

    void on_pushButton_5_clicked();

private:
    Ui::DialogGame *ui;
    QGraphicsScene *qScene;
    Hero *mainHero;
    Barrier *barrier;
    int steps = 20;
};

#endif // DIALOGGAME_H
