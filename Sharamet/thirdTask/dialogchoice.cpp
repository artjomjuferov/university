#include "dialogchoice.h"
#include "ui_dialogchoice.h"


DialogChoice::DialogChoice(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::DialogChoice)
{
    ui->setupUi(this);

    ui->comboBox->addItem("Cat");
    ui->comboBox->addItem("Dog");
    ui->comboBox->addItem("Rat");

    qScene = new QGraphicsScene();
}

DialogChoice::~DialogChoice()
{
    delete ui;
}

void DialogChoice::on_comboBox_activated(const QString &arg1)
{

    qScene->clear();

    if (arg1 == "Cat"){
        hero = new Cat();
    } else if (arg1 == "Dog"){
        hero = new Dog();
    } else {
        hero = new Rat();
    }

    qScene->addPixmap(QPixmap(hero->img));

    QString text = "hp : ";
            text += QString::number(hero->getHp());
            text += "<br>speed : "+QString::number(hero->getSpeed());
            text += "<br>luck : "+QString::number(hero->getLuck());
    ui->textBrowser->setText(text);

    ui->graphicsView->setScene(qScene);

    ui->graphicsView->fitInView(qScene->itemsBoundingRect(), Qt::KeepAspectRatio);

}

void DialogChoice::on_pushButton_clicked()
{
    DialogGame *dGame = new DialogGame(hero);
    dGame->show();
    this->hide();
}
