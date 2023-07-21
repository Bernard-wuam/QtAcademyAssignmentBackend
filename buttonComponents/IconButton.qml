import QtQuick 2.15
import Qt5Compat.GraphicalEffects

Item{
    id:root
    signal clicked
    property string  iconSource: "svgIcon/RectangleSmallIcon.svg"
    property string iconColor: "red"
    property string iconHoveredColor: Qt.lighter(iconColor)
    property int iconColorHoverAnimationDuration: 100
    property alias iconImage: img
    property alias iconText : iconText
    property int textMargin: 0

    implicitHeight: img.sourceSize.height
    implicitWidth:  img.sourceSize.width

    Image {
        id:img
        source: Qt.resolvedUrl(root.iconSource)
        sourceSize.width: 100
        anchors.centerIn: parent
        layer.enabled: true
        layer.effect: ColorOverlay{
            color: mouse.containsMouse ? root.iconHoveredColor : root.iconColor
            Behavior on color {

                ColorAnimation {
                    duration: iconColorHoverAnimationDuration
                }
            }
        }

        MouseArea{
            id:mouse
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor

            onClicked: root.clicked()
        }
    }

    Item{
        anchors.fill: img
        anchors.margins: root.textMargin

        clip:true

        Text {
            anchors.centerIn: parent
            id: iconText
            text: qsTr("")
            color: "black"
        }
    }
}
