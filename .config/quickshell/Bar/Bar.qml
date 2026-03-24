// Bar.qml
import Quickshell
import QtQuick
import qs.Components.Buttons
import qs.Components.Data
import qs.Components.Hover
import qs.Components.Popups
import qs.Preferences

Scope {
	// no more time object

	Variants {
		model: Quickshell.screens

		PanelWindow {
			id: panelWindow
			required property var modelData
			property bool test: false
			screen: modelData

			color: "transparent"
			anchors {
				top: true
				left: true
				right: true
			}
			implicitHeight: 40

			Rectangle {
				anchors.fill: parent
				color: Colors.background

				PopupHover {}
			}

			Rectangle {
				anchors.top: parent.bottom
				color: "red"
				width: 32
				height:32
			}
			Row {
				anchors.verticalCenter: parent.verticalCenter
				anchors.horizontalCenter: parent.horizontalCenter
				spacing: 4
				rightPadding: 4
				PopupButton {
					iconSize: 24
					buttonIcon: ""
				}
				PopupButton {
					iconSize: 14
					buttonIcon: "󰍬"
				}
				PopupButton {
					iconSize: 22
					buttonIcon: ""
				}
				PopupButton {
					buttonText: Time.time
				}
				PopupButton {
					buttonIcon: "󰣇"
				}
			}
			Row {
				anchors.verticalCenter: parent.verticalCenter
				anchors.left: parent.left
				spacing: 4
				leftPadding: 4
				PopupButton {
					iconSize: 24
					buttonIcon: ""
					openPanel: "Calendar.qml"
				}
				PopupButton {
					openPanel: "Calendar.qml"
					iconSize: 14
					buttonIcon: "󰍬"
				}
				PopupButton {
					iconSize: 22
					buttonIcon: ""
					openPanel: "Calendar.qml"
				}
				PopupButton {
					buttonText: Time.time
					openPanel: "Calendar.qml"
				}
				PopupButton {
					buttonIcon: "󰣇"
					openPanel: "Calendar.qml"
				}
			}
			Row {
				anchors.verticalCenter: parent.verticalCenter
				anchors.right: parent.right
				spacing: 4
				rightPadding: 4
				PopupButton {
					openPanel: "Calendar.qml"
					iconSize: 24
					buttonIcon: ""
				}
				PopupButton {
					openPanel: "Calendar.qml"
					iconSize: 14
					buttonIcon: "󰍬"
				}
				PopupButton {
					openPanel: "Calendar.qml"
					iconSize: 22
					buttonIcon: ""
				}
				PopupButton {
					openPanel: "Calendar.qml"
					buttonText: Time.time
				}
				PopupButton {
					openPanel: "Calendar.qml"
					buttonIcon: "󰣇"
				}
			}

			PopupController {}
		}
	}
}
