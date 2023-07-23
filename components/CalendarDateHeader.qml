import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtAcademyAssignment
import ButtonComponents

Item{
    id:root

    property int month: new Date().getMonth()
    property int day : new Date().getDate()
    property int year : new Date().getFullYear()
    property string monthName: ['Jan','Feb','Mar','Apr','May','June','July','Aug','Sept','Oct','Nov','Dec'][root.month]
    signal clicked(int year,int month,int day)

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

                width: parent.width * .6
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
                                if(root.month > 0){
                                    root.month -= 1
                                    root.clicked(root.year,root.month,root.day)
                                }
                                else{
                                    root.month = 11
                                    root.year -= 1
                                    root.clicked(root.year,root.month,root.day)
                                }
                            }
                        }
                    }


                    Item{
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        Text {
                            id:currentDate
                            text: qsTr(root.day +", " + root.monthName + ", "+ root.year)
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
                            onClicked: {
                                if(root.month < 11){
                                    root.month += 1
                                    root.clicked(root.year,root.month,root.day)
                                }
                                else{
                                    root.month = 0
                                    root.year += 1
                                    root.clicked(root.year,root.month,root.day)
                                }

                            }
                        }
                    }
                }
            }
        }

    }
}
