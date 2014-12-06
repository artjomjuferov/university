#ifndef SCENE3D_H
#define SCENE3D_H

#include <QGLWidget>
#include <QtGui>

class Scene3D : public QGLWidget
{
    Q_OBJECT

public:
    Scene3D(QWidget* parent = 0);


    QPoint mousePos;
    GLdouble xRot_c,xRot_t;
    GLdouble yRot_c,yRot_t;
    GLdouble zRot_c,zRot_t;
    GLdouble scale;
    GLdouble coef, coef1;
    GLdouble Vertex[24][3];
    GLdouble Vertex2[12][3];
    GLdouble Colors[24][3];

    void drawAxis();
    void drawCube();
    void initCube();
    void drawTetra();
    void initTetra();
    void drawSphere(float Rad);
    void setColor();

protected:
    void initializeGL();
    void resizeGL(int,int);
    void paintGL();
    void mousePressEvent(QMouseEvent* me);
    void mouseReleaseEvent(QMouseEvent* me);
    void mouseMoveEvent(QMouseEvent* me);
    void wheelEvent(QWheelEvent* we);

public slots:
    void change();
};

#endif // SCENE3D_H
