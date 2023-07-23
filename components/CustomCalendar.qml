import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import ButtonComponents
import Qt5Compat.GraphicalEffects
import QtAcademyAssignment

ColumnLayout {
    id:root
    spacing: 7

    property int month
    property int day
    property int year

    signal clicked(int year,int month,int day)

    DayOfWeekRow {
        locale: grid.locale
        Layout.fillWidth: true
        //Layout.preferredHeight: 5
        delegate: Text{
            text: model.shortName
            font.pixelSize: 14
            font.family: "sans-serif"
            font.weight: Font.Bold
        }
    }

    MonthGrid {
        id: grid
        month: root.month
        year: root.year
        locale: Qt.locale("en_US")
        Layout.fillWidth: true

        delegate:Item
        {
            width: 30
            height: width
            opacity: model.month === grid.month ? 1 : .5
            IconButton{
                anchors.centerIn: parent
                iconSource: IconSvg.rectangleSmallIcon
                iconText.text: model.day
                iconText.opacity: model.month === grid.month ? 1 : .5
                enabled: model.month === grid.month ? true : false
                iconColor: model.day === root.day ? "#0294C2" : "lightgray"
                iconText.font.family: "italic"
                iconText.font.pixelSize: 14
                iconImage.sourceSize.width: 26

                onClicked: {
                    root.clicked(grid.year,grid.month,model.day)
                }

            }


            Rectangle{
                id:containsTodo
                width: 4
                height: width
                radius: width/2
                visible:  ToDoDataBase.containTodo(grid.year,grid.month,model.day) === true ? 1 : 0
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 7
                color: "green"

                Connections{
                    target: ToDoDataBase
                    function onEvaluateContaindo(year,month,day){
                        containsTodo.visible = ToDoDataBase.containTodo(grid.year,grid.month,model.day)
                    }
                }
            }
        }
    }//grid
}
