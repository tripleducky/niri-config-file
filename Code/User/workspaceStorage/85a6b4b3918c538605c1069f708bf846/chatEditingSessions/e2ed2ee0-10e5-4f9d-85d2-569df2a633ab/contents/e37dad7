import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Rectangle {
    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    property var sink: Pipewire.defaultAudioSink
    property real volume: sink?.audio?.volume ?? 0
    property bool muted: sink?.audio?.muted ?? false

    RowLayout {
        id: volumeLayout
        anchors {
            verticalCenter: parent.verticalCenter
        }
        spacing: 6

        IconImage {
            Layout.preferredWidth: 16
            Layout.preferredHeight: 16
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

        Text {
            text: {
                var vol = Number(volume);
                if (isNaN(vol) || !isFinite(vol)) {
                    return "0%";
                }
                return Math.round(vol * 100) + "%";
            }
            color: "#999999"
            font.family: "Barlow Medium"
            font.pixelSize: 16
        }

        Component.onCompleted: {
            parent.width = volumeLayout.implicitWidth
        }
    }
}