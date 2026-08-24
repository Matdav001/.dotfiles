pragma Singleton
import QtQuick
import qs.Preferences

QtObject {
    enum Position {
        Left,
        Right,
        Top,
        Bottom
    }
    property int barPosition: General.Position.Top

    property int barLeft: barPosition === General.Position.Left
    property int barRight: barPosition === General.Position.Right
    property int barTop: barPosition === General.Position.Top
    property int barBottom: barPosition === General.Position.Bottom

    property bool isVertical: barPosition === General.Position.Left || barPosition === General.Position.Right
    // corners
    property bool showCorners: true
    property bool topLeftCorner: true
    property bool topRightCorner: true
    property bool bottomLeftCorner: true
    property bool bottomRightCorner: true
    property int border: Sizing.bigSpacing
}
