import QtQuick
import qs.Preferences

ColorAnimation {
	duration: AnimCfg.durations.normal
    easing.type: Easing.BezierSpline
    easing.bezierCurve: AnimCfg.curves.standard
}
