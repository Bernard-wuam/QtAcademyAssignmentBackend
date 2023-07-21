import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtAcademyAssignment
import ButtonComponents

ListView{
    id:ls
    clip: true
    spacing:1

    model:TodoModel{
        id:model
    }

    delegate: Item{
        width: ls.width
        height: 76
        IconButton{
            anchors.fill: parent
            iconColor: "#D9D9D9"
            iconSource:  IconSvg.rectangleLargeIcon
            iconImage.sourceSize.width: parent.height * 3.6
        }

        RowLayout{
            anchors.fill: parent
            anchors.topMargin: 7
            anchors.bottomMargin: 7
            Item{
                Layout.preferredWidth: parent.width * .8
                Layout.fillHeight: true

                ColumnLayout{
                    anchors.fill: parent
                    spacing: 0
                    Item{
                        Layout.preferredHeight: parent.height * .3
                        Layout.fillWidth: true

                        Text {
                            id:title
                            anchors.fill: parent
                            anchors.margins: 4
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: qsTr(model.title)
                             color: "#2F0000"
                            font.pixelSize: 11
                            font.weight: Font.Thin
                            elide: Text.ElideRight
                        }
                    }
                    Item{
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        Text {
                            id:description
                            anchors.fill: parent
                            topPadding: 0
                            leftPadding: 5
                            rightPadding: 5
                            maximumLineCount: 3
                            elide: Text.ElideRight
                             color: "#2F0000"
                            lineHeight: .8
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.WrapAnywhere
                            text: qsTr(model.description)
                            font.pixelSize: 12
                            font.weight: Font.Medium

                        }
                    }
                }

            }
            Item{
                Layout.fillHeight: true
                Layout.fillWidth: true

                ColumnLayout{
                    anchors.fill: parent
                    spacing: 1
                    Item{
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        IconButton{
                            anchors.fill: parent
                            iconColor: "#2F0000"
                            iconSource:  IconSvg.alarmIcon
                            iconImage.sourceSize.width: parent.height * .7
                        }
                    }
                    Item{
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        Text {
                            anchors.centerIn: parent
                            text: qsTr(model.startTime)
                            font.pixelSize: 10
                            color: "#2F0000"
                        }
                    }
                    Item{
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        Text {
                            anchors.centerIn: parent
                            text: qsTr("30min\nElapased")
                            color: "#2F0000"
                            font.pixelSize: 8
                            lineHeight: .7
                        }
                    }
                }

            }
        }

    }

    Rectangle{
        width: 30
        height: width
        radius: width
        border.width: 1
        border.color: "#2F0000"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 10
        color: "#D9D9D9"
        MouseArea{
            id:mouser
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor

            onClicked: console.log("add to listview")
        }
        IconButton{
            anchors.centerIn: parent
            iconSource: IconSvg.plusIcon
            iconImage.sourceSize.width: 20
            iconColor: "#2968B2"
            onClicked: console.log("add to listview")
        }
    }
}
