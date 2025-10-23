import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets

Rectangle {
    anchors.fill: parent
    radius: height / 2
    color: "#80000000"

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
                var sink = Pipewire.defaultAudioSink;
                if (!sink || !sink.audio) return Quickshell.iconPath("audio-volume-muted-symbolic");
                
                var volume = sink.audio.volume;
                var muted = sink.audio.muted;
                
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

                property real volumeLevel: {
                    var sink = Pipewire.defaultAudioSink;
                    return (sink && sink.audio) ? sink.audio.volume : 0;
                }
                
                implicitWidth: parent.width * volumeLevel
                radius: parent.radius
                color: "#4CAF50"
            }
        }

        Text {
            text: {
                var sink = Pipewire.defaultAudioSink;
                if (!sink || !sink.audio) return "0%";
                
                var volume = sink.audio.volume;
                return Math.round(volume * 100) + "%";
            }
            color: "#cccccc"
            font.family: "Barlow Medium"
            font.pixelSize: 13
        }
    }
}