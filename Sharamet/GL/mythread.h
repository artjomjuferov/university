#ifndef MYTHREAD_H
#define MYTHREAD_H

#include <QThread>
#include "scene3d.h"
#include <QtCore>

class MyThread : public QThread
{
    Q_OBJECT

public:
    explicit MyThread(Scene3D*parent, int id_f);
    void run();
    bool stop;

private:
    void change_cube();
    void change_tetra();

    Scene3D* par;
    GLdouble coef;
    int id_figure;

signals:
    void change();
};

#endif // MYTHREAD_H
