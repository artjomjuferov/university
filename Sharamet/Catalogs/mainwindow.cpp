#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    extension.insert("txt");

    dir_model = new QFileSystemModel();

    file_model = NULL;


    dir_model->setRootPath(QDir::currentPath());
    dir_model->setFilter(QDir::AllDirs | QDir::Files | QDir::NoDotAndDotDot);

    ui->treeView->setModel(dir_model);
}

MainWindow::~MainWindow()
{
    delete ui;
    delete dir_model;
    if(file_model!=NULL)delete file_model;
}

void MainWindow::on_treeView_clicked(const QModelIndex &index)
{
    QString path = dir_model->fileInfo(index).absoluteFilePath();

    if(file_model!=NULL)delete file_model;
    file_model = new QFileSystemModel();
    file_model->setFilter(QDir::Files | QDir::AllDirs | QDir::NoDotAndDotDot);

    ui->listView->setModel(file_model);
    ui->listView->setRootIndex(file_model->setRootPath(path));

    ui->lineEdit->setText(path);
}

void MainWindow::on_pushButton_clicked()
{
    if(ui->textEdit->toPlainText() == "")
    {
        QMessageBox::information(0,"ErrorMessageBox","Can`t be empty");
        return;
    }

    QString path = file_model->fileInfo(ui->listView->currentIndex()).absoluteFilePath();
    QFile file(path);

    if(extension.find(QFileInfo(file).suffix()) != extension.end())
    {
        if(!file.open(QIODevice::Append | QFile::Text))
        {
            QMessageBox::information(0,"ErrorMessageBox","Open only .txt extension\n"+path);
            return;
        }
        QTextStream out(&file);
        out << ui->textEdit->toPlainText() << '\n';

        file.close();
    }
    else QMessageBox::information(0,"ErrorMessageBox","File is not text\n"+path);
}

void MainWindow::on_listView_doubleClicked(const QModelIndex &index)
{
    QString path = file_model->fileInfo(ui->listView->currentIndex()).absoluteFilePath();
    QFile file(path);

    if(extension.find(QFileInfo(file).suffix()) != extension.end())
    {
        if(!file.open(QIODevice::ReadOnly | QFile::Text))
        {
            QMessageBox::information(0,"ErrorMessageBox","Can`t open file\n"+path);
            return;
        }
        QTextStream in(&file);
        QString text = in.readAll();

        ui->textEdit_2->setText(text);

        file.close();
        currentIndex = index;
    }
    else QMessageBox::information(0,"ErrorMessageBox","File is not txt\n"+path);
}

void MainWindow::on_pushButton_3_clicked()
{

    QString path = file_model->fileInfo(currentIndex).absoluteFilePath();
    QFile file(path);

    if(extension.find(QFileInfo(file).suffix()) != extension.end())
    {
        if(!file.open(QIODevice::WriteOnly | QFile::Text))
        {
            QMessageBox::information(0,"ErrorMessageBox","Can't open file\n"+path);
            return;
        }
        QTextStream out(&file);
        QString update_text = ui->textEdit_2->toPlainText();

        out << update_text;

        file.close();
    }
    else QMessageBox::information(0,"ErrorMessageBox","Doesn`t open file\n");
}

void MainWindow::on_pushButton_2_clicked()
{
    QString file_name = QInputDialog::getText(this,"New File","Enter filename")+".txt";
    QString path = ui->lineEdit->text();
    QFile file;

    if(path[path.length()] == '/')
        file.setFileName(ui->lineEdit->text() + file_name);
    else
        file.setFileName(ui->lineEdit->text() + "/" + file_name);

    if(!file.open(QIODevice::WriteOnly | QFile::Text))
    {
        QMessageBox::information(0,"ErrorMessageBox","Can`t open file\n");
        return;
    }
}
