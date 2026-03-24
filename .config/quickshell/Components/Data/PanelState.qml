// Time.qml
pragma Singleton

import Quickshell
import QtQuick

Singleton {
	id: root

	property int buttonHovered: 0
	property bool animationFinished : true
	property string openPanel : "Calendar.qml"

	property bool panelOn: false
	property int panelX: 0
	property int panelY: 0

	Timer {
		id: closeTimer
		interval: 100
		onTriggered: {
			root.panelOn = false
			root.buttonHovered = 0
		}
	}

	function stopClosing() { closeTimer.stop(); }
	function startClosing() { 
		if (buttonHovered == 0) {
			closeTimer.restart(); 
		}
	}
}
