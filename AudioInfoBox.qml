import QtQuick
import QtMultimedia
import com.company.PlayerController
import SongPlayer

Item
{
    id: root
    visible: !!PlayerController.currentSong

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

        source: !!PlayerController.currentSong ? PlayerController.currentSong.imageSource : ""
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
        visible: false

        source: !!PlayerController.currentSong ? PlayerController.currentSong.videoSource : ""

        onSourceChanged:
        {
            if (source != "")
            {
                albumVideo.play()
                visible = true
            }
            else
            {
                albumVideo.stop()
                visible = false
            }
        }
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
        text: !!PlayerController.currentSong ? PlayerController.currentSong.title : ""

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
        text: !!PlayerController.currentSong ? PlayerController.currentSong.authorName : ""

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
        }
        else
        {
            albumVideo.seek(0)
            albumVideo.stop()
        }
    }


}
