import QtQuick 2.0

Text {
    id: clickableText
    anchors.bottomMargin: 10
    font.pixelSize: 15
    anchors.bottom: parent.bottom
    font.underline: false

    signal clicked();

    MouseArea {
        id: mouseClick
        enabled: !instance
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: clickableText.clicked();
    }
}
