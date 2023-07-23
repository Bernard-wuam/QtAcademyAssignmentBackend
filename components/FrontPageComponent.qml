import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtAcademyAssignment
import ButtonComponents
import "./calendarComponents"

ColumnLayout{
    id:root
    spacing: 0
    Item{
        Layout.preferredHeight:  0.06 * mainPage.height
        Layout.fillWidth: true

        CalendarDateHeader{
            id:calendarDateHeader
            anchors.fill: parent
            onClicked: function(year,month,day){
                listview.toDoItemList = ToDoDataBase.getTodo(year,month,day)
            }
        }
    }
    Rectangle{
        Layout.fillWidth: true
        Layout.preferredHeight: 280
        color: "#0294C2"

        CustomCalendar{
            id:customCalendar
            anchors.fill: parent
            day: calendarDateHeader.day
            month: calendarDateHeader.month
            year: calendarDateHeader.year

            onClicked: function(year,month,day){
                calendarDateHeader.day = day
                listview.toDoItemList = ToDoDataBase.getTodo(year,month,day)
            }

        }
    }

    Item{
        Layout.fillWidth: true
        Layout.fillHeight: true

        Rectangle{
            anchors.fill: parent
            color: "#2968B2"
            radius: 10
            ListViewComponent{
                id:listview
                anchors.fill: parent
                anchors.margins: 10

                Component{
                    id: cp
                    FormPageComponent{
                        id:formpage
                        monthName:calendarDateHeader.monthName
                        day: calendarDateHeader.day
                        year: calendarDateHeader.year


                        onClicked:function(year,month,day){
                            listview.toDoItemList = ToDoDataBase.getTodo(year,month,day)
                        }
                    }
                }

                 onDisplaylistview:{
                    root.StackView.view.push(cp)
                }
            }
        }
    }

}
