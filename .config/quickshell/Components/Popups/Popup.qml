pragma ComponentBehavior: Bound
import QtQuick
import Quickshell
import Quickshell.Widgets
import qs.Components.Data
import QtQuick.Window
import qs.Preferences

PanelWindow {
    id: boundingWindow

    implicitWidth: wrapper.width
    implicitHeight: wrapper.height

    default property alias contentData: wrapper.data
    property int alignment: Qt.AlignTop | Qt.AlignLeft
    property bool open: false

    anchors {
        top: (boundingWindow.alignment & Qt.AlignTop) !== 0
        bottom: (boundingWindow.alignment & Qt.AlignBottom) !== 0
        left: (boundingWindow.alignment & Qt.AlignLeft) !== 0
        right: (boundingWindow.alignment & Qt.AlignRight) !== 0
    }

    margins {
        top: 8
        left: 8
        right: 8
        bottom: 8
    }

    color: "transparent"
    exclusiveZone: 0
    visible: open

    ClippingWrapperRectangle {
        id: wrapper
        color: Colors.surface
        opacity: 1
        margin: 12
        radius: 32
    }
}
