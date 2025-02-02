import QtQuick 2.12

Item {
    id: launchView
    width: parent.width; height: parent.height
    anchors.leftMargin: 20
    
    Item {
        id: logobg
        width: 210.6
        height: 240.3
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        Image { source: "assets/logo-bg.png"; anchors.fill: parent; fillMode: Image.PreserveAspectFit; opacity: 1.0 }
    }

    Item {
        id: logotext
        width: 216
        height: 63.9
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 109
        Image { source: "assets/logo-text.png"; anchors.fill: parent; fillMode: Image.PreserveAspectFit; opacity: 1.0 }
    }

    // Sidebar to the right.
    Item {
        id: sidebar
        width: 350
        height: parent.height
        anchors.right: parent.right

        Separator{
            width: 1
            anchors.right: undefined
            anchors.top: parent.top
        }

        NewsTable{}

        Item {
            width: 115
            height: 40
            anchors.bottom: parent.bottom
            anchors.right: parent.right

            Title {
                text: settings.buildVersion
                font.pixelSize: 10
                anchors.centerIn: parent
            }
        }
    }
        
    // Bottom bar.
    Item {
        id: bottombar
        width: (parent.width-sidebar.width); height: 80
        anchors.bottom: parent.bottom;

        // Patcher including progress bar.
        Patcher{
            width: 650
        }
    }
}
