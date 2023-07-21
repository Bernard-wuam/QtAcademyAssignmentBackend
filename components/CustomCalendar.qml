import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import ButtonComponents
import Qt5Compat.GraphicalEffects


ColumnLayout {
    id:calander
    spacing: 7
    property alias month: grid.month
    property alias year: grid.year
    property string monthName: ['Jan','Feb','Mar','Apr','May','June','July','Aug','Sept','Oct','Nov','Dec'][grid.month]

    function next(){
        console.log("next")
        if(grid.month < 11){
            grid.month += 1
        }
        else{
            grid.month = 0
        }
    }

    function previous(){
        if(grid.month > 0){
            grid.month -= 1
        }
        else{
            grid.month = 11
        }
    }

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
        month: 6
        year: 2023
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
                iconColor: "lightgray"
                iconText.font.family: "italic"
                iconText.font.pixelSize: 14
                iconImage.sourceSize.width: 26

                onClicked: console.log("something just happen...")

            }


            Rectangle{
                width: 4
                height: width
                radius: width/2
                visible:  model.day % 4 === 0 ? 1 : 0
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 7
                color: "green"

            }
        }
    }//grid
}
