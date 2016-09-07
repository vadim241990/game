import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.3
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

Rectangle {                  //основное меню игры
    id: main_windows
    width: Screen.width
    height: Screen.height
    visible: true

    signal message(string msg)

    Rectangle
    {
        id:main_rect
        width: parent.width
        height: parent.height

        Image
        {
            id:left_rect
            width: parent.width * 0.75
            height: parent.height
            source: "/menu/image/menu/fon_left.jpg"
        }

        Image
        {
            id:rigth_rect
            width: parent.width * 0.25
            height: parent.height
            anchors.right: parent.right
            source: "/menu/image/menu/stal.jpg"

            ///////////////////////////////////////////////////////////////
            Style_files
            {
                id:start_game
                height: parent.height * 0.05
                width: parent.width * 0.7
                anchors.horizontalCenter: rigth_rect.horizontalCenter
                anchors.bottom: load_game.top
                anchors.bottomMargin: load_game.height
                onClicked:
                {
                    item_loader_windows.settings_select("geroi.qml");
                }
            }
            //////////////////////
            Style_files
            {
                id:load_game
                height: parent.height * 0.05
                width: parent.width * 0.7
                anchors.horizontalCenter: rigth_rect.horizontalCenter
                anchors.bottom: lesson_game.top
                anchors.bottomMargin: lesson_game.height
            }
            //////////////////////
            Style_files
            {
                id:lesson_game
                height: parent.height * 0.05
                width: parent.width * 0.7
                anchors.centerIn: parent
            }
            //////////////////////
            Style_files
            {
                id:settings_game
                height: parent.height * 0.05
                width: parent.width * 0.7
                anchors.horizontalCenter: rigth_rect.horizontalCenter
                anchors.top: lesson_game.bottom
                anchors.topMargin: lesson_game.height
            }
            //////////////////////
            Style_files
            {
                id:exit_game
                height: parent.height * 0.05
                width: parent.width * 0.7
                anchors.horizontalCenter: rigth_rect.horizontalCenter
                anchors.top: settings_game.bottom
                anchors.topMargin: settings_game.height
                onClicked:
                {
                    global_settings.quit();
                }
            }
            ///////////////////////////////////////////////////////////////
            Text
            {
                anchors.centerIn: start_game
                color:"white"
                text:qsTr("Новая игра")
                font.family: "Segoe Print"
                font.pointSize: 13
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                width: start_game.width
                height: start_game.height
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            //////////////////////
            Text
            {
                anchors.centerIn: load_game
                color:"white"
                text:qsTr("Загрузить игру")
                font.family: "Segoe Print"
                font.pointSize: 13
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                width: start_game.width
                height: start_game.height
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            //////////////////////
            Text
            {
                anchors.centerIn: lesson_game
                color:"white"
                text:qsTr("Обучение")
                font.family: "Segoe Print"
                font.pointSize: 13
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                width: start_game.width
                height: start_game.height
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            //////////////////////
            Text
            {
                anchors.centerIn: settings_game
                color:"white"
                text:qsTr("Настройки")
                font.family: "Segoe Print"
                font.pointSize: 13
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                width: start_game.width
                height: start_game.height
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            //////////////////////
            Text
            {
                anchors.centerIn: exit_game
                color:"white"
                text:qsTr("Выход")
                font.family: "Segoe Print"
                font.pointSize: 13
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                width: start_game.width
                height: start_game.height
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            ///////////////////////////////////////////////////////////////
        }
    }
}
