import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower

Rectangle {
    // Keep background transparent so it doesn't show a white box behind the text
    color: "transparent"
    Text {
        id: powerDisplay
        anchors {
            verticalCenter: parent.verticalCenter
        }
        text: "󰄌 " + Number(UPower.displayDevice.percentage * 100).toFixed(0) + "%"
        color: "#999999"
        font.family: "Barlow Medium"
        font.pixelSize: 16
    }

    // Bind the Rectangle size to the text content so layout spacing is correct
    implicitWidth: powerDisplay.contentWidth
    implicitHeight: powerDisplay.contentHeight
}
