import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 300
    height: 480
    id: window
    title: qsTr("My homework")
    property int form: 0

    Loader {
        id: loader
        anchors.fill: parent
        source: (form == 0) ? "signInForm.qml" : "signUpForm.qml"
    }

    ClickableText {
        id: signIn
        text: qsTr("Sign in")
        anchors.right: slash.left
        anchors.rightMargin: 5
        font.underline: (form == 0) ? true : false
        onClicked: form = 0
    }

    Text {
        id: slash
        text: qsTr("/")
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 10
        font.pixelSize: 15
    }

    ClickableText {
        id: signUp
        text: qsTr("Sign up")
        anchors.left: slash.right
        anchors.leftMargin: 5
        font.underline: (form == 0) ? false : true
        onClicked: form = 1
    }
}
