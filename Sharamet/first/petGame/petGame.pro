#-------------------------------------------------
#
# Project created by QtCreator 2014-09-11T08:13:12
#
#-------------------------------------------------

QT       += core

QT       -= gui

TARGET = petGame
CONFIG   += console
CONFIG   -= app_bundle

TEMPLATE = app


SOURCES += main.cpp \
    Barriers/Barrier.cpp \
    Barriers/Guard.cpp \
    Barriers/Human.cpp \
    Barriers/MichalJakson.cpp \
    Heroes/Cat.cpp \
    Heroes/Dog.cpp \
    Heroes/Hero.cpp \
    Heroes/Rat.cpp

HEADERS += \
    main.h \
    Barriers/Barrier.h \
    Barriers/Guard.h \
    Barriers/Human.h \
    Barriers/MichalJakson.h \
    Heroes/Cat.h \
    Heroes/Dog.h \
    Heroes/Hero.h \
    Heroes/Rat.h \
    libs.h
