pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import qs.Preferences
import QtQuick.Effects

Button {
    id: simpleButton
    padding: 0

    enum ColorVariant {
        Elevated,
        Filled,
        Tonal,
        Outlined,
        Text
    }
    enum SizeVariant {
        XS,
        SM,
        MD,
        LG,
        XL,
        XXL,
        XXXL
    }
    enum ShapeVariant {
        Square,
        Round
    }

    property real widthScale: 1.0

    implicitWidth: (contentItem.implicitWidth + leftPadding + rightPadding) * widthScale

    Behavior on widthScale {
        NumberAnimation {
            duration: 150
            easing.type: Easing.OutQuad
        }
    }
    property bool vertical: false
    property string iconText: ""
    property int color: SimpleButton.ColorVariant.Filled
    property int size: SimpleButton.SizeVariant.MD
    property int shape: SimpleButton.ShapeVariant.Round

    readonly property var colorMetrics: ({
            [SimpleButton.ColorVariant.Elevated]: {
                bg: Colors.surfaceContainerLow,
                bgUnSelected: Colors.surfaceContainerLow,
                bgSelected: Colors.primary,
                text: Colors.primary,
                textUnSelected: Colors.primary,
                textSelected: Colors.primaryOn,
                state: Colors.primary,
                stateUnSelected: Colors.primary,
                stateSelected: Colors.primaryOn
            },
            [SimpleButton.ColorVariant.Filled]: {
                bg: Colors.primary,
                bgUnSelected: Colors.surfaceContainer,
                bgSelected: Colors.primary,
                text: Colors.primaryOn,
                textUnSelected: Colors.surfaceVariantOn,
                textSelected: Colors.primaryOn,
                state: Colors.primaryOn,
                stateUnSelected: Colors.surfaceVariantOn,
                stateSelected: Colors.primaryOn
            },
            [SimpleButton.ColorVariant.Tonal]: {
                bg: Colors.secondaryContainer,
                bgUnSelected: Colors.secondaryContainer,
                bgSelected: Colors.secondary,
                text: Colors.secondaryContainerOn,
                textUnSelected: Colors.secondaryContainerOn,
                textSelected: Colors.secondaryOn,
                state: Colors.secondaryContainerOn,
                stateUnSelected: Colors.secondaryContainerOn,
                stateSelected: Colors.secondaryOn
            },
            [SimpleButton.ColorVariant.Outlined]: {
                bg: "transparent",
                bgUnSelected: "transparent",
                bgSelected: Colors.inverseSurface,
                text: Colors.surfaceVariantOn,
                textUnSelected: Colors.surfaceVariantOn,
                textSelected: Colors.inverseSurfaceOn,
                state: Colors.surfaceVariantOn,
                stateUnSelected: Colors.surfaceVariantOn,
                stateSelected: Colors.inverseSurfaceOn
            },
            [SimpleButton.ColorVariant.Text]: {
                bg: "transparent",
                bgUnSelected: "transparent",
                bgSelected: "transparent",
                text: Colors.primary,
                textUnSelected: Colors.primary,
                textSelected: Colors.primary,
                state: Colors.primary,
                stateUnSelected: Colors.primary,
                stateSelected: Colors.primary
            }
        })[color] || {
        text: Colors.primaryOn,
        textSelected: Colors.primaryOn,
        textUnSelected: Colors.surfaceVariantOn,
        bg: Colors.primary,
        bgSelected: Colors.primary,
        bgUnSelected: Colors.surfaceContainer,
        bgState: Colors.primaryOn
    }

    readonly property var sizeMetrics: ({
            [SimpleButton.SizeVariant.XS]: {
                height: 24,
                paddingH: 8,
                fontSize: 8,
                downRadius: 4,
                radius: 8,
                spacing: 4
            },
            [SimpleButton.SizeVariant.SM]: {
                height: 32,
                paddingH: 12,
                fontSize: 12,
                downRadius: 8,
                radius: 12,
                spacing: 4
            },
            [SimpleButton.SizeVariant.MD]: {
                height: 40,
                paddingH: 16,
                fontSize: 14,
                downRadius: 8,
                radius: 12,
                spacing: 8
            },
            [SimpleButton.SizeVariant.LG]: {
                height: 48,
                paddingH: 20,
                fontSize: 14,
                downRadius: 10,
                radius: 14,
                spacing: 8
            },
            [SimpleButton.SizeVariant.XL]: {
                height: 56,
                paddingH: 24,
                fontSize: 16,
                downRadius: 12,
                radius: 16,
                spacing: 8
            },
            [SimpleButton.SizeVariant.XXL]: {
                height: 96,
                paddingH: 48,
                fontSize: 24,
                downRadius: 16,
                radius: 28,
                spacing: 12
            },
            [SimpleButton.SizeVariant.XXXL]: {
                height: 136,
                paddingH: 64,
                fontSize: 32,
                downRadius: 16,
                radius: 28,
                spacing: 16
            }
        })[size] || {
        height: 40,
        paddingH: 16,
        fontSize: 14,
        radius: 6
    }

    implicitHeight: sizeMetrics.height
    leftPadding: sizeMetrics.paddingH
    rightPadding: sizeMetrics.paddingH

    background: Rectangle {
        id: bgRect
        border.width: simpleButton.color === SimpleButton.ColorVariant.Outlined && !simpleButton.checked ? 1 : 0
        border.color: Colors.outlineVariant
        color: "transparent"
        radius: simpleButton.shape === SimpleButton.ShapeVariant.Round ? simpleButton.down ? simpleButton.sizeMetrics.downRadius : (simpleButton.checked ? simpleButton.sizeMetrics.radius : (simpleButton.height / 2)) : simpleButton.down ? simpleButton.sizeMetrics.downRadius : (simpleButton.checked ? (simpleButton.height / 2) : simpleButton.sizeMetrics.radius)
        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            color: simpleButton.enabled ? (simpleButton.checkable ? (simpleButton.checked | simpleButton.down ? simpleButton.colorMetrics.bgSelected : simpleButton.colorMetrics.bgUnSelected) : simpleButton.colorMetrics.bg) : Colors.surfaceOn
            opacity: simpleButton.enabled ? 1 : 0.1

            // Smooth state transition
            Behavior on opacity {
                enabled: !simpleButton.pressed
                NumberAnimation {
                    duration: 100
                }
            }
            Behavior on color {
                ColorAnimation {
                    duration: 150                // Time in milliseconds
                    easing.type: Easing.InOutQuad // Smooth acceleration/deceleration
                }
            }
        }
        Behavior on radius {
            NumberAnimation {
                duration: 100
            }
        }

        Rectangle {
            anchors.fill: parent
            radius: parent.radius
            visible: simpleButton.enabled
            color: simpleButton.checkable ? (simpleButton.checked ? simpleButton.colorMetrics.stateSelected : simpleButton.colorMetrics.stateUnSelected) : simpleButton.colorMetrics.state
            opacity: simpleButton.down ? 0.1 : (simpleButton.hovered ? 0.08 : 0.0)

            // Smooth state transition
            Behavior on opacity {
                enabled: !simpleButton.pressed
                NumberAnimation {
                    duration: 100
                }
            }
        }
    }

    MultiEffect {
        visible: simpleButton.color === SimpleButton.ColorVariant.Elevated && simpleButton.enabled
        anchors.fill: bgRect
        source: bgRect

        // Enable Shadow Properties
        shadowEnabled: true
        shadowColor: Colors.darkTheme ? "#FF000000" : "#40000000"
        shadowBlur: 0.5          // Blur softness (0.0 - 1.0)
        shadowHorizontalOffset: 0
        shadowVerticalOffset: 3  // Push shadow downward
    }

    contentItem: Item {
        implicitWidth: contentRow.implicitWidth
        implicitHeight: contentRow.implicitHeight

        Row {
            id: contentRow
            anchors.centerIn: parent
            spacing: simpleButton.sizeMetrics.spacing

            Text {
                text: simpleButton.iconText
                font.pixelSize: simpleButton.sizeMetrics.fontSize * 2
                font.family: Fonts.fontFamily
                font.weight: 650
                opacity: simpleButton.enabled ? 1 : 0.38
                color: simpleButton.enabled ? (simpleButton.checkable ? (simpleButton.checked | simpleButton.down ? simpleButton.colorMetrics.textSelected : simpleButton.colorMetrics.textUnSelected) : simpleButton.colorMetrics.text) : Colors.surfaceOn
                visible: simpleButton.iconText !== ""
                anchors.verticalCenter: parent.verticalCenter

                Behavior on opacity {
                    enabled: !simpleButton.pressed
                    NumberAnimation {
                        duration: 100
                    }
                }
                Behavior on color {
                    ColorAnimation {
                        duration: 150
                        easing.type: Easing.InOutQuad
                    }
                }
            }

            Text {
                text: simpleButton.text
                font.pixelSize: simpleButton.sizeMetrics.fontSize
                font.family: Fonts.fontFamily
                font.weight: 650
                opacity: simpleButton.enabled ? 1 : 0.38
                color: simpleButton.enabled ? (simpleButton.checkable ? (simpleButton.checked | simpleButton.down ? simpleButton.colorMetrics.textSelected : simpleButton.colorMetrics.textUnSelected) : simpleButton.colorMetrics.text) : Colors.surfaceOn
                visible: simpleButton.text !== ""
                anchors.verticalCenter: parent.verticalCenter

                Behavior on opacity {
                    enabled: !simpleButton.pressed
                    NumberAnimation {
                        duration: 100
                    }
                }
                Behavior on color {
                    ColorAnimation {
                        duration: 150
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }
    }
}
