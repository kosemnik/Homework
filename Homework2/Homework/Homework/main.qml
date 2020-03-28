import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 300
    height: 480
    title: qsTr("My homework")

    Loader {
        id: loader
        anchors.fill: parent
        source: "signInForm.qml"
    }

    ClickableText {
        id: signIn
        text: qsTr("Sign in")
        anchors.right: slash.left
        anchors.rightMargin: 5
        font.underline: true
        MouseArea {
            anchors.fill: parent
            cursorShape: QT.PointingHandCursor
            onClicked: {
                loader.source = "signInForm.qml";
                signUp.font.underline = false;
                signIn.font.underline = true;
            }
        }
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
        MouseArea {
            anchors.fill: parent
            cursorShape: QT.PointingHandCursor
            onClicked: {
                loader.source = "signUpForm.qml";
                signIn.font.underline = false;
                signUp.font.underline = true;
            }
        }
    }
}
