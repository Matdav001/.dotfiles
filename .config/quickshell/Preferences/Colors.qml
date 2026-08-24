pragma Singleton
import QtQuick

Item {
    id: theme

    property bool darkTheme: false

    // --- LIGHT THEME (DEFAULT VALUES) ---
    property color surface: "#FFFFFF"
    property color surfaceOn: "#1D1B20"
    property color surfaceContainer: "#F3EDF7"
    property color surfaceContainerLow: "#f7f2fa"
    property color surfaceVariantOn: "#49454F"
    property color inverseSurface: "#322F35"
    property color inverseSurfaceOn: "#F5EFF7"
    property color primary: "#6750A4"
    property color primaryOn: "#FFFFFF"
    property color secondary: "#625B71"
    property color secondaryOn: "#FFFFFF"
    property color secondaryContainer: "#E8DEF8"
    property color secondaryContainerOn: "#4A4458"
    property color outlineVariant: "#CAC4D0"

    // --- STATIC COLORS (Don't change between themes) ---
    property color error: "#FFCCCC"
    property color errorText: "#601414"
    property color success: "#CCFFCC"
    property color successText: "#146014"

    // --- DARK THEME OVERRIDES ---
    states: [
        State {
            name: "dark"
            when: theme.darkTheme
            PropertyChanges {
                target: theme
                surface: "#141218"
                surfaceOn: "#E6E0E9"
                surfaceContainer: "#211F26"
                surfaceContainerLow: "#1d1b20"
                surfaceVariantOn: "#CAC4D0"
                inverseSurface: "#E6E0E9"
                inverseSurfaceOn: "#322F35"
                primary: "#D0BCFF"
                primaryOn: "#381E72"
                secondary: "#CCC2DC"
                secondaryOn: "#332D41"
                secondaryContainer: "#4A4458"
                secondaryContainerOn: "#E8DEF8"
                outlineVariant: "#49454F"
            }
        }
    ]

    // --- UNIVERSAL ANIMATION ---
    // Automatically animates ALL changing colors when switching states
    transitions: Transition {
        ColorAnimation {
            duration: 150
            easing.type: Easing.InOutQuad
        }
    }
}
