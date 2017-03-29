import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

Rectangle  //основное окно игры(выбор следующей точки для нападения)
{
    id: main_windows
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    visible: true
    focus: true

    Keys.onEscapePressed:
    {
        esc_esc.visible = true;
    }

    Image
    {
        id:left_image
        width: parent.width * 0.15
        height: parent.height
        fillMode: Image.TileHorizontally
        source: "file:///" + applicationDirPath + "/image/taktic_game/kamen.jpg"

        Image
        {
            id: zamok_image
            source: "file:///" + applicationDirPath + "/image/taktic_game/zamok.jpg"
            width: left_image.width * 0.8
            height: left_image.height * 0.2
            anchors.horizontalCenter: left_image.horizontalCenter
            anchors.bottom: left_image.bottom
            anchors.bottomMargin: left_image.height * 0.05
            smooth: true
            visible: false
        }

        Image
        {
            id: army_image
            source: "/person/image/person/person_geroi_voin.jpg"
            width: left_image.width * 0.8
            height: left_image.height * 0.2
            anchors.horizontalCenter: left_image.horizontalCenter
            anchors.bottom: zamok_image.top
            anchors.bottomMargin: zamok_image.height * 0.2
            smooth: true
            visible: false
        }

        Image
        {
            id: ramka_red
            source: "file:///" + applicationDirPath + "/image/taktic_game/ramka_red.png"
            width: left_image.width * 0.8
            height: left_image.height * 0.2
            anchors.horizontalCenter: left_image.horizontalCenter
            anchors.bottom: left_image.bottom
            anchors.bottomMargin: left_image.height * 0.05
            smooth: true
            visible: false
        }

        Image
        {
            id: ramka_green
            source: "file:///" + applicationDirPath + "/image/taktic_game/ramka_green.png"
            width: left_image.width * 0.8
            height: left_image.height * 0.2
            anchors.horizontalCenter: left_image.horizontalCenter
            anchors.bottom: left_image.bottom
            anchors.bottomMargin: left_image.height * 0.05
            smooth: true
            visible: false
        }

        Image
        {
            id: dublon
            source: "file:///" + applicationDirPath + "/image/taktic_game/dublon.png"
            width: left_image.width * 0.2
            height: dublon.width

            anchors.top: left_image.top
            anchors.topMargin: left_image.width * 0.1
            anchors.left: left_image.left
            anchors.leftMargin: left_image.width * 0.1
        }

        Image
        {
            id: ruda
            source: "file:///" + applicationDirPath + "/image/taktic_game/ruda.png"
            width: left_image.width * 0.2
            height: ruda.width

            anchors.top: dublon.bottom
            anchors.topMargin: dublon.height * 0.5
            anchors.left: left_image.left
            anchors.leftMargin: left_image.width * 0.1
        }

        Label
        {
            id: many_text
            color: "white"
            text: global_settings.get_resurs("gold")
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 23
            anchors.left: dublon.right
            anchors.leftMargin: dublon.width * 0.3
            anchors.verticalCenter: dublon.verticalCenter
            fontSizeMode: Text.Fit
            minimumPointSize: 8
            height: dublon.height
        }

        Label
        {
            id: ruda_text
            color: "white"
            text: global_settings.get_resurs("ruda")
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 23
            anchors.left: ruda.right
            anchors.leftMargin: ruda.width * 0.3
            anchors.verticalCenter: ruda.verticalCenter
            fontSizeMode: Text.Fit
            minimumPointSize: 8
            height: ruda.height
        }

        Blend
        {
            id:blend_image
            anchors.fill: zamok_image
            source: zamok_image
            foregroundSource: ramka_red
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    blend_image.foregroundSource = ramka_green;
                }
                onExited:
                {
                    blend_image.foregroundSource = ramka_red;
                }
                onClicked:
                {
                    item_loader_windows.settings_select("home.qml");
                }
            }
        }

        Blend
        {
            id:blend_image_army
            anchors.fill: army_image
            source: army_image
            foregroundSource: ramka_red
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    blend_image_army.foregroundSource = ramka_green;
                }
                onExited:
                {
                    blend_image_army.foregroundSource = ramka_red;
                }
                onClicked:
                {
                    item_loader_windows.settings_select("army.qml");
                }
            }
        }
    }

    Loader
    {
        id:loader_taktic
        width: parent.width - left_image.width
        height: parent.height
        anchors.left: left_image.right
        source: "/building_home/load_taktic.qml"

        function update_gold_and_ruda()
        {
            ruda_text.text = global_settings.get_resurs("ruda");
            many_text.text = global_settings.get_resurs("gold");
        }

        onLoaded:
        {
            loader_taktic.item.select_level();
        }
    }

    ESC
    {
        id:esc_esc
    }
}

