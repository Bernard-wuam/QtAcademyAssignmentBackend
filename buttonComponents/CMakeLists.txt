qt_add_library(buttonComponents STATIC)
set_source_files_properties(IconSvg.qml PROPERTIES   QT_QML_SINGLETON_TYPE TRUE)
qt_add_qml_module(
buttonComponents
URI ButtonComponents
VERSION 1.0.0

RESOURCES
svgIcon/RectangleLargeIcon.svg
svgIcon/RectangleSmallIcon.svg
svgIcon/CalendarIcon.svg
svgIcon/SearchIcon.svg
svgIcon/ForwardIcon.svg
svgIcon/BackIcon.svg
svgIcon/AlarmIcon.svg
svgIcon/PlusIcon.svg
svgIcon/UpIcon.svg
svgIcon/DownIcon.svg

QML_FILES
IconButton.qml
IconSvg.qml
IconComboBox.qml

)


