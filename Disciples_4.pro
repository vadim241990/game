QMAKE_CXXFLAGS += -std=c++11

TEMPLATE = app

QT += qml quick widgets
QT += xml
QT += testlib

SOURCES_DIR_CPP = src/cpp
SOURCES_DIR_INCLUDE = src/include
SOURCES_DIR_QML = src/qml

SOURCES += $${SOURCES_DIR_CPP}/main.cpp \
    $${SOURCES_DIR_CPP}/global_settings.cpp \
    $${SOURCES_DIR_CPP}/base_player.cpp \
    $${SOURCES_DIR_CPP}/battle.cpp \
    $${SOURCES_DIR_CPP}/effect.cpp

RESOURCES += $${SOURCES_DIR_QML}/qml.qrc \
    image_files.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    $${SOURCES_DIR_INCLUDE}/global_settings.h \
    $${SOURCES_DIR_INCLUDE}/base_player.h \
    $${SOURCES_DIR_INCLUDE}/battle.h \
    $${SOURCES_DIR_INCLUDE}/effect.h
