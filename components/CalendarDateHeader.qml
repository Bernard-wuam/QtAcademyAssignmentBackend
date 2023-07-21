import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtAcademyAssignment
import ButtonComponents

Item{
    id:root

    signal next()
    signal previous()

    property string monthName


    RowLayout{
        anchors.fill: parent
        Item{
            Layout.preferredWidth:  37
            Layout.fillHeight:  true

            IconButton{
                iconSource: IconSvg.backIcon
                iconColor: "#D9D9D9"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                iconImage.sourceSize.width: 12
            }
        }
        Item{
            Layout.preferredWidth:  37
            Layout.fillHeight:  true

            IconButton{
                iconSource: IconSvg.calendarIcon
                iconColor: "#D9D9D9"
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                iconImage.sourceSize.width: 27
            }
        }
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Item
            {
                id:calendarNavigationArrowContainer

                width: parent.width * .45
                height: parent.height

                RowLayout{
                    id:calendarNavigationArrow
                    anchors.fill: parent

                    Item{
                        Layout.preferredWidth: 16
                        Layout.fillHeight:  true

                        IconButton{
                            iconSource: IconSvg.backIcon
                            iconColor: "#D9D9D9"
                            anchors.left: parent.left
                            anchors.verticalCenter: parent.verticalCenter
                            iconImage.sourceSize.width: 10

                            onClicked: {
                                root.previous()
                            }
                        }
                    }


                    Item{
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        Text {
                            id:currentDate
                            text: qsTr(root.monthName + " , 2023")
                            anchors.centerIn: parent
                            font.pixelSize: 14
                            font.weight: Font.DemiBold
                            color: '#2F0000'
                        }
                    }

                    Item{
                        Layout.preferredWidth: 16
                        Layout.fillHeight:  true

                        IconButton{
                            iconSource: IconSvg.forwardIcon
                            iconColor: "#D9D9D9"
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            iconImage.sourceSize.width: 10
                            onClicked: root.next()
                        }
                    }
                }
            }
        }

    }
}
