QMAKE_CXXFLAGS += -std=c++11

TEMPLATE = app

QT += qml quick widgets
QT += xml
QT += testlib

SOURCES += main.cpp \
    global_settings.cpp \
    base_player.cpp \
    battle.cpp \
    effect.cpp

RESOURCES += qml.qrc \
    image_files.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    global_settings.h \
    base_player.h \
    battle.h \
    effect.h
