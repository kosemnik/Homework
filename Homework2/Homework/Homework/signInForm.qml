import QtQuick 2.0
import QtQuick.Window 2.13
import QtQuick.Controls 2.12

Item {
    width: parent.width
    height: parent.height
    anchors.fill: parent

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
        placeholderText: "password..."
        font.pixelSize: 20
        echoMode: TextInput.Password
        onTextChanged: buttonSignIn.regulateActivity()
    }



    Button {
        id: buttonSignIn
        text: qsTr("Sign in")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: textField2.bottom
        anchors.topMargin: 5
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

    BusyIndicator {
        id: busyIndicator
        running: image.status === Image.Loading
        visible: false
    }
}
