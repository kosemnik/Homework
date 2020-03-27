import QtQuick 2.0
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Item {
    width: parent.width
    height: parent.height
    anchors.fill: parent

    Text {
        id: title
        text: qsTr("SIGN UP")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 5
        font.pixelSize: 25
    }

    TextField {
        id: textField3
        width: parent.width - 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.top: title.bottom
        anchors.topMargin: 5
        font.pointSize: 13
        placeholderText: "login"
        font.pixelSize: 20
        onTextChanged: buttonSignUp.regulateActivity()
    }


    TextField {
        id: textField4
        width: parent.width - 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.top: textField3.bottom
        anchors.topMargin: 5
        font.pointSize: 13
        placeholderText: "password"
        font.pixelSize: 20
        echoMode: TextInput.Password
        onTextChanged: buttonSignUp.regulateActivity()
    }


    TextField {
        id: textField5
        width: parent.width - 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.top: textField4.bottom
        anchors.topMargin: 5
        font.pointSize: 13
        placeholderText: "repeat password"
        font.pixelSize: 20
        echoMode: TextInput.Password
        onTextChanged: buttonSignUp.regulateActivity()
    }


    TextField {
        id: textField6
        width: parent.width - 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.top: textField5.bottom
        anchors.topMargin: 5
        font.pointSize: 13
        placeholderText: "nickname"
        font.pixelSize: 20
        onTextChanged: buttonSignUp.regulateActivity()
    }


    Button {
        id: buttonSignUp
        text: qsTr("Sign up")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: textField6.bottom
        anchors.topMargin: 5
        font.pixelSize: 15
        enabled: false
        onClicked: {
            busyIndicator.anchors.horizontalCenter = parent.horizontalCenter
            busyIndicator.anchors.top = buttonSignUp.bottom
            busyIndicator.anchors.topMargin = 10
            busyIndicator.visible = true
            if (textField4.text !== textField5.text)
            {
                wrongPassword.visible = true
                busyIndicator.visible = false
            }
            else
                wrongPassword.visible = false
        }

        function regulateActivity() {
            if (textField3.length > 5 && textField4.length > 5 && textField5.length > 5 && textField6.length > 5)
                enabled = true
            else
                enabled = false
        }
    }

    Text {
        id: wrongPassword
        text: qsTr("Password values aren't same!")
        font.pixelSize: 20
        color: "Red"
        visible: false
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: buttonSignUp.bottom
        anchors.topMargin: 5
    }

    BusyIndicator {
        id: busyIndicator
        running: image.status === Image.Loading
        visible: false
    }
}
