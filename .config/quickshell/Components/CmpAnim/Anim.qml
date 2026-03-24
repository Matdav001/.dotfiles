import QtQuick
import qs.Preferences

NumberAnimation {
    duration: AnimCfg.durations.small
    easing.type: Easing.BezierSpline
    easing.bezierCurve: AnimCfg.curves.standard
}
