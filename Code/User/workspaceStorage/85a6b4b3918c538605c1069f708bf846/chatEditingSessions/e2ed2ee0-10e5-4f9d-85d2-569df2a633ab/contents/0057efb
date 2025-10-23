import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
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
                id: mouseArea
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
                hoverEnabled: true

                onClicked: function(mouse) {
                    if (mouse.button === Qt.LeftButton) {
                        modelData.activate();
                    } else if (mouse.button === Qt.RightButton) {
                        if (modelData.menu) {
                            var window = mouseArea.Window.window;
                            if (window) {
                                modelData.display(window, mouseArea.mapToGlobal(0, mouseArea.height));
                            }
                        }
                    } else if (mouse.button === Qt.MiddleButton) {
                        modelData.secondaryActivate();
                    }
                }

                onWheel: function(wheel) {
                    modelData.scroll(wheel.angleDelta.y / 120, "vertical");
                }

                ToolTip.visible: containsMouse && (modelData.tooltip?.title !== undefined && modelData.tooltip?.title !== "")
                ToolTip.text: modelData.tooltip?.title ?? ""
            }
        }
    }
}
