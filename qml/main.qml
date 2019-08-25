import QtQuick 2.12
import QtQuick.Controls 2.5

Rectangle {
    id: root
    width: 1024; height: 600
    color: "#000000"

    // Load fonts.
    FontLoader { id: roboto; source: "assets/fonts/Roboto-Regular.ttf" }
    FontLoader { id: robotobold; source: "assets/fonts/Roboto-Bold.ttf" }

    FontLoader { id: beaufort; source: "assets/fonts/Beaufort-Regular.ttf" }
    FontLoader { id: beaufortbold; source: "assets/fonts/Beaufort-Bold.ttf" }

    // Top bar for the entire app.
    TopBar {
        id: topbar
        anchors.top: parent.top;
        width: parent.width
        height: 80
    }

    // Content area.
    Item {
        width: parent.width
        height: (parent.height - (topbar.height + bottombar.height))
        anchors.top: topbar.bottom
       
        // Loads pages dynamically, launcher view is default.
        Loader {
            id: contentLoader
            anchors.fill: parent
            source: "LauncherView.qml"
        }
    }

    
    // Bottom bar.
    BottomBar{
        id: bottombar
        width: parent.width; height: 80
        anchors.bottom: parent.bottom;
    }

    // Settings popup.
    SettingsPopup{
        id: settingsPopup
    }

    // This is a bit of a hack to get a popup to display right after
    // the parent loads, if we remove the timer we get an error saying
    // there's no parent to create the popup from.
    Timer {
        interval: 0; running: true; repeat: false
        onTriggered: {
            if(settings.games.rowCount() == 0) {
                settingsPopup.open()
            }
        }
    }
}
