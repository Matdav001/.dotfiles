pragma Singleton
import QtQuick

QtObject {
	// Font
	readonly property color fontColor1: "#D2D2D2"
	readonly property color fontColor2: "#AAAAAA"
	readonly property color fontColor3: "#666666"

	// Menus
	readonly property color background: "#CC141414"
	readonly property color card: "#323232"

	// Buttons
	readonly property color buttonEnabled: "transparent"
	readonly property color buttonDisabled: "transparent"
	readonly property color buttonHovered: "#22D2D2D2"
	readonly property color buttonFocused: "transparent"
	readonly property color buttonPressed: "#33D2D2D2"

	property color error: "#FFCCCC" 
	property color errorText: "#601414" 
	property color success: "#CCFFCC"
	property color successText: "#146014"
}
