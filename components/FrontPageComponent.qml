import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtAcademyAssignment
import ButtonComponents
import "./calendarComponents"

ColumnLayout{
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
