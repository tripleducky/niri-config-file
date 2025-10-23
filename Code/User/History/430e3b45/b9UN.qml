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

        Text {
            text: "󰕾" // Nerd Font placeholder - replace with correct icon
            color: "#999999"
            font.family: "Symbols Nerd Font" // Adjust font family as needed
            font.pixelSize: 16
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

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton

        onClicked: {
            if (sink && sink.audio) {
                sink.audio.muted = !sink.audio.muted;
            }
        }

        onWheel: function(wheel) {
            if (sink && sink.audio) {
                var delta = wheel.angleDelta.y / 120; // Standard wheel delta
                var newVolume = volume + (delta * 0.05); // Change by 5% per scroll step
                newVolume = Math.max(0, Math.min(1, newVolume)); // Clamp between 0 and 1
                sink.audio.volume = newVolume;
            }
        }
    }
}