#include "formchoice.h"
#include "ui_formchoice.h"

FormChoice::FormChoice(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::FormChoice)
{
    ui->setupUi(this);
}

FormChoice::~FormChoice()
{
    delete ui;
}
