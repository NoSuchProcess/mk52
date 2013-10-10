#-------------------------------------------------
#
# Project created by QtCreator 2013-10-09T17:26:36
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = qmk52
TEMPLATE = app


SOURCES += main.cpp\
        dialog.cpp \
    ik13.cpp

HEADERS  += dialog.h \
    mk52roms.h \
    ik13.h

FORMS    += dialog.ui
