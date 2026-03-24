import QtQuick
import qs.Components.Hover

Item {
	id: popupButton
	height: 32
	width: button.width

	property alias buttonText: button.buttonText
	property alias buttonIcon: button.buttonIcon
	property alias textSize: button.textSize
	property alias iconSize: button.iconSize

	property alias openPanel: hoverArea.openPanel

	SimpleButton {
		id: button
		PopupHover {
			id: hoverArea
			isButton: true
		}
	}
}
