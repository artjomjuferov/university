#ifndef DIALOGCHOICE_H
#define DIALOGCHOICE_H

#include <QDialog>
#include "QMessageBox"
#include "QGraphicsScene"


#include "Heroes/Hero.h"
#include "Heroes/Cat.h"
#include "Heroes/Dog.h"
#include "Heroes/Rat.h"

#include "dialoggame.h"

namespace Ui {
class DialogChoice;
}

class DialogChoice : public QDialog
{
    Q_OBJECT

public:
    explicit DialogChoice(QWidget *parent = 0);
    ~DialogChoice();

private slots:
    void on_comboBox_activated(const QString &arg1);

    void on_pushButton_clicked();

private:
    Ui::DialogChoice *ui;
    QGraphicsScene *qScene;
    Hero* hero;
};

#endif // DIALOGCHOICE_H
