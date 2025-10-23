import QtQuick
import QtQuick.Layouts
import Quickshell

PanelWindow {
    id: bar
    anchors {
        top: true
        left: true
        right: true
    }
    implicitHeight: 30
    color: "transparent"

    Rectangle {
        anchors.fill: parent
        color: "#222222"
        bottomLeftRadius: 0
        bottomRightRadius: 0
        // left
        RowLayout {
            anchors {
                left: parent.left
                leftMargin: 25
            }
            Loader { active: true; sourceComponent: Workspaces {} }
        }
        // center
        RowLayout {
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }

            Text {
                text: niri.focusedWindowTitle
                font.family: "Barlow Medium"
                font.pixelSize: 16
                color: "#999999"
            }
        }
        // right
        RowLayout {
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 25
            }
            spacing: 20
            Loader { active: true; sourceComponent: Systray { window: bar } }
            Loader { active: true; sourceComponent: Volume {} }
            Loader { active: true; sourceComponent: Power {} }
            Loader { active: true; sourceComponent: Time {} }
        }
    }
}
