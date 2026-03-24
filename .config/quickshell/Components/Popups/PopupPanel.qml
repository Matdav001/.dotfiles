import QtQuick
import QtQuick.Window
import QtQuick.Shapes
import qs.Preferences
import qs.Components.CmpAnim
import qs.Components.Hover
import qs.Components.Data

// --- 1. THE GLUED SHAPE DRAWING ---
Shape {
	id: wrapper
	property bool isLoaded: false

	property real windowX: 0
	property real windowWidth: 0

	height: contentArea.height + Sizing.bigRadius * 1 + Sizing.radius * 0.5
	width: contentArea.width + Sizing.bigRadius * 2 + Sizing.radius

	default property alias content: contentArea.data

	readonly property real leftFactor: Math.min(windowX / Sizing.radius, 1.0)
    readonly property real rightFactor: Math.min((Screen.width - (windowX + windowWidth)) / Sizing.radius, 1.0)

	//default property alias data: contentArea.data
	property real rightWallAnim1: isAtRightWall ? 0 : 1

	onRightFactorChanged: {
		console.log(Screen.width, (windowX + windowWidth), rightFactor)
	}

// Calculate the FINAL width before the animation even starts
	readonly property real targetWidth: contentArea.childrenRect.width + Sizing.bigRadius * 2 + Sizing.radius

// Check if the window WILL be at the wall based on its spawn position and final size
	readonly property bool isAtLeftWall: (windowX <= 1) // Simple X check
	readonly property bool isAtRightWall: (windowX + targetWidth) >= (Screen.width - 1)

	layer.enabled: true
	layer.samples: 4

	anchors.top: parent.top
	transformOrigin: isAtRightWall ? Item.TopRight : (isAtLeftWall ? Item.TopLeft : Item.Top)

	ShapePath {
		id: root

		readonly property bool flatten: contentArea.width < Sizing.bigRadius * 2
		readonly property real radiusX: flatten ? contentArea.width / 2 : Sizing.bigRadius
		fillColor: Colors.background
		strokeWidth: -1
		strokeColor: "red"

		// Start at the Top-Left, but shifted left to start the "glue"
		startX: 0
		startY: 0

		// Top Edge
		PathLine {
			x: wrapper.width
			y: 0
		}

		// Right "Glue" (Inverted Corner)
		PathArc {
			x: wrapper.width - radiusX * wrapper.rightWallAnim1
			y: Sizing.bigRadius * wrapper.rightWallAnim1
			radiusX: Math.min(Sizing.bigRadius, wrapper.width)
			radiusY: Sizing.bigRadius
			direction: PathArc.Counterclockwise
		}

		// Right side down
		PathLine {
			x: wrapper.width - Sizing.bigRadius * wrapper.rightWallAnim1
			y: wrapper.height - Sizing.bigRadius * 2 * wrapper.rightWallAnim1
		}

		// Bottom Right (Normal Corner)
		PathArc {
			relativeX: -Sizing.bigRadius
			y: wrapper.height - Sizing.bigRadius
			radiusX: Math.min(Sizing.bigRadius, wrapper.width)
			radiusY: Sizing.bigRadius
			direction: wrapper.rightWallAnim1 < 0.5 ? PathArc.Counterclockwise : PathArc.Clockwise
		}

		// Bottom Edge
		PathLine {
			x: Sizing.bigRadius * 3 - Sizing.bigRadius * wrapper.rightWallAnim1
			y: wrapper.height - Sizing.bigRadius
		}

		// Bottom Left (Normal Corner)
		PathArc {
			x: Sizing.bigRadius * 2 - Sizing.bigRadius * wrapper.rightWallAnim1
			relativeY: -Sizing.bigRadius
			radiusX: Math.min(Sizing.bigRadius, wrapper.width)
			radiusY: Sizing.bigRadius
			direction: PathArc.Clockwise
		}

		PathLine {
			x: Sizing.bigRadius * 2 - Sizing.bigRadius * wrapper.rightWallAnim1
			y: Sizing.bigRadius
		}

		PathArc {
			x: Sizing.bigRadius - Sizing.bigRadius * wrapper.rightWallAnim1
			y: 0
			radiusX: Math.min(Sizing.bigRadius, wrapper.width)
			radiusY: Sizing.bigRadius
			direction: PathArc.Counterclockwise
		}

		Behavior on fillColor {
			Anim { }
		}
	}

	Behavior on rightWallAnim1 {
		enabled: wrapper.isLoaded  // Only animate AFTER the first run
		Anim { }
	}

	// This container holds the "other components" you want to put inside
	Item {
		id: contentArea
		x: Sizing.bigRadius * (wrapper.isAtRightWall ? 2 : 1) + Sizing.radius * 0.5
		width: childrenRect.width
		height: childrenRect.height

		Behavior on x {
			Anim { }
		}
	}

	PopupHover {}

	state: "hidden"

	Binding {
		target: wrapper
		property: "state"
		value: "hidden"
		when: !PanelState.panelOn
	}

	states: [
		State { name: "visible"; PropertyChanges { target: panel; scale: 1 } },
		State { name: "hidden"; PropertyChanges { target: panel; scale: 0 } }
	]

	transitions: [
		Transition {
			from: "hidden"; to: "visible"
			SequentialAnimation {
				Anim { property: "scale" }
			}
		},
		Transition {
			from: "visible"; to: "hidden"
			SequentialAnimation {
				// 1. Run the animation
				Anim { property: "scale" }

				// 2. Run your code/set variable immediately after
				ScriptAction {
					script: {
						PanelState.animationFinished = true;
					}
				}
			}
		}
	]

	Component.onCompleted: {
		if (PanelState.panelOn) {
			state = "visible"
			PanelState.animationFinished = false
		}
	}

	Timer {
		id: layoutSettlingTimer
		interval: 1 // A tiny delay allows the width to calculate from 0 -> Actual
		running: true
		repeat: false
		onTriggered: wrapper.isLoaded = true
	}
}
