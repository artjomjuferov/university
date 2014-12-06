#ifndef FORMCHOICE_H
#define FORMCHOICE_H

#include <QWidget>

namespace Ui {
class FormChoice;
}

class FormChoice : public QWidget
{
    Q_OBJECT

public:
    explicit FormChoice(QWidget *parent = 0);
    ~FormChoice();

private:
    Ui::FormChoice *ui;
};

#endif // FORMCHOICE_H
