import QtQuick

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

            songIndex: 0
            title: "Whatever Will Be Will Be"
            authorName: "Pixies"
            imageSource: "images/WillBe.png"
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

            songIndex: 1
            title: "Symphone No. 5"
            authorName: "Van Beethoven"
            imageSource: "images/Bethoven.png"
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

            songIndex: 2
            title: "Real REP"
            authorName: "9 Gramm"
            imageSource: "images/9gramm.png"
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

                onClicked: playerController.switchToPreviousSong()
            }

            ImageButton
            {
                id: playPauseButton
                width: 64
                height: 64
                source: playerController.playing ? "images/pause_icon.png" : "images/play_icon.png"

                onClicked: playerController.playPause()
            }

            ImageButton
            {
                    id: nextButton
                    width: 64
                    height: 64
                    source: "images/next_icon.png"

                    onClicked: playerController.switchToNextSong()
            }
        }
    }


    QtObject
    {
        id: playerController
        property int currentSongIndex: 0
        property int songCount: 3
        property bool playing: false

        function playPause()
        {
            playing = !playing
        }

        function switchToPreviousSong()
        {
            if (currentSongIndex > 0)
            {
                currentSongIndex--
            }
            else
            {
                currentSongIndex = songCount - 1
            }
        }

        function switchToNextSong()
        {
            if (currentSongIndex + 1 >= songCount)
            {
                currentSongIndex = 0
            }
            else
            {
                currentSongIndex++
            }
        }
    }


}
