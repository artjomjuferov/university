#-------------------------------------------------
#
# Project created by QtCreator 2014-10-31T17:42:16
#
#-------------------------------------------------

QT       += core gui opengl

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = GL
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    scene3d.cpp \
    mythread.cpp

HEADERS  += mainwindow.h \
    scene3d.h \
    mythread.h

FORMS    += mainwindow.ui
