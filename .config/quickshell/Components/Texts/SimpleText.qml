import QtQuick
import qs.Preferences

Text {
    id: simpleText
    visible: text.length > 0

    // Text positioning
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter

    // Renderer Settings
    renderType: Text.NativeRendering
    textFormat: Text.PlainText

    // Font Settings
    color: Colors.fontColor1
    font.family: Fonts.fontFamily
    font.pointSize: Sizing.smallSpacing + Sizing.bigSpacing
    font.weight: 500
}
