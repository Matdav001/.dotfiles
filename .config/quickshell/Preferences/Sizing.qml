pragma Singleton
import QtQuick

QtObject {
    property double scale: 1

    readonly property int barSize: 40 * scale

    property int smallSize: 32 * scale
    property int mediumSize: smallSize * 1.5
    property int bigSize: smallSize * 2
    property int smallSpacing: 4 * scale
    property int mediumSpacing: smallSpacing * 1.5
    property int bigSpacing: smallSpacing * 2

    readonly property real radiusScale: scale
    readonly property real radius: 24 * radiusScale
    readonly property real mediumRadius: radius + 2 * smallSpacing
    readonly property real bigRadius: radius * 2 + 2 * smallSpacing
}
