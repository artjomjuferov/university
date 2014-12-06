#include "mythread.h"
#include <math.h>
#include <QMutex>

MyThread::MyThread(Scene3D *parent, int id_f):
    par(parent)
{
    coef = 0.01;
    id_figure = id_f;
}

void MyThread::run()
{
    stop = false;
    while(!stop)
    {
        QMutex m;
        m.lock();

        if(id_figure == 1) change_cube();
        else if (id_figure == 2) change_tetra();

        m.unlock();
        msleep(70);
        emit change();
    }
}

void MyThread::change_cube()
{
    for(int i = 0; i < 24; i++)
        for(int j = 0; j < 3; j++)
            par->Vertex[i][j] += coef;

    for(int i = 0; i < 24; i++)
    {
        if((par->Vertex[i][0] < -2)||(par->Vertex[i][0] > 2)){ coef *= -1;break;}
        if((par->Vertex[i][1] < -2)||(par->Vertex[i][1] > 2)){ coef *= -1;break;}
        if((par->Vertex[i][2] < -2)||(par->Vertex[i][2] > 2)){ coef *= -1;break;}
    }
    par->xRot_c += 1;
    par->yRot_c += 1;
    par->zRot_c += 1;

    if ((par->xRot_c == 360)||(par->xRot_c == -360)) par->xRot_c = 0;
    if ((par->yRot_c == 360)||(par->yRot_c == -360)) par->yRot_c = 0;
    if ((par->zRot_c == 360)||(par->zRot_c == -360)) par->zRot_c = 0;
}

void MyThread::change_tetra()
{
    for(int i = 0; i < 12; i++)
        for(int j = 0; j < 3; j++)
            par->Vertex2[i][j] += coef;

    for(int i = 0; i < 12; i++)
    {
        if((par->Vertex2[i][0] < -3)||(par->Vertex2[i][0] > 3)){ coef *= -1;break;}
        if((par->Vertex2[i][1] < -3)||(par->Vertex2[i][1] > 3)){ coef *= -1;break;}
        if((par->Vertex2[i][2] < -3)||(par->Vertex2[i][2] > 3)){ coef *= -1;break;}
    }

    par->xRot_t += 1;
    par->yRot_t += 1;
    par->zRot_t += 1;

    if ((par->xRot_t == 360)||(par->xRot_t == -360)) par->xRot_t = 0;
    if ((par->yRot_t == 360)||(par->yRot_t == -360)) par->yRot_t = 0;
    if ((par->zRot_t == 360)||(par->zRot_t == -360)) par->zRot_t = 0;
}
