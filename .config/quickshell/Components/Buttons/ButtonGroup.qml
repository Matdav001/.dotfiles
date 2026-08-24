pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls

Control {
    id: root

    property var model: []
    property int maxColumns: 0
    property int maxRows: 0

    property int buttonColor: SimpleButton.ColorVariant.Filled
    property int buttonSize: SimpleButton.SizeVariant.MD
    property int buttonShape: SimpleButton.ShapeVariant.Round

    property bool exclusive: true
    property bool checkable: true
    property int selectedIndex: -1
    property var selectedValue: null

    property int pressedIndex: -1
    property bool fillWidth: true

    signal buttonClicked(int index, var value, bool buttonState)

    ButtonGroup {
        id: qtButtonGroup
        exclusive: root.exclusive
        onClicked: button => {
            root.buttonClicked(button.buttonIndex, button.buttonValue, button.checked);
        }
    }

    readonly property int totalCount: root.model ? root.model.length : 0
    readonly property int effectiveColumns: root.maxColumns > 0 ? root.maxColumns : Math.max(1, totalCount)
    readonly property int effectiveRows: Math.ceil(totalCount / effectiveColumns)

    contentItem: Column {
        spacing: root.spacing

        Repeater {
            model: root.effectiveRows

            Row {
                id: rowLayout
                required property int index
                readonly property int rowIndex: index
                spacing: root.spacing

                readonly property int rowStart: rowIndex * root.effectiveColumns
                readonly property int rowItemCount: Math.min(root.effectiveColumns, root.totalCount - rowStart)

                Repeater {
                    model: rowLayout.rowItemCount

                    SimpleButton {
                        id: btn
                        required property int index
                        readonly property int globalIndex: rowLayout.rowStart + index

                        readonly property var modelItem: root.model[globalIndex]
                        readonly property bool isObject: typeof modelItem === "object" && modelItem !== null

                        property int buttonIndex: globalIndex
                        property var buttonValue: isObject && modelItem.value !== undefined ? modelItem.value : globalIndex
                        property var buttonData: modelItem

                        text: isObject ? (modelItem.text || "") : String(modelItem)
                        iconText: isObject && modelItem.iconText ? modelItem.iconText : ""
                        color: isObject && modelItem.color !== undefined ? modelItem.color : root.buttonColor
                        size: isObject && modelItem.size !== undefined ? modelItem.size : root.buttonSize
                        shape: isObject && modelItem.shape !== undefined ? modelItem.shape : root.buttonShape
                        enabled: isObject && modelItem.enabled !== undefined ? modelItem.enabled : root.enabled

                        checkable: root.checkable
                        checked: root.selectedIndex === globalIndex || (isObject && modelItem.checked === true)
                        implicitWidth: 72 * widthScale

                        ButtonGroup.group: root.checkable ? qtButtonGroup : null

                        onDownChanged: {
                            if (down) {
                                root.pressedIndex = globalIndex;
                            } else if (root.pressedIndex === globalIndex) {
                                root.pressedIndex = -1;
                            }
                        }

                        widthScale: {
                            if (root.pressedIndex === -1)
                                return 1.0;

                            let pressedRow = Math.floor(root.pressedIndex / root.effectiveColumns);
                            if (rowLayout.rowIndex !== pressedRow)
                                return 1.0;
                            if (globalIndex === root.pressedIndex)
                                return 1.15;

                            let isLeft = (globalIndex === root.pressedIndex - 1);
                            let isRight = (globalIndex === root.pressedIndex + 1);
                            if (isLeft || isRight) {
                                let pressedCol = root.pressedIndex % root.effectiveColumns;
                                let hasLeft = (pressedCol > 0);
                                let hasRight = (pressedCol < root.maxColumns - 1);
                                let numNeighbors = (hasLeft ? 1 : 0) + (hasRight ? 1 : 0);
                                return 1.0 - (0.15 / numNeighbors);
                            }

                            return 1.0;
                        }
                    }
                }
            }
        }
    }
}
