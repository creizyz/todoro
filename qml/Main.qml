import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQml

Window {
    width: 1920
    height: 1080
    visible: true
    title: "todoro"

    Button {
        text: "Test"
        Component.onCompleted: console.log("Implicit height:", implicitHeight) // differs by style
    }
}