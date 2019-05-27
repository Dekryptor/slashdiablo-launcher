import QtQuick 2.12
import QtQuick.Controls 2.5

Button {
    id: defaultButton
    property var colorUp: "#f0681f"
    property var colorDown: "#f57b25"

    contentItem: Text {
        color: "#ffffff"
        text: parent.text
        font.family: d2Font.name
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        color: defaultButton.down ? colorDown : colorUp
    }
}
