import QtQuick
import QtQuick.Controls
import qs.Preferences
import qs.Components.Texts

Button {
	id: simpleButton
	height: 32
	padding: 0

	property alias buttonText: buttonText.text
	property alias buttonIcon: buttonIcon.text
	property alias textSize: buttonText.font.pointSize
	property alias iconSize: buttonIcon.font.pointSize
	property color colorEnabled : Colors.buttonEnabled
	property color colorPressed : Colors.buttonPressed
	property color colorHovered : Colors.buttonHovered
	property color colorDisabled : Colors.buttonDisabled

	background: Rectangle {
		color: simpleButton.down ? simpleButton.colorPressed : (
			simpleButton.hovered ? simpleButton.colorHovered : 
			simpleButton.colorEnabled
		)
		radius: parent.height
	}
	contentItem: Row{
		id: rowText
		spacing: 8
		leftPadding: buttonText.text.length > 0 ? 12 : 0
		rightPadding: buttonText.text.length > 0 ? 12 : 0

		SimpleText {
			topPadding: 2
			id: buttonIcon
			width: (buttonText.text.length > 0) ? 20 : 32
			font.pointSize: 24
			anchors.verticalCenter: parent.verticalCenter
		}
		SimpleText {
			topPadding: 2
			id: buttonText
			anchors.verticalCenter: parent.verticalCenter
		}
	}
}
