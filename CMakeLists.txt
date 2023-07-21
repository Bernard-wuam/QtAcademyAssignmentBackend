cmake_minimum_required(VERSION 3.16)

project(QtAcademyAssignment VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appQtAcademyAssignment
    main.cpp
)

qt_add_qml_module(appQtAcademyAssignment
    URI QtAcademyAssignment
    VERSION 1.0
    QML_FILES
    Main.qml
    components/calendarComponents/Mycalendar.qml
    components/Header.qml
    components/CalendarDateHeader.qml
    components/CustomCalendar.qml
    components/ListViewComponent.qml
    components/FrontPageComponent.qml

    RESOURCES
    assets/svgIcon/logo.svg
    assets/profileImage/avator.jpg

    SOURCES
    todomodel.cpp
    todomodel.h
)

add_subdirectory(buttonComponents/)

set_target_properties(appQtAcademyAssignment PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQtAcademyAssignment
    PRIVATE Qt6::Quick buttonComponentsplugin
)

install(TARGETS appQtAcademyAssignment
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
