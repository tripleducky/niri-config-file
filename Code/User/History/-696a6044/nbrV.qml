import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray

RowLayout {
    spacing: 8

    Repeater {
        model: SystemTray.items

        Item {
            required property SystemTrayItem modelData

            implicitWidth: 20
            implicitHeight: 20

            Image {
                anchors.fill: parent
                source: modelData.icon
                fillMode: Image.PreserveAspectFit
                smooth: true
            }

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

                onClicked: function(mouse) {
                    if (mouse.button === Qt.LeftButton) {
                        modelData.activate();
                    } else if (mouse.button === Qt.RightButton) {
                        modelData.menu.open();
                    } else if (mouse.button === Qt.MiddleButton) {
                        modelData.secondaryActivate();
                    }
                }

                onWheel: function(wheel) {
                    modelData.scroll(wheel.angleDelta.y / 120, "vertical");
                }
            }

            ToolTip {
                visible: parent.hovered
                text: modelData.tooltip?.title ?? ""
            }
        }
    }
}
