import QtQuick
import Quickshell
import qs.Preferences
import qs.Components.Buttons
import QtQuick.Layouts

ColumnLayout {
    id: boundingWindow
    visible: true
    spacing: 8

    Row {
        spacing: 8
        SimpleButton {
            text: 'start'
        }
        SimpleButton {
            text: 'Theme'
            iconText: ''
            checkable: true
            onClicked: Colors.darkTheme = !Colors.darkTheme
        }
    }
    Row {
        spacing: 8
        SimpleButton {
            text: 'start'
            checkable: true
        }
        SimpleButton {
            text: 'start'
            enabled: false
        }
    }
    ButtonGroup {
        Layout.fillWidth: true
        maxColumns: 4 // Wraps every 3 buttons onto a new row
        spacing: 4
        exclusive: false

        buttonColor: SimpleButton.ColorVariant.Filled
        buttonSize: SimpleButton.SizeVariant.LG

        model: [
            {
                iconText: "",
                value: "Wifi"
            },
            {
                iconText: "",
                value: "Volume"
            },
            {
                iconText: "",
                value: "opt3"
            },
            {
                iconText: "",
                value: "opt4"
            },
            {
                iconText: "",
                value: "opt4"
            },
            {
                iconText: "",
                value: "opt4"
            },
            {
                iconText: "",
                value: "opt4"
            },
            {
                iconText: "",
                value: "opt4"
            },
            {
                iconText: "",
                value: "opt4"
            },
            {
                iconText: "",
                value: "opt5"
            }
        ]

        onButtonClicked: (index, value, buttonState) => {
            console.log("Selected Button:", value, "Value:", buttonState);
        }
    }
}
