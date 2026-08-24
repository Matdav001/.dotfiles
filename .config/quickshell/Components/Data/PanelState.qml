pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    property int buttonHovered: 0
    property bool animationFinished: true
    property string openPanel: ""

    property bool panelOn: false
    property int panelX: 0
    property int panelY: 0
}
