import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import qs.Components.Texts
import qs.Preferences

pragma ComponentBehavior: Bound

Scope {
	id: root
	property bool failed;
	property string errorString;

	// Connect to the Quickshell global to listen for the reload signals.
	Connections {
		target: Quickshell

		function onReloadCompleted() {
			Quickshell.inhibitReloadPopup();
			root.failed = false;
			popupLoader.active = true;
		}

		function onReloadFailed(error: string) {
			Quickshell.inhibitReloadPopup();
			// Close any existing popup before making a new one.
			popupLoader.active = false;

			root.failed = true;
			root.errorString = error;
			popupLoader.active = true;
		}
	}

	// Keep the popup in a loader because it isn't needed most of the time
	LazyLoader {
		id: popupLoader

		PanelWindow {
			id: popup

			exclusiveZone: 0
			anchors.top: true
			margins.top: 8

			implicitWidth: rect.width + 2
			implicitHeight: rect.height + 2

			WlrLayershell.namespace: "quickshell:reloadPopup"

			// color blending is a bit odd as detailed in the type reference.
			color: "transparent"

			Rectangle {
				id: rect
				anchors.centerIn: parent
				color: root.failed ?  Colors.error : Colors.success

				implicitHeight: layout.implicitHeight + 30
				implicitWidth: layout.implicitWidth + 30
				radius: 12

				// Fills the whole area of the rectangle, making any clicks go to it,
				// which dismiss the popup.
				MouseArea {
					id: mouseArea
					anchors.fill: parent
					onPressed: {
						popupLoader.active = false
					}

					// makes the mouse area track mouse hovering, so the hide animation
					// can be paused when hovering.
					hoverEnabled: true
				}

				ColumnLayout {
					id: layout
					spacing: 10
					anchors {
						top: parent.top
						topMargin: 10
						horizontalCenter: parent.horizontalCenter
					}

					SimpleText {
						font.pointSize: 14
						text: root.failed ? "Quickshell: Reload failed" : "Quickshell reloaded"
						color: root.failed ? Colors.errorText : Colors.successText
					}

					SimpleText {
						font.pointSize: 11
						horizontalAlignment: Text.AlignLeft
						text: root.errorString
						color: root.failed ? Colors.errorText : Colors.successText
						// When visible is false, it also takes up no space.
						visible: root.errorString != ""
					}
				}

				// A progress bar on the bottom of the screen, showing how long until the
				// popup is removed.
				Rectangle {
					z: 2
					id: bar
					color: root.failed ? Colors.errorText : Colors.successText
					anchors.bottom: parent.bottom
					anchors.left: parent.left
					anchors.margins: 10
					height: 5
					radius: 9999

					PropertyAnimation {
						id: anim
						target: bar
						property: "width"
						from: rect.width - bar.anchors.margins * 2
						to: 0
						duration: root.failed ? 10000 : 1000
						onFinished: popupLoader.active = false

						// Pause the animation when the mouse is hovering over the popup,
						// so it stays onscreen while reading. This updates reactively
						// when the mouse moves on and off the popup.
						paused: mouseArea.containsMouse
					}
				}
				// Its bg
				Rectangle {
					z: 1
					id: bar_bg
					color: root.failed ? "#30af1b25" : "#4027643e"
					anchors.bottom: parent.bottom
					anchors.left: parent.left
					anchors.margins: 10
					height: 5
					radius: 9999
					width: rect.width - bar.anchors.margins * 2
				}

				// We could set `running: true` inside the animation, but the width of the
				// rectangle might not be calculated yet, due to the layout.
				// In the `Component.onCompleted` event handler, all of the component's
				// properties and children have been initialized.
				Component.onCompleted: anim.start()
			}

		}
	}
}
