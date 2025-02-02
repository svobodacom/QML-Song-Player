import QtQuick

Image
{
    id: root

    signal clicked()

    opacity: buttonMouseArea.containsPress ? 0.75 : 1
    mipmap: true
    fillMode: Image.PreserveAspectFit

    MouseArea
    {
        id: buttonMouseArea
        anchors.fill: parent
        hoverEnabled: true

        onClicked:
        {
            root.clicked()
        }
    }

}
