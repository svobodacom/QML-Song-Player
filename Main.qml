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
            imageColor: "red"
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
            imageColor: "green"
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
            imageColor: "blue"
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
