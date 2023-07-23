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
    property string monthName
    property  int day
    property int year
    signal clicked(int year,int month,int day)
    Item{
        Layout.preferredHeight:  0.08 * parent.height
        Layout.fillWidth: true

        CalendarDateHeader{
            id:calendarDateHeader
            anchors.fill: parent
            monthName: root.monthName
            day: root.day
            year:root.year
        }
    }

    Item{
        Layout.fillWidth: true
        Layout.fillHeight: true

        Rectangle{
            anchors.fill: parent
            radius: 10
            color: "#2968B2"

            ColumnLayout{
                anchors.fill: parent
                Item{
                    Layout.preferredHeight: parent.height *  .09
                    Layout.fillWidth: true

                    TextField{
                        id:title
                        anchors.fill: parent
                        anchors.margins: 6
                        placeholderText: "Title"
                         wrapMode: TextField.WrapAnywhere
                        verticalAlignment: Text.AlignVCenter
                        background: Rectangle{
                            radius: 10
                        }
                    }
                }
                Item{
                    Layout.preferredHeight: parent.height *  .2
                    Layout.fillWidth: true

                    TextArea{
                        id:description
                        anchors.fill: parent
                        anchors.margins: 6
                        placeholderText: "Description"
                        wrapMode: TextField.WrapAnywhere
                        verticalAlignment: Text.AlignVCenter

                        background: Rectangle{
                            radius: 10
                        }
                    }


                }
                Rectangle{
                    color: "#2968B2"
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Rectangle{
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.margins: 6
                        height: parent.height * .5


                        color: "transparent"
                        border.width: 1
                        radius: 10
                        border.color: "#2F0000"

                        Rectangle{
                            id:timeContainer
                            height: 130
                            width: 180
                            anchors.centerIn: parent
                            color: "transparent"
                            border.width: 1
                            border.color: "#2F0000"
                            radius: 10

                            Rectangle{
                                id:rect
                               anchors.top: parent.top
                               anchors.horizontalCenter: parent.horizontalCenter
                               anchors.topMargin: -height/2
                                color: "#2968B2"
                                width: 60
                                height: 20
                                CheckBox{
                                    id:isTimed
                                    text: "Time"
                                    anchors.centerIn: parent
                                }
                            }

                            ColumnLayout{
                                anchors.fill: parent
                                anchors.margins: 5
                                Item{
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    RowLayout{
                                        id:starTime
                                        anchors.fill: parent

                                        Text {
                                            text: qsTr("Start Time")
                                        }

                                        Item{
                                            Layout.preferredHeight: 40
                                            Layout.preferredWidth:  70
                                            RowLayout{
                                                anchors.fill: parent
                                                spacing: 4
                                                IconComboBox{
                                                    id:startTimeHour
                                                    Layout.fillHeight: true
                                                    Layout.preferredWidth: 26
                                                    topValue: 12
                                                    bottomValue: 1
                                                }
                                                Text {
                                                    text: qsTr(":")
                                                    font.weight: Font.ExtraBold
                                                    font.pixelSize: 18
                                                }

                                                IconComboBox{
                                                    id:startTimeMinutes
                                                    Layout.fillHeight: true
                                                    Layout.preferredWidth: 26
                                                    topValue: 59
                                                }

                                                Text {
                                                    text: qsTr("pm")
                                                    font.weight: Font.Medium
                                                    font.pixelSize: 16
                                                }
                                            }
                                        }
                                    }//startTime

                                }//startTimeContainer

                                Item{
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true
                                    RowLayout{
                                        id:endTime
                                        anchors.fill: parent
                                        Text {
                                            text: qsTr("End Time")
                                        }

                                        Item{
                                            Layout.preferredHeight: 40
                                            Layout.preferredWidth:  70
                                            RowLayout{
                                                anchors.fill: parent
                                                spacing: 4
                                                IconComboBox{
                                                    id:endTimeHour
                                                    Layout.fillHeight: true
                                                    Layout.preferredWidth: 26
                                                    topValue: 12
                                                    bottomValue: 1
                                                }
                                                Text {
                                                    text: qsTr(":")
                                                    font.weight: Font.ExtraBold
                                                    font.pixelSize: 18
                                                }

                                                IconComboBox{
                                                    id:endTimeMinutes
                                                    Layout.fillHeight: true
                                                    Layout.preferredWidth: 26

                                                }

                                                Text {
                                                    text: qsTr("pm")
                                                    font.weight: Font.Medium
                                                    font.pixelSize: 16
                                                }
                                            }
                                        }
                                    }//endTime

                                }//endTimeContainer
                            }
                        }//timeContainer

                    }//sectionMain..



                    IconButton{
                        width: 100
                        height: 60
                        iconImage.sourceSize.width: 100
                        iconSource: IconSvg.rectangleLargeIcon
                        iconColor: "#D9D9D9"

                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 100
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        iconText.text: "save"

                        onClicked: {
                            let starthourtime = parseInt(startTimeHour.text)
                            let startminutetime = parseInt(startTimeMinutes.text)


                            let endhourtime = parseInt(endTimeHour.text)
                            let endminutetime = parseInt(endTimeMinutes.text)
                            console.log(starthourtime,startminutetime)
                            console.log(endhourtime,endminutetime)

                            let monAlias = ['Jan','Feb','Mar','Apr','May','June','July','Aug','Sept','Oct','Nov','Dec']
                            let u = monAlias.indexOf(root.monthName);
                            let year = root.year
                            console.log(year)

//                            add(int year, int month, int day, QString title,
//                                                   QString description, bool isTime, int hour, int minute)
                            ToDoDataBase.add(year,u,root.day,title.text,description.text,1,startTimeHour,startTimeMinutes)
                            root.clicked(year,u,root.day)
                            root.StackView.view.pop()
                        }
                    }
                }
            }

        }
    }

}

