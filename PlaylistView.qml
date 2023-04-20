import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.1
import QtQml 2.12
import QtQuick.Dialogs 1.2

Drawer {
    id: drawer
    property alias mediaPlaylist: mediaPlaylist
    interactive: false
    modal: false
    background: Rectangle {
        id: playList_bg
        anchors.fill: parent
        color: "transparent"
    }
    ListView {
        id: mediaPlaylist
        anchors.fill: parent
        model: myModel
        clip: true
        spacing: 2
        currentIndex: 0
        delegate: MouseArea {
            property variant myData: model
            implicitWidth: playlistItem.width
            implicitHeight: playlistItem.height
            Image {
                id: playlistItem
                width: 675
                height: 193
                source: "qrc:/Image/playlist.png"
                opacity: 0.5
            }
            Text {
                text: title
                anchors.fill: parent
                anchors.leftMargin: 70
                verticalAlignment: Text.AlignVCenter
                color: "white"
                font.pixelSize: 32
            }
            onClicked: {
                player.playlist.currentIndex = index
            }

            onPressed: {
                playlistItem.source = "qrc:/Image/hold.png"
            }
            onReleased: {
                playlistItem.source = "qrc:/Image/playlist.png"
            }
            onCanceled: {
                playlistItem.source = "qrc:/Image/playlist.png"
            }

        }
        highlight: Image {
            source: "qrc:/Image/playlist_item.png"
            Image {
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/Image/playing.png"
            }

        }
        highlightMoveDuration: 200
        ScrollBar.vertical: ScrollBar {
            parent: mediaPlaylist.parent
            anchors.top: mediaPlaylist.top
            anchors.left: mediaPlaylist.right
            anchors.bottom: mediaPlaylist.bottom
        }
    }

    Connections{
        target: player.playlist
        onCurrentIndexChanged: {
            mediaPlaylist.currentIndex = player.playlist.currentIndex;
            //player.play()
            console.log(mediaPlaylist + mediaPlaylist.currentIndex)
            console.log(player.playlist + player.playlist.currentIndex)
        }
    }

    MessageDialog {
        id: messageId
        title: "Message"
        text: "Playlist is empty."
        icon: StandardIcon.Information
        standardButtons: StandardButton.Ok
        onAccepted: {
            Qt.quit()
            console.log("User clicked 'Ok'.")
        }
    }

    Component.onCompleted: {
        if (mediaPlaylist.count === 0) {
            messageId.open()
        }
    }
}
