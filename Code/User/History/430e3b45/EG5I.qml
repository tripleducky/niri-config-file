import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Rectangle {
    anchors.fill: parent
    radius: height / 2
    color: "#80000000"

    property var sink: Pipewire.defaultAudioSink
    property real volume: sink?.audio?.volume ?? 0
    property bool muted: sink?.audio?.muted ?? false

    RowLayout {
        anchors {
            fill: parent
            leftMargin: 10
            rightMargin: 15
        }
        spacing: 8

        IconImage {
            Layout.preferredWidth: 20
            Layout.preferredHeight: 20
            source: {
                if (muted || volume === 0) {
                    return Quickshell.iconPath("audio-volume-muted-symbolic");
                } else if (volume < 0.33) {
                    return Quickshell.iconPath("audio-volume-low-symbolic");
                } else if (volume < 0.67) {
                    return Quickshell.iconPath("audio-volume-medium-symbolic");
                } else {
                    return Quickshell.iconPath("audio-volume-high-symbolic");
                }
            }
        }

        Rectangle {
            // Stretches to fill all left-over space
            Layout.fillWidth: true
            Layout.preferredWidth: 80

            implicitHeight: 6
            radius: 3
            color: "#333333"

            Rectangle {
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }

                implicitWidth: parent.width * volume
                radius: parent.radius
                color: "#4CAF50"
            }
        }

        Text {
            text: Math.round(volume * 100) + "%"
            color: "#cccccc"
            font.family: "Barlow Medium"
            font.pixelSize: 13
        }
    }
}