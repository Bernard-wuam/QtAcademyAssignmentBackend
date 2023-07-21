import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtAcademyAssignment
import ButtonComponents

Rectangle{
    id:root
    color: "#0294C2"
    RowLayout{
        anchors.fill: parent
        Item {
            Layout.preferredWidth: 65
            Image {
                id: logoImage
                source: "../assets/svgIcon/logo.svg"
                sourceSize.width: parent.width
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            IconButton{
                iconSource: IconSvg.searchIcon
                iconColor: "#D9D9D9"
                height: 33
                width: height
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                iconImage.sourceSize.width: 20
            }
        }
        Item {
            Layout.preferredWidth: root.height
            Layout.fillHeight: true

            Image {
                id: profileImage
                height: parent.height
                width: height
                anchors.right: parent.right
                fillMode: Image.PreserveAspectCrop
                source: "../assets/profileImage/avator.jpg"
                layer.enabled: true
                layer.effect: OpacityMask{
                    maskSource: Rectangle{
                        width: profileImage.width
                        height: width
                        radius: width/2
                    }
                }
            }
        }
    }
}
