import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtAcademyAssignment
import ButtonComponents
import "./components/calendarComponents"
import "./components"



Window {
    width: 445
    height: 640
    visible: true
    title: qsTr("Hello World")


    Page{
        id:mainPage
        width: 290
        height: 650

        header: Header{
            id:headerBackground
            width: mainPage.width
            height: mainPage.height * .08
        }

        contentItem: Rectangle{
            color: "#0294C2"
            ColumnLayout{
                anchors.fill: parent
                spacing: 0
                Item{
                    Layout.preferredHeight:  0.06 * mainPage.height
                    Layout.fillWidth: true

                    CalendarDateHeader{
                        id:calendarDateHeader
                        anchors.fill: parent
                        onNext: customCalendar.next()
                        onPrevious: customCalendar.previous()
                        monthName: customCalendar.monthName
                    }
                }
                Rectangle{
                    Layout.fillWidth: true
                    Layout.preferredHeight: 280
                    color: "red"

                    CustomCalendar{
                        id:customCalendar
                        anchors.fill: parent
                    }
                }

                Item{
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Rectangle{
                        anchors.fill: parent
                        color: "#2968B2"

                        ListViewComponent{
                            anchors.fill: parent
                            anchors.margins: 10
                        }
                    }
                }

            }
        }

        //color: "#0294C2"
    }


}
