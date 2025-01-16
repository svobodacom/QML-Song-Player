import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("SONG PLAYER")

    Rectangle
    {
        id: topbar

        anchors
        {
            top: parent.top
            left: parent.left
            right: parent.right
        }

        height: 50
        color: "#5F8575"
    }

    Rectangle
    {
        id: mainSection

        anchors
        {
            top: topbar.bottom
            bottom: bottombar.top
            left: parent.left
            right: parent.right
        }

        color: "#1e1e1e"

        AudioInfoBox
        {
            id: firstSong

            anchors
            {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 20
            }
        }
    }

    Rectangle
    {
        id: bottombar

        anchors
        {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        height: 100
        color: "#333333"
    }


}
