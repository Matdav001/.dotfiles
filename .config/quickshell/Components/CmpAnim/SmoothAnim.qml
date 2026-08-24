import QtQuick
import qs.Preferences

SmoothedAnimation {
    duration: AnimCfg.durations.small
    easing.type: Easing.BezierSpline
    easing.bezierCurve: AnimCfg.curves.standard
}
