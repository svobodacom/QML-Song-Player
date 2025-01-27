import QtQuick
import QtMultimedia
import com.company.PlayerController
import SongPlayer

Item
{
    id: root

    readonly property AudioInfo infoProvider: AudioInfo { }

    visible: PlayerController.currentSongIndex === infoProvider.songIndex

    Image
    {
        id: albumImage

        anchors
        {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }

        width: 150
        height: 150

        source: infoProvider.imageSource
    }

    Video
    {
        id: albumVideo
        anchors
        {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }

        width: 150
        height: 150
        loops: MediaPlayer.Infinite
        volume: 0

        source: infoProvider.videoSource
    }

    Text
    {
        id: titleText
        anchors
        {
            bottom: parent.verticalCenter
            left: albumImage.right
            margins: 20
            right: parent.right
        }

        color: "white"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        text: infoProvider.title

        font
        {
            pixelSize: 24
            bold: true
        }
    }

    Text
    {
        id: authorText
        anchors
        {
            top: parent.verticalCenter
            left: albumImage.right
            margins: 20
            topMargin: 1
            right: parent.right
        }

        color: "grey"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        text: infoProvider.authorName

        font
        {
            pixelSize: 20
        }
    }

    onVisibleChanged:
    {
        if (visible)
        {
            albumVideo.play()
            PlayerController.changeAudioSource(infoProvider.audioSource)
        }
        else
        {
            albumVideo.seek(0)
            albumVideo.stop()
        }
    }

    Component.onCompleted:
    {
        if (PlayerController.currentSongIndex === infoProvider.songIndex)
            PlayerController.changeAudioSource(infoProvider.audioSource)
    }
}
