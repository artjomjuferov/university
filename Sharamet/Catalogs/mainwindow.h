#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QDir>
#include <QFileInfo>
#include <QString>
#include <QFileSystemModel>
#include <QFile>
#include <QTextStream>
#include <QMessageBox>
#include <QSet>
#include <QTextEdit>
#include <QModelIndex>
#include <QInputDialog>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void on_treeView_clicked(const QModelIndex &index);

    void on_pushButton_clicked();

    void on_listView_doubleClicked(const QModelIndex &index);

    void on_pushButton_3_clicked();

    void on_pushButton_2_clicked();

private:
    Ui::MainWindow *ui;
    QFileSystemModel* dir_model;
    QFileSystemModel* file_model;
    QSet<QString> extension;
    QModelIndex currentIndex;


};

#endif // MAINWINDOW_H
