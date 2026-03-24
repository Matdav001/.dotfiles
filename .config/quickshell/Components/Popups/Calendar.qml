import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.Components.Buttons
import qs.Components.Texts
import qs.Preferences
import QtQml

pragma ComponentBehavior: Bound

Rectangle {
	color: Colors.card
	width: layout.width + Sizing.radius
	height: layout.height + Sizing.radius
	radius: Sizing.radius
	GridLayout {
		anchors.centerIn: parent
		id:layout
		width: Sizing.defaultSize * 7 + 3 * Sizing.defaultSpacing
		columns: 1
		rowSpacing: 0

		SimpleButton {
			buttonText: 'potato'
		}

		DayOfWeekRow {
			locale: grid.locale
			topPadding: Sizing.defaultSpacing / 2
			bottomPadding: Sizing.defaultSpacing / 2
			padding: 0

			height: Sizing.defaultSize // Force the row to match your delegate height
			Layout.fillWidth: true
			spacing: Sizing.defaultSpacing / 2
			delegate: Rectangle {
				// Set properties to easily check the day's state
				readonly property bool isSelectedMonth: model.month === grid.month
				color: 'transparent'
				width: Sizing.defaultSize
				height: Sizing.defaultSize

				SimpleText {
					text: parent.model.narrowName // model.day holds the day number (1-31)
					anchors.centerIn: parent
					color: Colors.fontColor2
					font.bold: true
				}
				required property var model
			}
		}

		MonthGrid {
			id:grid
			month: Calendar.January
			year: 2026
			locale: Qt.locale("en_US")

			Layout.preferredHeight: Sizing.defaultSize * 6 + Sizing.defaultSpacing * 2.5
			Layout.fillWidth: true
			spacing: Sizing.defaultSpacing / 2

			// Customizing each day's appearance using the delegate:
			delegate: Rectangle {
				id: day
				// Set properties to easily check the day's state
				readonly property bool isToday: model.today
				readonly property bool isSelectedMonth: model.month === grid.month

				HoverHandler {
					id: mouseHandler
				}
				radius: width / 3
				color: isToday ? Colors.fontColor1 : (mouseHandler.hovered ? Colors.fontColor3 : 'transparent')
				width: Sizing.defaultSize
				height: Sizing.defaultSize

				SimpleText {
					text: parent.model.day // model.day holds the day number (1-31)
					color: parent.model.today ? Colors.background : (parent.isSelectedMonth ? Colors.fontColor1 : Colors.fontColor3)
					anchors.centerIn: parent
					font.bold: true
				}
				required property var model
			}
		}
	}
}
