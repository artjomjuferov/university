#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    QObject::connect(ui->horizontalSlider, SIGNAL(valueChanged(int)), ui->progressBar, SLOT(setValue(int)));

    QObject::connect(ui->horizontalSlider_2, SIGNAL(valueChanged(int)), ui->progressBar_2, SLOT(setValue(int)));
    ui->progressBar_2->setValue(0);

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_exitButton_clicked()
{
    qApp->exit();
}

void MainWindow::on_pushButton_clicked()
{
    ui->progressBar_3->setValue(-1 + ui->progressBar_3->value());
}

void MainWindow::on_pushButton_2_clicked()
{
    ui->progressBar_3->setValue(1 + ui->progressBar_3->value());
}
