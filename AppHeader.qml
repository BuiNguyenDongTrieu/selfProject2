import QtQuick 2.0

Item {
    property alias playlistButtonStatus: playlist_button.status
    property int isVisible: 2
    signal clickPlaylistButton
    Image {
        id: headerItem
        source: "qrc:/Image/title.png"
        SwitchButton {
            id: playlist_button
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            icon_off: "qrc:/Image/drawer.png"
            icon_on: "qrc:/Image/back.png"
            onClicked: {
                clickPlaylistButton()
            }
        }
        Text {
            anchors.left: playlist_button.right
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            text: qsTr("STR_LIST") + Translator.language
            color: "white"
            font.pixelSize: 32
        }
        Text {
            id: headerTitleText
            text: qsTr("STR_MAIN_TITLE") + Translator.language
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 46
        }
        Image {
            id: vn_flag
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            width: 50
            height: 50
            source: "qrc:/Image/vn.png"
            Rectangle{
                id: flag_icon_vn
                width: 50
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                border.color: "yellow"
                border.width: 3
                color: "transparent"
                visible: isVisible == 1 ? 2 : 0
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Translator.setLanguage("Vietnamese")
                    isVisible = 1
                }
            }
        }
        Image {
            id: us_flag
            anchors.right: vn_flag.left
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            width: 50
            height: 50
            source: "qrc:/Image/us.png"
            Rectangle{
                id: flag_icon_us
                width: 50
                height: 30
                anchors.verticalCenter: parent.verticalCenter
                border.color: "yellow"
                border.width: 3
                color: "transparent"
                visible: isVisible == 2 ? 2 : 0
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Translator.setLanguage("English")
                    isVisible = 2
                }
            }
        }
    }
}
