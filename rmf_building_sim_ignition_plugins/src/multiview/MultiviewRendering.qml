import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2


Window {
    title: qsTr("Multi-view display")
    id: twobytwo
    x: 100
    y: 100
    readonly property int defaultWidth: 1600
    readonly property int defaultHeight: 900
    width: defaultWidth
    height: defaultHeight
    minimumWidth: 640
    minimumHeight: 360
    visible: true

    Shortcut {
    sequence: "Ctrl+F"
    onActivated: showFullScreen()
    }

    Shortcut {
        sequence: "Esc"
        onActivated: show()
    }

    Connections {
      target: multiview
      function onNewFrontImage() {
        front.reload();
      }
    }

    Connections {
      target: multiview
      function onNewLeftImage() {
        left.reload();
      }
    }

    Connections {
      target: multiview
      function onNewRightImage() {
        right.reload();
      }
    }

    Connections {
      target: multiview
      function onNewTopImage() {
        top.reload();
      }
    }

    GridLayout {
        anchors.fill: parent
        columns: 2
        rows: 2
        columnSpacing: 0
        rowSpacing: 0

        Image {
            id: front
            fillMode: Image.PreserveAspectFit
            Layout.column: 0
            Layout.row: 0
            Layout.fillWidth: true
            Layout.fillHeight: true
            function reload() {
              source = "image://front_view/" + Math.random().toString(36).substr(2, 5);
            }
        }

        Image {
            id: left
            fillMode: Image.PreserveAspectFit
            Layout.column: 0
            Layout.row: 1
            Layout.fillWidth: true
            Layout.fillHeight: true
            function reload() {
              source = "image://left_view/" + Math.random().toString(36).substr(2, 5);
            }
        }

        Image {
            id: right
            fillMode: Image.PreserveAspectFit
            Layout.column: 1
            Layout.row: 0
            Layout.fillWidth: true
            Layout.fillHeight: true
            function reload() {
              source = "image://right_view/" + Math.random().toString(36).substr(2, 5);
            }
        }

        Image {
            id: top
            fillMode: Image.PreserveAspectFit
            Layout.column: 1
            Layout.row: 1
            Layout.fillWidth: true
            Layout.fillHeight: true
            function reload() {
              source = "image://top_view/" + Math.random().toString(36).substr(2, 5);
            }
        }
    }
}