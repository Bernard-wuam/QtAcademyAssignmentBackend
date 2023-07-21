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
    width: 445
    height: 640
    visible: true
    title: qsTr("Hello World")


    Page{
        id:mainPage
        width: 290
        height: 650

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
