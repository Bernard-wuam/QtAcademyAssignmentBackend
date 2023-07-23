import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Item{
    id:root
    implicitHeight: 100
    implicitWidth: 100

    property int bottomValue:1
    property int topValue:60
    property alias topIndicatorImageIcon: upIndicator
    property alias downIndicatorImageIcon: downIndicator
    property alias displayRectangle: displayrect
    property alias text: displayrect.text
    property string iconColor: "#D9D9D9"
    property string iconHoveredColor: Qt.lighter(iconColor)
    property int iconColorHoverAnimationDuration: 100
    property string upIconSource: "svgIcon/UpIcon.svg"
    property string downIconSource: "svgIcon/DownIcon.svg"
    signal clicked()

    function increment(){
        let c = parseInt( displayrect.text)
        if(c >= topValue) return;
        c++;
        displayrect.text = c;
        root.clicked()
    }

    function decrement(){
        let c = parseInt( displayrect.text)
        if(c > bottomValue){
            c--;
            displayrect.text = c;
            root.clicked()
        }
    }

    TextField{
        id:displayrect
        implicitWidth: parent.width /1
        implicitHeight: parent.height /2
        validator: IntValidator{bottom: 1; top: 12;}
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: root.bottomValue
        anchors.centerIn: parent

        background: Rectangle{
            implicitWidth:   displayrect.width
           implicitHeight:  displayrect.height
            radius: displayrect.width/8
            color: "transparent"
            border.width: 1
            border.color: "#2F0000"

        }
    }

    Image {
        id:upIndicator
        source: root.upIconSource
        anchors.bottom: displayrect.top
        anchors.horizontalCenter: displayrect.horizontalCenter
        anchors.bottomMargin: 2
        sourceSize.width: root.height * .3
        MouseArea{
            id:mouse
            hoverEnabled: true
            anchors.fill: parent
            onClicked: root.increment()
            //containsMouse:
        }

        layer.enabled: true
        layer.effect: ColorOverlay{
            color:mouse.containsMouse ? root.iconHoveredColor : root.iconColor
            Behavior on color {

                ColorAnimation {
                    duration: root.iconColorHoverAnimationDuration
                }
            }
        }
    }

    Image {
        id:downIndicator
        source: root.downIconSource
        anchors.top: displayrect.bottom
        anchors.horizontalCenter: displayrect.horizontalCenter
        anchors.topMargin:  2
        sourceSize.width: root.height * .3
        MouseArea{
            id:mouse1
            hoverEnabled: true
            anchors.fill: parent
            onClicked: root.decrement()
            //containsMouse:
        }

        layer.enabled: true
        layer.effect: ColorOverlay{
            color: mouse1.containsMouse ? root.iconHoveredColor : root.iconColor
            Behavior on color {

                ColorAnimation {
                    duration: root.iconColorHoverAnimationDuration
                }
            }
        }
    }
}
