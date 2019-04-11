cmake_minimum_required(VERSION 3.12)

set(CMAKE_CXX_STANDARD 17)

project(DisciplesTest)

#Find the module library
find_package(Qt5Widgets REQUIRED)
find_package(Qt5Xml REQUIRED)

#For Qt need enabled this flag
set(CMAKE_AUTOMOC ON)

enable_testing()

add_subdirectory(googletest)

include_directories( ../src/include )

set(Headers ../src/include/global_settings.h    ../src/include/battle.h     ../src/include/base_player.h    ../src/include/effect.h )
set(Sources ../src/cpp/global_settings.cpp      ../src/cpp/battle.cpp       ../src/cpp/base_player.cpp      ../src/cpp/effect.cpp       main.cpp)

add_library(Gtest STATIC IMPORTED)

add_executable(DisciplesTest ${Headers} ${Sources})
target_link_libraries(DisciplesTest PUBLIC gtest_main Qt5::Widgets Qt5::Xml)
