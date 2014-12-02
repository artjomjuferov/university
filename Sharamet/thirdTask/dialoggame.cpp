#include "dialoggame.h"
#include "ui_dialoggame.h"

DialogGame::DialogGame(Hero* hero, QWidget *parent) :
    QDialog(parent),
    ui(new Ui::DialogGame)
{
    ui->setupUi(this);
    ui->pushButton_2->setHidden(true);
    ui->pushButton->setHidden(true);

    mainHero = hero;

    qScene = new QGraphicsScene();

    int tmp = rand() %3;
    if (tmp == 0){
        barrier = new Human;
    } else if(tmp == 1){
        barrier = new Guard;
    } else {
        barrier = new MichalJakson;
    }

    QString text = "I'm ";
            text += barrier->name;

    ui->textBrowser->setText(text);

    ui->textBrowser_3->setText(QString::number(this->steps));
    ui->textBrowser_2->setText(QString::number(mainHero->getHp()));

    qScene->addPixmap(QPixmap(barrier->meetImg));
    ui->graphicsView->setScene(qScene);
    ui->graphicsView->fitInView(qScene->itemsBoundingRect(), Qt::KeepAspectRatio);
}

DialogGame::~DialogGame()
{
    delete ui;
}


void DialogGame::on_pushButton_2_clicked()
{
    this->hide();
}


void DialogGame::on_pushButton_clicked()
{
    int tmp = rand() %3;
    if (tmp == 0){
        barrier = new Human;
    } else if(tmp == 1){
        barrier = new Guard;
    } else {
        barrier = new MichalJakson;
    }

    QString text = "I'm ";
            text += barrier->name;

    ui->textBrowser->setText(text);

    qScene->clear();
    qScene->addPixmap(QPixmap(barrier->meetImg));
    ui->graphicsView->setScene(qScene);
    ui->graphicsView->fitInView(qScene->itemsBoundingRect(), Qt::KeepAspectRatio);

    ui->pushButton_5->show();
    ui->pushButton->hide();
    ui->pushButton_6->show();

    if (!mainHero->isAlive()){
        ui->textBrowser->setText("You're DEAD");
        ui->pushButton->setHidden(true);
        ui->pushButton_2->setHidden(false);
        ui->pushButton_5->hide();
        ui->pushButton_6->hide();

        qScene->clear();
        qScene->addPixmap(QPixmap(":img/lose"));
        ui->graphicsView->setScene(qScene);
        ui->graphicsView->fitInView(qScene->sceneRect(), Qt::KeepAspectRatio);

        return;
    }

    if (this->steps == 1){
        ui->textBrowser->setText("You're winner");
        ui->pushButton->setHidden(true);
        ui->pushButton_2->setHidden(false);
        ui->pushButton_5->hide();
        ui->pushButton_6->hide();

        qScene->clear();
        qScene->addPixmap(QPixmap(":img/win"));
        ui->graphicsView->setScene(qScene);
        ui->graphicsView->fitInView(qScene->sceneRect(), Qt::KeepAspectRatio);
        return;
    }

}

void DialogGame::on_pushButton_6_clicked()
{
    QString text = barrier->doAction(mainHero, qScene);

    ui->textBrowser->setText(text);
    this->steps--;
    ui->textBrowser_3->setText(QString::number(this->steps));
    ui->textBrowser_2->setText(QString::number(mainHero->getHp()));
    ui->graphicsView->setScene(qScene);
    ui->graphicsView->fitInView(qScene->itemsBoundingRect(), Qt::KeepAspectRatio);

    ui->pushButton_5->hide();
    ui->pushButton->show();
    ui->pushButton_6->hide();
}

void DialogGame::on_pushButton_5_clicked()
{
    QString text = "You have hidden";

    ui->textBrowser->setText(text);

    ui->textBrowser_3->setText(QString::number(this->steps));
    ui->textBrowser_2->setText(QString::number(mainHero->getHp()));

    qScene->clear();
    qScene->addPixmap(QPixmap(mainHero->hideImg));
    ui->graphicsView->setScene(qScene);
    ui->graphicsView->fitInView(qScene->itemsBoundingRect(), Qt::KeepAspectRatio);

    ui->pushButton_5->hide();
    ui->pushButton->show();
    ui->pushButton_6->hide();
}
