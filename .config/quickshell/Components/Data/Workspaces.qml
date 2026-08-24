pragma Singleton
import QtQuick
import Quickshell

Singleton {
    id: root
    property var workspaces: ["1", "2", "3", "4", "5"]
    property int activeWorkspace: 0
}
