// Bar.qml
import Quickshell
import Quickshell.Widgets
import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.Components.Buttons
import qs.Components.Data
import qs.Components.Popups
import qs.Modules
import qs.Preferences

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: panelWindow
            required property var modelData
            screen: modelData

            color: "transparent"
            anchors {
                top: General.barPosition !== General.Position.Bottom
                left: General.barPosition !== General.Position.Right
                right: General.barPosition !== General.Position.Left
                bottom: General.barPosition !== General.Position.Top
            }
            implicitHeight: (General.barPosition === General.Position.Bottom || General.barPosition === General.Position.Top) ? Sizing.smallSize : 0
            implicitWidth: (General.barPosition === General.Position.Right || General.barPosition === General.Position.Left) ? Sizing.smallSize : 0
            margins {
                top: General.barBottom ? 0 : 8
                left: General.barRight ? 0 : 8
                right: General.barLeft ? 0 : 8
                bottom: General.barTop ? 0 : 8
            }

            WrapperRectangle {
                opacity: 0.9
                color: Colors.surface
                margin: 3
                radius: 120
                border.width: 1
                border.color: Colors.surfaceContainerLow
                Grid {
                    id: topLeftGrid
                    columns: General.isVertical ? 1 : -1
                    rows: General.isVertical ? -1 : 1
                    spacing: 4

                    Repeater {
                        id: workspaces
                        readonly property int currentWs: Hyprland.focusedWorkspace?.id ?? 1
                        model: 10
                        Button {
                            background: Rectangle {
                                color: "transparent"
                                radius: parent.height
                            }
                            onClicked: Hyprland.dispatch("workspace " + (modelData + 1))
                            width: height
                            height: 24
                            Rectangle {
                                height: 24
                                width: height
                                radius: height / 2
                                anchors.centerIn: parent
                                color: modelData + 1 === workspaces.currentWs ? Colors.primary : parent.hovered ? Colors.surfaceContainerLow : Colors.surfaceContainer
                                Rectangle {
                                    property var ws: Hyprland.workspaces.values.find(w => w.id === modelData + 1)
                                    visible: ws ? ws.toplevels.values?.length > 0 : false
                                    height: 8
                                    width: height
                                    radius: height / 2
                                    anchors.centerIn: parent
                                    color: modelData + 1 === workspaces.currentWs ? Colors.surface : Colors.primary
                                }
                            }
                        }
                    }
                }
            }

            // Center: Active Window
            ClippingWrapperRectangle {
                opacity: 0.9
                color: Colors.surface
                margin: 4
                radius: 120
                anchors.centerIn: parent
                visible: centerGrid.visible

                Grid {
                    id: centerGrid
                    columns: General.isVertical ? 1 : -1
                    rows: General.isVertical ? -1 : 1
                    spacing: 4

                    Repeater {
                        model: Hyprland.focusedWorkspace.toplevels
                        visible: Hyprland.focusedWorkspace.toplevels.values?.length > 0
                        Image {
                            visible: entry
                            property var entry: DesktopEntries.heuristicLookup(modelData.wayland?.appId)

                            source: Quickshell.iconPath(entry?.icon)
                            width: height
                            height: 24
                            fillMode: Image.PreserveAspectFit
                        }
                    }
                }
            }

            // Bottom Right: System Settings
            ClippingWrapperRectangle {
                opacity: 0.9
                color: Colors.surface
                margin: 2
                radius: 120
                anchors.bottom: parent.bottom
                anchors.right: parent.right

                Grid {
                    id: bottomRightGrid
                    columns: General.isVertical ? 1 : -1
                    rows: General.isVertical ? -1 : 1
                    spacing: 4

                    Button {
                        text: "󰃭"
                        onClicked: PanelState.openPanel = PanelState.openPanel ? "" : "Calendar.qml"
                    }
                }
                Popup {
                    open: true
                    alignment: Qt.AlignTop | Qt.AlignRight
                    StartMenu {}
                }
            }
        }
    }
}
