#-------------------------------------------------
#
# Project created by QtCreator 2014-10-04T16:51:48
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = thirdTask
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    dialogchoice.cpp \
    Barriers/Barrier.cpp \
    Barriers/Guard.cpp \
    Barriers/Human.cpp \
    Barriers/MichalJakson.cpp \
    Heroes/Cat.cpp \
    Heroes/Dog.cpp \
    Heroes/Hero.cpp \
    Heroes/Rat.cpp \
    dialoggame.cpp

HEADERS  += mainwindow.h \
    dialogchoice.h \
    Barriers/Barrier.h \
    Barriers/Guard.h \
    Barriers/Human.h \
    Barriers/MichalJakson.h \
    Heroes/Cat.h \
    Heroes/Dog.h \
    Heroes/Hero.h \
    Heroes/Rat.h \
    libs.h \
    dialoggame.h

FORMS    += mainwindow.ui \
    dialogchoice.ui \
    dialoggame.ui

RESOURCES += \
    Images.qrc
