import QtQuick
import qs.Components.Data

HoverHandler {
	id: root

	property bool isButton: false
	property string openPanel: ""

	onHoveredChanged: {
		if (hovered) {
			PanelState.stopClosing()

			if (isButton) {
				PanelState.buttonHovered++

				PanelState.openPanel = openPanel
				var globalPos = root.parent.mapToGlobal(0, 0);
				PanelState.panelX = globalPos.x + root.parent.width/2;
				PanelState.panelY = globalPos.y + root.parent.height;

				PanelState.panelOn = true 
			}	// Logic to close/hide the component

		} else {
			if (isButton){
				PanelState.buttonHovered--
			}
			PanelState.startClosing()

		}
	}
}
