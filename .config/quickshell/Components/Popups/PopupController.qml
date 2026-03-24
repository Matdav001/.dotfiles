import QtQuick
import Quickshell
import qs.Components.Data
import qs.Components.CmpAnim
import QtQuick.Window
import qs.Preferences

pragma ComponentBehavior: Bound

Scope {
	id: root

	LazyLoader {
		id: popupLoader
		activeAsync: PanelState.panelOn || ! PanelState.animationFinished

		PanelWindow {
			id: popup
			exclusiveZone: 0
			anchors.top: true
			anchors.left: true
			anchors.bottom: false
			anchors.right: false
			margins.left: Math.max(0, Math.min(PanelState.panelX - (width / 2), Screen.width - width))

			implicitWidth: panel.width
			implicitHeight: panel.height
			color: "transparent"
			
			Behavior on margins.left {
				enabled: panel.content.width > 0
				Anim {}
			}
			
			PopupPanel {
				id: panel
				windowX: popup.margins.left
        		windowWidth: popup.width
				Loader {
					source: PanelState.openPanel
					id: content
				}
			}
		}
	}
}
