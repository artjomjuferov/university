#include "scene3d.h"
#include <time.h>
#include <math.h>

Scene3D::Scene3D(QWidget *parent)
    :QGLWidget(parent)
{
    initCube(); initTetra();
    setColor();

    xRot_t = yRot_t = zRot_t = 0;
    xRot_c = yRot_c = zRot_c = 0;
    scale = 1;
    /*QTimer *timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(updateGL()));
    timer->start(20);*/
}

void Scene3D::change()
{

}

void Scene3D::initializeGL()
{
    glClearColor(1,1,1,1);
    glEnable(GL_DEPTH_TEST);
}

void Scene3D::resizeGL(int w, int h)
{
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();

    GLfloat ratio=(GLfloat)h/(GLfloat)w;

    if (w>=h)
       glOrtho(-2.0/ratio, 2.0/ratio, -2.0, 2.0, -20.0, 20.0);
    else
       glOrtho(-2.0, 2.0, -2.0*ratio, 2.0*ratio, -20.0, 20.0);

    glViewport(0, 0, (GLint)w, (GLint)h);
}

void Scene3D::paintGL()
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW);

    glLoadIdentity();
    glScaled(scale,scale,scale);

    glRotated(xRot_c,1,0,0);
    glRotated(yRot_c,0,1,0);
    glRotated(zRot_c,0,0,1);
    drawCube();

    glLoadIdentity();
    glScaled(scale,scale,scale);

    glRotated(xRot_t,1,0,0);
    glRotated(yRot_t,0,1,0);
    glRotated(zRot_t,0,0,1);
    drawTetra();

}

void Scene3D::initTetra()
{
    //передняя.............................
    Vertex2[0][0] = 0;
    Vertex2[0][1] = 1;
    Vertex2[0][2] = 0;

    Vertex2[1][0] = -1;
    Vertex2[1][1] = 0;
    Vertex2[1][2] = 0;

    Vertex2[2][0] = 1;
    Vertex2[2][1] = 0;
    Vertex2[2][2] = 0;
    //нижняя...............................
    Vertex2[3][0] = -1;
    Vertex2[3][1] = 0;
    Vertex2[3][2] = 0;

    Vertex2[4][0] = 0;
    Vertex2[4][1] = 0;
    Vertex2[4][2] = -1;

    Vertex2[5][0] = 1;
    Vertex2[5][1] = 0;
    Vertex2[5][2] = 0;
    //левая...............................
    Vertex2[6][0] = -1;
    Vertex2[6][1] = 0;
    Vertex2[6][2] = 0;

    Vertex2[7][0] = 0;
    Vertex2[7][1] = 1;
    Vertex2[7][2] = 0;

    Vertex2[8][0] = 0;
    Vertex2[8][1] = 0;
    Vertex2[8][2] = -1;
    //правая...............................
    Vertex2[9][0] = 1;
    Vertex2[9][1] = 0;
    Vertex2[9][2] = 0;

    Vertex2[10][0] = 0;
    Vertex2[10][1] = 1;
    Vertex2[10][2] = 0;

    Vertex2[11][0] = 0;
    Vertex2[11][1] = 0;
    Vertex2[11][2] = -1;
}

void Scene3D::drawTetra()
{
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_COLOR_ARRAY);

    glVertexPointer(3, GL_DOUBLE, 0, Vertex2);
    glColorPointer(3, GL_DOUBLE, 0, Colors);
    glDrawArrays(GL_TRIANGLES, 0, 12);

    glDisableClientState(GL_COLOR_ARRAY);
    glDisableClientState(GL_VERTEX_ARRAY);
}

void Scene3D::drawSphere(float Rad)
{
    int n = 50;
    float theta1, theta2;
    float phi;
    float Coords[3];

    qglColor(Qt::black);

    for (int j = 0; j < n; j++)
    {
        theta1 = (j)*2.0f*M_PI/(float)n - M_PI/2.0f;
        theta2 = (j+1)*2.0f*M_PI/(float)n - M_PI/2.0f;
        glBegin(GL_QUAD_STRIP);
        for (int i = 0; i < n; i++)
        {
            phi = i*2.0f*M_PI/(float)(n-1);
            Coords[0] = cosf(theta2)*cosf(phi);
            Coords[1] = sinf(theta2);
            Coords[2] = cosf(theta2)*sinf(phi);

            Coords[0]*=Rad;
            Coords[1]*=Rad;
            Coords[2]*=Rad;
            glVertex3f(Coords[0],Coords[1],Coords[2]);

            Coords[0] = cosf(theta1)*cosf(phi);
            Coords[1] = sinf(theta1);
            Coords[2] = cosf(theta1)*sinf(phi);

            Coords[0]*=Rad;
            Coords[1]*=Rad;
            Coords[2]*=Rad;
            glVertex3f(Coords[0],Coords[1],Coords[2]);
        }
        glEnd();
    }
}

void Scene3D::initCube()
{
    //передняя.............................
    Vertex[0][0] = -1;
    Vertex[0][1] = 0;
    Vertex[0][2] = 0;

    Vertex[1][0] = -1;
    Vertex[1][1] = 1;
    Vertex[1][2] = 0;

    Vertex[2][0] = 0;
    Vertex[2][1] = 1;
    Vertex[2][2] = 0;

    Vertex[3][0] = 0;
    Vertex[3][1] = 0;
    Vertex[3][2] = 0;
    //задняя................................
    Vertex[4][0] = -1;
    Vertex[4][1] = 0;
    Vertex[4][2] = 1;

    Vertex[5][0] = -1;
    Vertex[5][1] = 1;
    Vertex[5][2] = 1;

    Vertex[6][0] = 0;
    Vertex[6][1] = 1;
    Vertex[6][2] = 1;

    Vertex[7][0] = 0;
    Vertex[7][1] = 0;
    Vertex[7][2] = 1;
    //левая...................................
    Vertex[8][0] = -1;
    Vertex[8][1] = 0;
    Vertex[8][2] = 0;

    Vertex[9][0] = -1;
    Vertex[9][1] = 0;
    Vertex[9][2] = 1;

    Vertex[10][0] = -1;
    Vertex[10][1] = 1;
    Vertex[10][2] = 1;

    Vertex[11][0] = -1;
    Vertex[11][1] = 1;
    Vertex[11][2] = 0;
    //правая...........................
    Vertex[12][0] = 0;
    Vertex[12][1] = 0;
    Vertex[12][2] = 0;

    Vertex[13][0] = 0;
    Vertex[13][1] = 0;
    Vertex[13][2] = 1;

    Vertex[14][0] = 0;
    Vertex[14][1] = 1;
    Vertex[14][2] = 1;

    Vertex[15][0] = 0;
    Vertex[15][1] = 1;
    Vertex[15][2] = 0;
    //нижняя
    Vertex[16][0] = 0;
    Vertex[16][1] = 0;
    Vertex[16][2] = 0;

    Vertex[17][0] = 0;
    Vertex[17][1] = 0;
    Vertex[17][2] = 1;

    Vertex[18][0] = -1;
    Vertex[18][1] = 0;
    Vertex[18][2] = 1;

    Vertex[19][0] = -1;
    Vertex[19][1] = 0;
    Vertex[19][2] = 0;
    //верхняя
    Vertex[20][0] = 0;
    Vertex[20][1] = 1;
    Vertex[20][2] = 0;

    Vertex[21][0] = 0;
    Vertex[21][1] = 1;
    Vertex[21][2] = 1;

    Vertex[22][0] = -1;
    Vertex[22][1] = 1;
    Vertex[22][2] = 1;

    Vertex[23][0] = -1;
    Vertex[23][1] = 1;
    Vertex[23][2] = 0;
}

void Scene3D::drawCube()
{
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_COLOR_ARRAY);

    glVertexPointer(3, GL_DOUBLE, 0, Vertex);
    glColorPointer(3, GL_DOUBLE, 0, Colors);
    glDrawArrays(GL_QUADS, 0, 24);

    glDisableClientState(GL_COLOR_ARRAY);
    glDisableClientState(GL_VERTEX_ARRAY);

}

void Scene3D::drawAxis()
{
    glLineWidth(4);

    qglColor(Qt::red);
    glBegin(GL_LINES);
        glVertex3d(-1,0,0);
        glVertex3d(1,0,0);
    glEnd();

    qglColor(Qt::green);
    glBegin(GL_LINES);
        glVertex3d(0,-1,0);
        glVertex3d(0,1,0);
    glEnd();

    qglColor(Qt::blue);
    glBegin(GL_LINES);
        glVertex3d(0,0,-1);
        glVertex3d(0,0,1);
    glEnd();
}

void Scene3D::mousePressEvent(QMouseEvent *me)
{
    //mousePos = me->pos();
}

void Scene3D::mouseMoveEvent(QMouseEvent *me)
{
   /* xRot += 180/scale*(GLfloat)(me->y()-mousePos.y())/height();
    zRot += 180/scale*(GLfloat)(me->x()-mousePos.x())/width();

    mousePos = me->pos();

    updateGL();*/
}

void Scene3D::mouseReleaseEvent(QMouseEvent *me)
{

}

void Scene3D::wheelEvent(QWheelEvent *we)
{
    if(we->delta()<0) scale/=1.1;
    else if(we->delta()>0) scale*=1.1;

    updateGL();
}

void Scene3D::setColor()
{
    for(int i = 0;i<24;i++)
    {
        Colors[i][0]=0.1*(qrand()%11);
        Colors[i][1]=0.1*(qrand()%11);
        Colors[i][2]=0.1*(qrand()%11);
    }
}
