import qtQuick
import Quickshell
import Quickshell.Niri

PanelWindow {
    id:panel

    anchors {
        top: true
        left: true
        right :true
    }

    implicitHeight:40
    margins {
        top: 8
        left: 8
        right: 8

        Rectangle {
            id: bar
            anchors.fill: parent
            color: #1a1a1a
            radius: 0
        }
    }
}