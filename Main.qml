import QtQuick
import com.company.PlayerController

Window {
    width: 800
    height: 550
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

        ImageButton
        {
            id: listButton
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            width: 40
            height: 40
            source: "images/list.png"

            onClicked:
            {
                if (playlistPanel.hidden === true)
                {
                    playlistPanel.hidden = false
                }
                else
                {
                    playlistPanel.hidden = true
                }
            }
        }
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
            id: songInfo

            anchors
            {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 30
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

        Row
        {
            anchors.centerIn: parent
            spacing: 20
            enabled: !!PlayerController.currentSong
            opacity: enabled ? 1 : 0.3

            ImageButton
            {
                id: previousButton
                width: 64
                height: 64
                source: "images/prev_icon.png"

                onClicked: PlayerController.switchToPreviousSong()
            }

            ImageButton
            {
                id: playPauseButton
                width: 64
                height: 64
                source: PlayerController.playing ? "images/pause_icon.png" : "images/play_icon.png"

                onClicked: PlayerController.playPause()
            }

            ImageButton
            {
                id: nextButton
                width: 64
                height: 64
                source: "images/next_icon.png"

                onClicked: PlayerController.switchToNextSong()
            }
        }
    }

    PlaylistPanel
    {
        id: playlistPanel

        anchors
        {
            top: topbar.bottom
        }

        x: hidden ? parent.width : parent.width - width
    }
}
