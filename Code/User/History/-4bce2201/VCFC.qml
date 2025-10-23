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
            border.color "#333333"
            border.width: 3

            row{
                id: workspacesRow

                anchors {
                    left.parent.left
                    verticalCenter: parent.verticalCenter
                    leftMagrin: 16
                }
                spacing: 8
            }
        }
    }
}