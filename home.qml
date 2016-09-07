import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

Rectangle  //постройка зданий
{
    id: main_windows
    width: Screen.desktopAvailableWidth + Screen.width
    height: Screen.desktopAvailableHeight + Screen.height
    visible: true
    focus: true

    Keys.onEscapePressed:
    {
        esc_esc.visible = true;
    }

    Item
    {
        id: settings

        property int page: 0;

        function clear_image()
        {
            if(settings.page === 1)         image_select_1.source = "file:///" + applicationDirPath + "/image/taktic_game/home_red.png"
            else if(settings.page === 2)    image_select_2.source = "file:///" + applicationDirPath + "/image/taktic_game/shield_red.png"
            else if(settings.page === 3)    image_select_3.source = "file:///" + applicationDirPath + "/image/taktic_game/killer_red.png"
            else if(settings.page === 4)    image_select_4.source = "file:///" + applicationDirPath + "/image/taktic_game/help_red.png"
            else if(settings.page === 5)    image_select_5.source = "file:///" + applicationDirPath + "/image/taktic_game/select_red.png";
        }
    }

    //////////////////////////////////////////////////////////вспомагательные элементы
    Gradient {
        id: gradient_hover
        GradientStop { position: 0.0; color: "white" }
        GradientStop { position: 1.0; color: "black" }
    }

    Gradient {
        id: gradient_exit
        GradientStop { position: 0.0; color: "grey" }
        GradientStop { position: 1.0; color: "black" }
    }
    //////////////////////////////////////////////////////////

    Image
    {
        id:left_image
        width: parent.width * 0.15
        height: parent.height
        fillMode: Image.TileHorizontally
        source: "file:///" + applicationDirPath + "/image/taktic_game/kamen.jpg"

        Image
        {
            id: map
            source: "file:///" + applicationDirPath + "/image/taktic_game/map.jpg"
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
            anchors.bottom: map.top
            anchors.bottomMargin: map.height * 0.2
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
            anchors.fill: map
            source: map
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
                    item_loader_windows.settings_select("taktic_game.qml");
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

    Image
    {
        id: bottom_menu
        width: parent.width - left_image.width
        height: parent.height * 0.2
        anchors.left: left_image.right
        anchors.bottom: parent.bottom
        source: "file:///" + applicationDirPath + "/image/taktic_game/fon_bottom_menu.jpg"

        Rectangle
        {
            id: select_1
            width: (parent.width / 5) - (parent.width * 0.05)
            height: parent.height - (parent.height * 0.05)
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: select_2.left
            anchors.rightMargin: parent.width * 0.01
            border.width: 3
            border.color: "grey"
            radius: parent.height * 0.15
            gradient: Gradient {
                    GradientStop { position: 0.0; color: "grey" }
                    GradientStop { position: 1.0; color: "black" }
            }

            Image
            {
                id: image_select_1
                source: "file:///" + applicationDirPath + "/image/taktic_game/home_red.png"
                width: parent.width * 0.7
                height: parent.height * 0.7
                anchors.horizontalCenter: select_1.horizontalCenter
                anchors.verticalCenter: select_1.verticalCenter
                visible: true
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    parent.gradient = gradient_hover;

                }
                onExited:
                {
                    parent.gradient = gradient_exit;
                }
                onClicked:
                {
                    settings.clear_image();
                    image_select_1.source = "file:///" + applicationDirPath + "/image/taktic_game/home_green.png"
                    settings.page = 1;
                    loader_home.source = "/building_home/building_gold.qml"
                }
            }
        }

        Rectangle
        {
            id: select_2
            width: (parent.width / 5) - (parent.width * 0.05)
            height: parent.height - (parent.height * 0.05)
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: select_3.left
            anchors.rightMargin: parent.width * 0.01
            border.width: 3
            border.color: "grey"
            radius: parent.height * 0.15
            gradient: Gradient {
                    GradientStop { position: 0.0; color: "grey" }
                    GradientStop { position: 1.0; color: "black" }
            }

            Image
            {
                id: image_select_2
                source: "file:///" + applicationDirPath + "/image/taktic_game/shield_red.png"
                width: parent.width * 0.6
                height: parent.height * 0.6
                anchors.horizontalCenter: select_2.horizontalCenter
                anchors.verticalCenter: select_2.verticalCenter
                visible: true
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    parent.gradient = gradient_hover;

                }
                onExited:
                {
                    parent.gradient = gradient_exit;
                }
                onClicked:
                {
                    settings.clear_image();
                    image_select_2.source = "file:///" + applicationDirPath + "/image/taktic_game/shield_green.png";
                    settings.page = 2;
                    loader_home.source = "";
                    loader_home.source = "/building_home/building_boez.qml";
                }
            }
        }

        Rectangle
        {
            id: select_3
            width: (parent.width / 5) - (parent.width * 0.05)
            height: parent.height - (parent.height * 0.05)
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            border.width: 3
            border.color: "grey"
            radius: parent.height * 0.15
            gradient: Gradient {
                    GradientStop { position: 0.0; color: "grey" }
                    GradientStop { position: 1.0; color: "black" }
            }

            Image
            {
                id: image_select_3
                source: "file:///" + applicationDirPath + "/image/taktic_game/killer_red.png"
                width: parent.width * 0.7
                height: parent.height * 0.7
                anchors.horizontalCenter: select_3.horizontalCenter
                anchors.verticalCenter: select_3.verticalCenter
                visible: true
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    parent.gradient = gradient_hover;

                }
                onExited:
                {
                    parent.gradient = gradient_exit;
                }
                onClicked:
                {
                    settings.clear_image();
                    image_select_3.source = "file:///" + applicationDirPath + "/image/taktic_game/killer_yellow.png";
                    settings.page = 3;
                    loader_home.source = "";
                    loader_home.source = "/building_home/building_boez.qml";
                }
            }
        }

        Rectangle
        {
            id: select_4
            width: (parent.width / 5) - (parent.width * 0.05)
            height: parent.height - (parent.height * 0.05)
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: select_3.right
            anchors.leftMargin: parent.width * 0.01
            border.width: 3
            border.color: "grey"
            radius: parent.height * 0.15
            gradient: Gradient {
                    GradientStop { position: 0.0; color: "grey" }
                    GradientStop { position: 1.0; color: "black" }
            }

            Image
            {
                id: image_select_4
                source: "file:///" + applicationDirPath + "/image/taktic_game/help_red.png"
                width: parent.width * 0.6
                height: parent.height * 0.6
                anchors.horizontalCenter: select_4.horizontalCenter
                anchors.verticalCenter: select_4.verticalCenter
                visible: true
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    parent.gradient = gradient_hover;

                }
                onExited:
                {
                    parent.gradient = gradient_exit;
                }
                onClicked:
                {
                    settings.clear_image();
                    image_select_4.source = "file:///" + applicationDirPath + "/image/taktic_game/help_green.png";
                    settings.page = 4;
                    loader_home.source = "";
                    loader_home.source = "/building_home/building_boez.qml";
                }
            }
        }

        Rectangle
        {
            id: select_5
            width: (parent.width / 5) - (parent.width * 0.05)
            height: parent.height - (parent.height * 0.05)
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: select_4.right
            anchors.leftMargin: parent.width * 0.01
            border.width: 3
            border.color: "grey"
            radius: parent.height * 0.15
            gradient: Gradient {
                    GradientStop { position: 0.0; color: "grey" }
                    GradientStop { position: 1.0; color: "black" }
            }

            Image
            {
                id: image_select_5
                source: "file:///" + applicationDirPath + "/image/taktic_game/select_red.png";
                width: parent.width * 0.8
                height: parent.height * 0.8
                anchors.horizontalCenter: select_5.horizontalCenter
                anchors.verticalCenter: select_5.verticalCenter
                visible: true
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    parent.gradient = gradient_hover;

                }
                onExited:
                {
                    parent.gradient = gradient_exit;
                }
                onClicked:
                {
                    settings.clear_image();
                    image_select_5.source = "file:///" + applicationDirPath + "/image/taktic_game/select_green.png";
                    settings.page = 5;
                    loader_home.source = "";
                    loader_home.source = "/building_home/building_boez.qml";
                }
            }
        }
    }

    Image
    {
        id: fon_centr
        width: parent.width - left_image.width
        height: parent.height - bottom_menu.height
        anchors.left: left_image.right
        anchors.bottom: bottom_menu.top
        source: "file:///" + applicationDirPath + "/image/taktic_game/home_fon_main.jpg"
    }

    Loader
    {
        id:loader_home
        width: parent.width - left_image.width
        height: parent.height - bottom_menu.height
        anchors.left: left_image.right
        anchors.bottom: bottom_menu.top
        asynchronous: true

        function update_gold_and_ruda()
        {
            ruda_text.text = global_settings.get_resurs("ruda");
            many_text.text = global_settings.get_resurs("gold");
        }

        onHeightChanged:
        {
            //так как из файла все найденные адреса грузятся автаматически происходит долгая загрузка
            //решением проблемы зарарее подгрузить файл где он останется в кеше
            loader_home.source = "/building_home/building_boez.qml";
            loader_home.sourceComponent = undefined;
        }

        onLoaded:
        {
            loader_home.asynchronous = false;
            loader_home.item.repaint(settings.page);
        }
    }

    ESC
    {
        id:esc_esc
    }
}
