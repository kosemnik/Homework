import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 300
    height: 480
    title: qsTr("My homework")

    Text {
        id: title
        text: qsTr("SIGN IN")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 5
        font.pixelSize: 25
    }

    TextField {
        id: textField1
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - 20
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 5
        anchors.top: title.bottom
        visible: true
        placeholderText: "login..."
        font.pixelSize: 20
        onTextChanged: buttonSignIn.regulateActivity()
    }

    TextField {
        id: textField2
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - 20
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 5
        anchors.top: textField1.bottom
        visible: true
        placeholderText: "password..."
        font.pixelSize: 20
        echoMode: TextInput.Password
        onTextChanged: buttonSignIn.regulateActivity()
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
        visible: false
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
        visible: false
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
        visible: false
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
        visible: false
        placeholderText: "nickname"
        font.pixelSize: 20
        onTextChanged: buttonSignUp.regulateActivity()
    }

    Text {
        id: signIn
        text: qsTr("Sign in")
        anchors.bottom: parent.bottom
        anchors.right: slash.left
        anchors.rightMargin: 5
        anchors.bottomMargin: 10
        font.pixelSize: 15
        MouseArea {
            anchors.fill: parent
            cursorShape: QT.PointingHandCursor
            onClicked: {
                title.text = "SIGN IN"
                textField1.visible = true
                textField1.text = qsTr("")
                textField2.visible = true
                textField2.text = qsTr("")
                buttonSignIn.visible = true
                textField3.visible = false
                textField4.visible = false
                textField5.visible = false
                textField6.visible = false
                buttonSignUp.visible = false
                busyIndicator.visible = false

                bottomBorder1.visible = true
                bottomBorder2.visible = false
                wrongPassword.visible = false
            }
        }

        Rectangle {
            id: bottomBorder1
            color: "black"
            height: 1
            width: parent.width
            anchors.top: parent.bottom
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

    Text {
        id: signUp
        text: qsTr("Sign up")
        anchors.bottom: parent.bottom
        anchors.left: slash.right
        anchors.leftMargin: 5
        anchors.bottomMargin: 10
        font.pixelSize: 15
        MouseArea {
            anchors.fill: parent
            cursorShape: QT.PointingHandCursor
            onClicked: {
                title.text = "SIGN UP"
                textField1.visible = false
                textField2.visible = false
                buttonSignIn.visible = false
                textField3.visible = true
                textField3.text = qsTr("")
                textField4.visible = true
                textField4.text = qsTr("")
                textField5.visible = true
                textField5.text = qsTr("")
                textField6.visible = true
                textField6.text = qsTr("")
                buttonSignUp.visible = true
                busyIndicator.visible = false

                bottomBorder1.visible = false
                bottomBorder2.visible = true
            }
        }

        Rectangle {
            id: bottomBorder2
            color: "black"
            height: 1
            width: parent.width
            visible: false
            anchors.top: parent.bottom
        }
    }

    BusyIndicator {
        id: busyIndicator
        running: image.status === Image.Loading
        visible: false
    }

    Button {
        id: buttonSignIn
        text: qsTr("Sign in")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: textField2.bottom
        anchors.topMargin: 5
        visible: true
        font.pixelSize: 15
        enabled: false
        onClicked: {
            busyIndicator.anchors.horizontalCenter = parent.horizontalCenter
            busyIndicator.anchors.top = buttonSignIn.bottom
            busyIndicator.anchors.topMargin = 10
            busyIndicator.visible = true
        }

        function regulateActivity() {
            if (textField1.length > 5 && textField2.length > 5)
                enabled = true
            else
                enabled = false
        }
    }

    Button {
        id: buttonSignUp
        text: qsTr("Sign up")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: textField6.bottom
        anchors.topMargin: 5
        visible: false
        font.pixelSize: 15
        enabled: false
        onClicked: {
            busyIndicator.anchors.horizontalCenter = parent.horizontalCenter
            busyIndicator.anchors.top = buttonSignUp.bottom
            busyIndicator.anchors.topMargin = 10
            busyIndicator.visible = true
            if (textField4.text != textField5.text)
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
}
