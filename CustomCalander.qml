import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

ColumnLayout {
    id:calander
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: header.bottom
    anchors.topMargin: 45
    spacing: 5

    height: parent.height * .32
    DayOfWeekRow {
        locale: grid.locale
        Layout.fillWidth: true
        delegate: Text{
            text: model.shortName
            font.pixelSize: 20
            font.family: "sans-serif"
            font.weight: Font.Bold
        }
    }

    MonthGrid {
        id: grid
        month: datetextfield.month
        year: datetextfield.year
        locale: Qt.locale("en_US")
        Layout.fillWidth: true

        delegate:Item
        {
            width: 40
            height: 40
            opacity: model.month === grid.month ? 1 : 0
            Image{
                anchors.fill: parent
                source: "images/Rectangular.svg"
                fillMode: Image.PreserveAspectFit
                layer.enabled: true
                layer.effect: ColorOverlay{
                    color: mouse2.containsMouse ? "#00B428": "#D9D9D9"
                    Behavior on color {
                        ColorAnimation {
                            duration: 200
                        }
                    }
                }

                MouseArea{
                    id:mouse2
                    hoverEnabled: true
                    anchors.fill: parent
                    cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
                }
            }
            Text {
                anchors.fill: parent
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                opacity: model.month === grid.month ? 1 : 0
                text: model.day
                // font: control.font
            }//day number

            Rectangle{
                width: 8
                height: width
                radius: width/2
                visible:  model.day % 4 === 0 ? 1 : 0
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 8
                color: "green"

            }
        }
    }//grid
}//calenderColumn
