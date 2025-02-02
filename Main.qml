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
            anchors.rightMargin: 15
            anchors.verticalCenter: parent.verticalCenter
            width: 45
            height: 45
            source: "images/list.png"

            onClicked: playlistPanel.hidden = false
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
            id: firstSong

            anchors
            {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 30
            }

            infoProvider
            {
                songIndex: 0
                title: "Whatever Will Be Will Be"
                authorName: "Pixies"
                imageSource: "images/WillBe.png"
                videoSource: "qrc:/SongPlayer/images/sera.mp4"
                audioSource: "qrc:/SongPlayer/images/sera.mp4"
            }
        }

        AudioInfoBox
        {
            id: secondSong

            anchors
            {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 30
            }

            infoProvider
            {
                songIndex: 1
                title: "Symphone No. 5"
                authorName: "Van Beethoven"
                imageSource: "images/Bethoven.png"
                audioSource: "qrc:/SongPlayer/images/betkhoven.mp3"
            }
        }

        AudioInfoBox
        {
            id: thirdSong

            anchors
            {
                verticalCenter: parent.verticalCenter
                left: parent.left
                right: parent.right
                margins: 30
            }

            infoProvider
            {
                songIndex: 2
                title: "Real REP"
                authorName: "9 Gramm"
                imageSource: "images/9gramm.png"
                audioSource: "qrc:/SongPlayer/images/9_gramm.mp3"
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
