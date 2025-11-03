cmake_minimum_required(VERSION 3.16)
project(todoro LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(todoro
        src/main.cpp
)

set_target_properties(todoro PROPERTIES OUTPUT_NAME todoro_app)

qt_add_qml_module(todoro
        URI todoro
        VERSION 1.0
        QML_FILES
            qml/main.qml
)

target_link_libraries(todoro
        PRIVATE Qt6::Quick Qt6::Qml
)