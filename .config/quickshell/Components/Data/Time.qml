pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    // an expression can be broken across multiple lines using {}
    readonly property string time: Qt.formatDateTime(clock.date, "hh:mm")

    readonly property string timeVertical: time.replace(":", "\n")
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
