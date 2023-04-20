import QtQuick 2.6
import QtQuick.Controls 2.4

ApplicationWindow {
    id: rootID
    visible: true
    width: 1920
    height: 1080
    visibility: "FullScreen"
    title: qsTr("Media Player")
    //Backgroud of Application
    Image {
        id: backgroud
        anchors.fill: parent
        source: "qrc:/Image/background.png"
    }
    //Header
    AppHeader{
        id: headerItem
        width: parent.width
        height: 141
        onClickPlaylistButton: {
            console.log("playlistButtonStatus " + playlistButtonStatus)
            playlistButtonStatus ? playlist.open() : playlist.close()
        }
    }

    //Playlist
    PlaylistView{
        id: playlist
        y: headerItem.height
        width: 675
        height: parent.height - headerItem.height
    }

    //Media Info
    MediaInfoControl{
        id: mediaInfoControl
        width: rootID.width - (playlist.position * playlist.width)
        anchors.top: headerItem.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        mediaCount: playlist.mediaPlaylist.count
        clip: true
    }
}
