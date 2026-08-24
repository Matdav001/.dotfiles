pragma Singleton
import QtQuick
import Quickshell

Singleton {
    id: root

    // --- Config ---
    property real latitude: -27.6
    property real longitude: -48.6
    property int refreshInterval: 900000 // 15 min

    // --- State ---
    property bool loading: false
    property string error: ""

    // --- Weather data ---
    property QtObject current: QtObject {
        property real temp: 1.2
        property real feltTemp: 3.4
        property string weather: ""
    }

    signal updated

    function fetch() {
        loading = true;
        error = "";

        const url = `https://api.open-meteo.com/v1/forecast?latitude=${latitude}&longitude=${longitude}&current=temperature_2m,apparent_temperature,is_day,weather_code&timezone=auto`;

        const xhr = new XMLHttpRequest();
        xhr.open("GET", url);

        xhr.onreadystatechange = function () {
            if (xhr.readyState !== XMLHttpRequest.DONE)
                return;
            loading = false;

            if (xhr.status !== 200) {
                error = `HTTP ${xhr.status}`;
                return;
            }

            try {
                const data = JSON.parse(xhr.responseText);
                current.temp = data.current.temperature_2m;
                current.feltTemp = data.current.apparent_temperature;
                current.weather = weatherDescription(data.current.weather_code);
                updated();
            } catch (e) {
                error = e.toString();
            }
        };

        xhr.send();
    }

    Timer {
        interval: root.refreshInterval
        running: true
        repeat: true
        onTriggered: root.fetch()
    }

    Component.onCompleted: fetch()

    // --- Helpers ---
    function weatherDescription(code) {
        switch (code) {
        case (0):
            return "󰖙";
        default:
            return code.toString();
        }
    }
}
