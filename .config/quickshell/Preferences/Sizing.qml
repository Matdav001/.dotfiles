pragma Singleton
import QtQuick

QtObject {
	readonly property double scale: 1
	property int defaultSize: 32
	property int defaultSpacing: 4
	readonly property real radius: 16 * scale
	readonly property real bigRadius: radius * 1.5
}
