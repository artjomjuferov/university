#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    scene = new Scene3D(this);
    t = new MyThread(scene,1);
    connect(t,SIGNAL(change()),scene,SLOT(updateGL()));
    t2 = new MyThread(scene,2);
    connect(t2,SIGNAL(change()),scene,SLOT(updateGL()));


    ui->verticalLayout->addWidget(scene);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    t->start();
}

void MainWindow::on_pushButton_2_clicked()
{
    t->stop = true;
}

void MainWindow::on_pushButton_3_clicked()
{
    t2->start();
}

void MainWindow::on_pushButton_4_clicked()
{
    t2->stop = true;
}
