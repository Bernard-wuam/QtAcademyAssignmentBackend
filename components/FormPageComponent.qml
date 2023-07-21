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
        Layout.preferredHeight:  0.06 * parent.height
        Layout.fillWidth: true

        CalendarDateHeader{
            id:calendarDateHeader
            anchors.fill: parent
            onNext: customCalendar.next()
            onPrevious: customCalendar.previous()
            //monthName: customCalendar.monthName
        }
    }

    Item{
        Layout.fillWidth: true
        Layout.fillHeight: true

        Rectangle{
            anchors.fill: parent
            anchors.margins: 15
            radius: 10
            color: "#2968B2"

        }
    }

}

