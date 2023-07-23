import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtAcademyAssignment
import ButtonComponents
import "./components/calendarComponents"
import "./components"



Window {
    width: 300
    height: 600
    visible: true
    title: qsTr("Hello World")
    x:890
    y:30

    Page{
        id:mainPage
        width: 290
        height: 600

        header: Header{
            id:headerBackground
            width: mainPage.width
            height: mainPage.height * .08
        }

        contentItem: Rectangle{
            color: "#0294C2"

            StackView{
                id:frontPageComponent
                anchors.fill: parent
                initialItem: FrontPageComponent{}
            }
        }

        //color: "#0294C2"
    }


}
