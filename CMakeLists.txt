cmake_minimum_required(VERSION 3.13)

set(CMAKE_CXX_STANDARD 17)

#Find the module library
find_package(Qt5Widgets REQUIRED)
find_package(Qt5Quick REQUIRED)
find_package(Qt5Xml REQUIRED)
find_package(Qt5Qml REQUIRED)
find_package(Qt5QuickCompiler REQUIRED)

set(CMAKE_AUTOMOC ON)

project(Disciples_4)

set(SOURCE_EXE main.cpp)

include_directories(./src/include)
set(SOURCE ./src/include/base_player.h ./src/include/battle.h
    ./src/include/effect.h ./src/include/global_settings.h
    ./src/cpp/base_player.cpp ./src/cpp/battle.cpp
    ./src/cpp/effect.cpp ./src/cpp/global_settings.cpp)

qt5_add_resources(image_files image_files.qrc)
qt5_add_resources(main_files_qml ./src/qml/qml.qrc)
add_executable(Disciples ${SOURCE_EXE} ${SOURCE} ${image_files} ${main_files_qml})

target_link_libraries(Disciples Qt5::Widgets Qt5::Quick Qt5::Xml Qt5::Qml)
