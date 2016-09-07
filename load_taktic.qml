import QtQuick 2.4

Rectangle
{
    width: parent.width
    height: parent.height

    property string name_job: "" //какая миссия выбрана

    function update_resurs()
    {
        parent.update_gold_and_ruda();
    }

    function disable_job()
    {
        for(var i = 0; i < global_settings.get_map_job_size(); i++)
        {
            if(global_settings.get_map_job_at(i) === "")
            {
                if(i === 0)         rect_1.visible = false;
                else if(i === 1)    rect_2.visible = false;
                else if(i === 2)    rect_3.visible = false;
                else if(i === 3)    rect_4.visible = false;
                else if(i === 4)    rect_5.visible = false;
                else if(i === 5)    rect_6.visible = false;
            }
        }
    }

    function show_table_property(index) //вывод статистики персонажа
    {
        if(global_settings.get_level_game() === 1)
        {
            if(name_job === "крестьяне")
            {
                if((index === 1) || (index === 5))
                {
                    table_view.parsing_string((applicationDirPath + "/XML/other/xml_krestyanin.xml"),"krestyanin",0);
                    table_view.visible = true;
                }
            }
            else if(name_job === "гоблины")
            {
                if((index === 1) || (index === 3))
                {
                    table_view.parsing_string((applicationDirPath + "/XML/other/xml_goblin_voin.xml"),"goblin_voin",0);
                    table_view.visible = true;
                }
                else if(index === 4)
                {
                    table_view.parsing_string((applicationDirPath + "/XML/other/xml_goblin_lushnik.xml"),"goblin_lushnik",0);
                    table_view.visible = true;
                }
            }
            else if(name_job === "стража")
            {
                if(index === 1)
                {
                    table_view.parsing_string((applicationDirPath + "/XML/other/xml_meshnik.xml"),"meshnik",0);
                    table_view.visible = true;
                }
                if(index === 4)
                {
                    table_view.parsing_string((applicationDirPath + "/XML/other/xml_lushnik.xml"),"lushnik",0);
                    table_view.visible = true;
                }
                if(index === 5)
                {
                    table_view.parsing_string((applicationDirPath + "/XML/other/xml_main_strash.xml"),"main_strash",0);
                    table_view.visible = true;
                }
            }
            else if(name_job === "main")
            {
                if((index === 1) || (index === 3) || (index === 5))
                {
                    table_view.parsing_string((applicationDirPath + "/XML/other/xml_zashitnik.xml"),"zashitnik",0);
                    table_view.visible = true;
                }
                else if(index === 4)
                {
                    table_view.parsing_string((applicationDirPath + "/XML/other/xml_main.xml"),"main",0);
                    table_view.visible = true;
                }
            }
        }

        if(global_settings.get_seath_otrad(global_settings.get_level_game()) === false)
            table_view.visible = false;
    }

    function image_select_job(name) //отобразить всех бойцов в миссии
    {
        image_otrad_1.source = "";
        image_otrad_2.source = "";
        image_otrad_3.source = "";
        image_otrad_4.source = "";
        image_otrad_5.source = "";
        image_otrad_6.source = "";
        name_job = name;

        if(global_settings.get_level_game() === 1)
        {
            if(name === "крестьяне")
            {
                image_otrad_1.source = "file:///" + applicationDirPath + "/image/taktic_game/level_1/krestyanin.jpg";
                image_otrad_5.source = "file:///" + applicationDirPath + "/image/taktic_game/level_1/krestyanin.jpg";
            }
            else if(name === "гоблины")
            {
                image_otrad_1.source = "file:///" + applicationDirPath + "/image/taktic_game/level_1/goblin_voin.jpg";
                image_otrad_3.source = "file:///" + applicationDirPath + "/image/taktic_game/level_1/goblin_voin.jpg";
                image_otrad_4.source = "file:///" + applicationDirPath + "/image/taktic_game/level_1/goblin_lushnik.jpg";
            }
            else if(name === "стража")
            {
                image_otrad_1.source = "file:///" + applicationDirPath + "/image/taktic_game/level_1/meshnik.jpg";
                image_otrad_5.source = "file:///" + applicationDirPath + "/image/taktic_game/level_1/main_strash.jpg";
                image_otrad_4.source = "file:///" + applicationDirPath + "/image/taktic_game/level_1/lushnik.jpg";
            }
            else if(name === "main")
            {
                image_otrad_1.source = "file:///" + applicationDirPath + "/image/taktic_game/level_1/zashitnik.jpg";
                image_otrad_3.source = "file:///" + applicationDirPath + "/image/taktic_game/level_1/zashitnik.jpg";
                image_otrad_5.source = "file:///" + applicationDirPath + "/image/taktic_game/level_1/zashitnik.jpg";
                image_otrad_4.source = "file:///" + applicationDirPath + "/image/taktic_game/level_1/main.jpg";
            }
        }
    }

    //вспомогательная функция(возвращает адрес картинки миссии)
    function image_job(name)
    {
        if(global_settings.get_level_game() === 1)
        {
            if(name === "крестьяне")
                return "file:///" + applicationDirPath + "/image/taktic_game/level_1/image_level_1_1.jpg";
            else if(name === "гоблины")
                return "file:///" + applicationDirPath + "/image/taktic_game/level_1/image_level_1_2.jpg";
            else if(name === "стража")
                return "file:///" + applicationDirPath + "/image/taktic_game/level_1/image_level_1_3.jpg";
            else if(name === "main")
                return "file:///" + applicationDirPath + "/image/taktic_game/level_1/image_level_1_4.jpg";
        }
    }

    function select_level()
    {
        var level = global_settings.get_level_game();

        if(level === 1)
        {
            fon_level.source = "file:///" + applicationDirPath + "/image/taktic_game/main_fon/map_level_1.jpg";
            rect_1.anchors.top = fon_level.top;
            rect_1.anchors.topMargin = fon_level.height * 0.29;
            rect_1.anchors.left = fon_level.left;
            rect_1.anchors.leftMargin = fon_level.width * 0.29;
            rect_1.visible = true;

            rect_2.anchors.top = fon_level.top;
            rect_2.anchors.topMargin = fon_level.height * 0.29;
            rect_2.anchors.right = fon_level.right;
            rect_2.anchors.rightMargin = fon_level.width * 0.29;
            rect_2.visible = true;

            rect_3.anchors.bottom = fon_level.bottom;
            rect_3.anchors.bottomMargin = fon_level.height * 0.29;
            rect_3.anchors.left = fon_level.left;
            rect_3.anchors.leftMargin = fon_level.width * 0.29;
            rect_3.visible = true;

            rect_4.anchors.bottom = fon_level.bottom;
            rect_4.anchors.bottomMargin = fon_level.height * 0.29;
            rect_4.anchors.right = fon_level.right;
            rect_4.anchors.rightMargin = fon_level.width * 0.29;
            rect_4.visible = true;

            if(global_settings.get_map_job_size() === 0)
                global_settings.random_map_job();
            else
                disable_job();

            if(global_settings.get_map_job_at(0) !== "")    rect_1_image.source = image_job(global_settings.get_map_job_at(0));
            if(global_settings.get_map_job_at(1) !== "")    rect_2_image.source = image_job(global_settings.get_map_job_at(1));
            if(global_settings.get_map_job_at(2) !== "")    rect_3_image.source = image_job(global_settings.get_map_job_at(2));
            if(global_settings.get_map_job_at(3) !== "")    rect_4_image.source = image_job(global_settings.get_map_job_at(3));
        }

        else if(level === 2)
            fon_level.source = "file:///" + applicationDirPath + "/image/taktic_game/main_fon/map_level_2.jpg";
        else if(level === 3)
            fon_level.source = "file:///" + applicationDirPath + "/image/taktic_game/main_fon/map_level_3.jpg";
        else if(level === 4)
            fon_level.source = "file:///" + applicationDirPath + "/image/taktic_game/main_fon/map_level_4.jpg";
        else if(level === 5)
            fon_level.source = "file:///" + applicationDirPath + "/image/taktic_game/main_fon/map_level_5.jpg";
        else if(level === 6)
            fon_level.source = "file:///" + applicationDirPath + "/image/taktic_game/main_fon/map_level_6.jpg";
        else if(level === 7)
            fon_level.source = "file:///" + applicationDirPath + "/image/taktic_game/main_fon/map_level_7.jpg";
        else if(level === 8)
            fon_level.source = "file:///" + applicationDirPath + "/image/taktic_game/main_fon/map_level_8.jpg";
        else if(level === 9)
            fon_level.source = "file:///" + applicationDirPath + "/image/taktic_game/main_fon/map_level_9.jpg";
        else if(level === 10)
            fon_level.source = "file:///" + applicationDirPath + "/image/taktic_game/main_fon/map_level_10.jpg";

        fon_bottom.source = "file:///" + applicationDirPath + "/image/taktic_game/main_fon/map_bottom.jpg";

        var res = global_settings.get_number_date();
        var number = res % 7;

        if(number === 1)
        {
            image_1.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_1.png";
            image_2.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
            image_3.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
            image_4.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
            image_5.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
            image_6.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
            image_7.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
        }
        else if(number === 2)
        {
            image_1.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_1.png";
            image_2.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_2.png";
            image_3.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
            image_4.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
            image_5.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
            image_6.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
            image_7.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
        }
        else if(number === 3)
        {
            image_1.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_1.png";
            image_2.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_2.png";
            image_3.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_3.png";
            image_4.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
            image_5.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
            image_6.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
            image_7.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
        }
        else if(number === 4)
        {
            image_1.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_1.png";
            image_2.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_2.png";
            image_3.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_3.png";
            image_4.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_4.png";
            image_5.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
            image_6.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
            image_7.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
        }
        else if(number === 5)
        {
            image_1.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_1.png";
            image_2.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_2.png";
            image_3.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_3.png";
            image_4.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_4.png";
            image_5.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_5.png";
            image_6.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
            image_7.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
        }
        else if(number === 6)
        {
            image_1.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_1.png";
            image_2.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_2.png";
            image_3.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_3.png";
            image_4.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_4.png";
            image_5.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_5.png";
            image_6.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_6.png";
            image_7.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_0.png";
        }
        else if(number === 7)
        {
            image_1.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_1.png";
            image_2.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_2.png";
            image_3.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_3.png";
            image_4.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_4.png";
            image_5.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_5.png";
            image_6.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_6.png";
            image_7.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/number_7.png";
        }

        truba.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/truba_black.png";
        if((global_settings.get_building("razvedka") === true) && (global_settings.get_seath_otrad(level) === false))
            truba.visible = true;
        else
            truba.visible = false;

        next_day.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/next_black.png";
    }

    Image
    {
        id: fon_level
        width: parent.width
        height: parent.height * 0.9
        anchors.top: parent.top

        Rectangle
        {
            id: rect_1
            width: fon_level.width * 0.2
            height: fon_level.height * 0.2
            border.color: "white"
            border.width: 10
            visible: false

            Image
            {
                id: rect_1_image
                width: parent.width - rect_1.border.width
                height: parent.height - rect_1.border.width
                anchors.centerIn: rect_1
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    rect_1.border.color = "green";
                }
                onExited:
                {
                    rect_1.border.color = "white";
                }
                onClicked:
                {
                    image_select_job(global_settings.get_map_job_at(0));
                    select_menu.visible = true;
                }
            }
        }

        Rectangle
        {
            id: rect_2
            width: fon_level.width * 0.2
            height: fon_level.height * 0.2
            border.color: "white"
            border.width: 10
            visible: false

            Image
            {
                id: rect_2_image
                width: parent.width - rect_2.border.width
                height: parent.height - rect_2.border.width
                anchors.centerIn: rect_2
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    rect_2.border.color = "green";
                }
                onExited:
                {
                    rect_2.border.color = "white";
                }
                onClicked:
                {
                    image_select_job(global_settings.get_map_job_at(1));
                    select_menu.visible = true;
                }
            }
        }

        Rectangle
        {
            id: rect_3
            width: fon_level.width * 0.2
            height: fon_level.height * 0.2
            border.color: "white"
            border.width: 10
            visible: false

            Image
            {
                id: rect_3_image
                width: parent.width - rect_3.border.width
                height: parent.height - rect_3.border.width
                anchors.centerIn: rect_3
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    rect_3.border.color = "green";
                }
                onExited:
                {
                    rect_3.border.color = "white";
                }
                onClicked:
                {
                    image_select_job(global_settings.get_map_job_at(2));
                    select_menu.visible = true;
                }
            }
        }

        Rectangle
        {
            id: rect_4
            width: fon_level.width * 0.2
            height: fon_level.height * 0.2
            border.color: "white"
            border.width: 10
            visible: false

            Image
            {
                id: rect_4_image
                width: parent.width - rect_4.border.width
                height: parent.height - rect_4.border.width
                anchors.centerIn: rect_4
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    rect_4.border.color = "green";
                }
                onExited:
                {
                    rect_4.border.color = "white";
                }
                onClicked:
                {
                    image_select_job(global_settings.get_map_job_at(3));
                    select_menu.visible = true;
                }
            }
        }

        Rectangle
        {
            id: rect_5
            width: fon_level.width * 0.2
            height: fon_level.height * 0.2
            border.color: "white"
            border.width: 10
            visible: false

            Image
            {
                id: rect_5_image
                width: parent.width - rect_5.border.width
                height: parent.height - rect_5.border.width
                anchors.centerIn: rect_5
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    rect_5.border.color = "green";
                }
                onExited:
                {
                    rect_5.border.color = "white";
                }
                onClicked:
                {
                    image_select_job(global_settings.get_map_job_at(4));
                    select_menu.visible = true;
                }
            }
        }

        Rectangle
        {
            id: rect_6
            width: fon_level.width * 0.2
            height: fon_level.height * 0.2
            border.color: "white"
            border.width: 10
            visible: false

            Image
            {
                id: rect_6_image
                width: parent.width - rect_6.border.width
                height: parent.height - rect_6.border.width
                anchors.centerIn: rect_6
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    rect_6.border.color = "green";
                }
                onExited:
                {
                    rect_6.border.color = "white";
                }
                onClicked:
                {
                    image_select_job(global_settings.get_map_job_at(5));
                    select_menu.visible = true;
                }
            }
        }

        Rectangle     //меню игроков в миссии
        {
            id: select_menu
            width: parent.width
            height: parent.height
            color: "#C0000000"
            visible: false

            MouseArea //заглушка от случайного нажатия на другую форму
            {
                anchors.fill: parent
                onClicked: {}
            }

            Rectangle
            {
                id: select_menu_rect
                width: select_menu.width * 0.8
                height: select_menu.height * 0.8
                color: "#333333"
                border.color: "white"
                border.width: 3
                anchors.centerIn: select_menu

                Text
                {
                    id: text_rad_1
                    width: select_menu_rect.width * 0.25
                    height: select_menu_rect.height * 0.05
                    anchors.left: select_menu_rect.left
                    anchors.top: select_menu_rect.top
                    color: "white"
                    text:qsTr("1-ряд")
                    font.family: "Segoe Print"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 17
                    fontSizeMode: Text.Fit
                    minimumPointSize: 8
                }

                Text
                {
                    id: text_rad_2
                    width: select_menu_rect.width * 0.25
                    height: select_menu_rect.height * 0.05
                    anchors.left: text_rad_1.right
                    anchors.top: select_menu_rect.top
                    color: "white"
                    text:qsTr("2-ряд")
                    font.family: "Segoe Print"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 17
                    fontSizeMode: Text.Fit
                    minimumPointSize: 8
                }

                Rectangle
                {
                    id: rect_otrad_1
                    height: select_menu_rect.height * 0.2
                    width: rect_otrad_1.height
                    border.color: "white"
                    border.width: 2
                    anchors.top: text_rad_1.bottom
                    anchors.horizontalCenter: text_rad_1.horizontalCenter
                    color: "#00000000"

                    Image
                    {
                        id: image_otrad_1
                        width: parent.width - (rect_otrad_1.border.width * 2)
                        height: parent.height - (rect_otrad_1.border.width * 2)
                        anchors.centerIn: rect_otrad_1
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        hoverEnabled: true

                        onHoveredChanged:
                        {
                            rect_otrad_1.border.color = "green";
                            show_table_property(1);
                        }
                        onExited:
                        {
                            rect_otrad_1.border.color = "white";
                            table_view.visible = false;
                        }
                    }
                }

                Rectangle
                {
                    id: rect_otrad_2
                    height: select_menu_rect.height * 0.2
                    width: rect_otrad_2.height
                    border.color: "white"
                    border.width: 2
                    anchors.top: text_rad_2.bottom
                    anchors.horizontalCenter: text_rad_2.horizontalCenter
                    color: "#00000000"

                    Image
                    {
                        id: image_otrad_2
                        width: parent.width - (rect_otrad_2.border.width * 2)
                        height: parent.height - (rect_otrad_2.border.width * 2)
                        anchors.centerIn: rect_otrad_2
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        hoverEnabled: true

                        onHoveredChanged:
                        {
                            rect_otrad_2.border.color = "green";
                            show_table_property(2);
                        }
                        onExited:
                        {
                            rect_otrad_2.border.color = "white";
                            table_view.visible = false;
                        }
                    }
                }

                Rectangle
                {
                    id: rect_otrad_3
                    height: select_menu_rect.height * 0.2
                    width: rect_otrad_3.height
                    border.color: "white"
                    border.width: 2
                    anchors.top: rect_otrad_1.bottom
                    anchors.topMargin: select_menu_rect.height * 0.05
                    anchors.horizontalCenter: text_rad_1.horizontalCenter
                    color: "#00000000"

                    Image
                    {
                        id: image_otrad_3
                        width: parent.width - (rect_otrad_3.border.width * 2)
                        height: parent.height - (rect_otrad_3.border.width * 2)
                        anchors.centerIn: rect_otrad_3
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        hoverEnabled: true

                        onHoveredChanged:
                        {
                            rect_otrad_3.border.color = "green";
                            show_table_property(3);
                        }
                        onExited:
                        {
                            rect_otrad_3.border.color = "white";
                            table_view.visible = false;
                        }
                    }
                }

                Rectangle
                {
                    id: rect_otrad_4
                    height: select_menu_rect.height * 0.2
                    width: rect_otrad_4.height
                    border.color: "white"
                    border.width: 2
                    anchors.top: rect_otrad_2.bottom
                    anchors.topMargin: select_menu_rect.height * 0.05
                    anchors.horizontalCenter: text_rad_2.horizontalCenter
                    color: "#00000000"

                    Image
                    {
                        id: image_otrad_4
                        width: parent.width - (rect_otrad_4.border.width * 2)
                        height: parent.height - (rect_otrad_4.border.width * 2)
                        anchors.centerIn: rect_otrad_4
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        hoverEnabled: true

                        onHoveredChanged:
                        {
                            rect_otrad_4.border.color = "green";
                            show_table_property(4);
                        }
                        onExited:
                        {
                            rect_otrad_4.border.color = "white";
                            table_view.visible = false;
                        }
                    }
                }

                Rectangle
                {
                    id: rect_otrad_5
                    height: select_menu_rect.height * 0.2
                    width: rect_otrad_5.height
                    border.color: "white"
                    border.width: 2
                    anchors.top: rect_otrad_3.bottom
                    anchors.topMargin: select_menu_rect.height * 0.05
                    anchors.horizontalCenter: text_rad_1.horizontalCenter
                    color: "#00000000"

                    Image
                    {
                        id: image_otrad_5
                        width: parent.width - (rect_otrad_5.border.width * 2)
                        height: parent.height - (rect_otrad_5.border.width * 2)
                        anchors.centerIn: rect_otrad_5
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        hoverEnabled: true

                        onHoveredChanged:
                        {
                            rect_otrad_5.border.color = "green";
                            show_table_property(5);
                        }
                        onExited:
                        {
                            rect_otrad_5.border.color = "white";
                            table_view.visible = false;
                        }
                    }
                }

                Rectangle
                {
                    id: rect_otrad_6
                    height: select_menu_rect.height * 0.2
                    width: rect_otrad_6.height
                    border.color: "white"
                    border.width: 2
                    anchors.top: rect_otrad_4.bottom
                    anchors.topMargin: select_menu_rect.height * 0.05
                    anchors.horizontalCenter: text_rad_2.horizontalCenter
                    color: "#00000000"

                    Image
                    {
                        id: image_otrad_6
                        width: parent.width - (rect_otrad_6.border.width * 2)
                        height: parent.height - (rect_otrad_6.border.width * 2)
                        anchors.centerIn: rect_otrad_6
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        hoverEnabled: true

                        onHoveredChanged:
                        {
                            rect_otrad_6.border.color = "green";
                            show_table_property(6);
                        }
                        onExited:
                        {
                            rect_otrad_6.border.color = "white";
                            table_view.visible = false;
                        }
                    }
                }

                Table_property
                {
                    id: table_view
                    width: parent.width * 0.4
                    height: ((rect_otrad_6.height * 3) + ((select_menu_rect.height * 0.05)*2)) //расстояние от верхушки 1 квадрата до низа последнего
                    anchors.top: select_menu_rect.top
                    anchors.topMargin: select_menu_rect.height * 0.05
                    anchors.left: select_menu_rect.horizontalCenter
                    anchors.leftMargin: parent.width * 0.05
                    color: "#00000000"
                    visible: false
                }

                Rectangle
                {
                    id: cansel
                    width: select_menu_rect.width - (select_menu_rect.border.width * 2)
                    height: select_menu_rect.height * 0.05
                    anchors.bottom: select_menu_rect.bottom
                    anchors.bottomMargin: select_menu_rect.border.width
                    anchors.horizontalCenter: select_menu_rect.horizontalCenter
                    color: select_menu_rect.color

                    Text
                    {
                        id: cansel_text
                        width: cansel.width
                        height: cansel.height
                        anchors.centerIn: cansel
                        color: "white"
                        text:qsTr("Не вступать в бой")
                        font.family: "Segoe Print"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 17
                        fontSizeMode: Text.Fit
                        minimumPointSize: 8
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        hoverEnabled: true

                        onHoveredChanged:
                        {
                            cansel.color = "orange";
                            cansel_text.color = "red";
                        }

                        onExited:
                        {
                            cansel.color = select_menu_rect.color;
                            cansel_text.color = "white";
                        }

                        onClicked:
                        {
                            select_menu.visible = false;
                        }
                    }
                }

                Rectangle
                {
                    id: start
                    width: select_menu_rect.width - (select_menu_rect.border.width * 2)
                    height: select_menu_rect.height * 0.05
                    anchors.bottom: cansel.top
                    anchors.horizontalCenter: select_menu_rect.horizontalCenter
                    color: select_menu_rect.color

                    Text
                    {
                        id: start_text
                        width: start.width
                        height: start.height
                        anchors.centerIn: start
                        color: "white"
                        text:qsTr("Начать бой")
                        font.family: "Segoe Print"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 17
                        fontSizeMode: Text.Fit
                        minimumPointSize: 8
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        hoverEnabled: true

                        onHoveredChanged:
                        {
                            start.color = "orange";
                            start_text.color = "green";
                        }

                        onExited:
                        {
                            start.color = select_menu_rect.color;
                            start_text.color = "white";
                        }

                        onClicked:
                        {
                            if(global_settings.position_otrad_size_more_zero() === false)
                            {
                                warning_size_otrad.visible = true;
                                return;
                            }

                            global_settings.new_battle(name_job);
                            item_loader_windows.settings_select("battle.qml");
                        }
                    }
                }
            }
        }

        Rectangle
        {
            id: warning_size_otrad
            width: parent.width
            height: parent.height
            color: "#C0000000"
            visible: false

            MouseArea //заглушка от случайного нажатия на другую форму
            {
                anchors.fill: parent
                onClicked: {}
            }

            Rectangle
            {
                id: warning_size_otrad_rect
                width: warning_size_otrad.width * 0.5
                height: warning_size_otrad.height * 0.5
                color: "#333333"
                border.color: "white"
                border.width: 3
                anchors.centerIn: warning_size_otrad

                Rectangle
                {
                    id: warning_size_otrad_cansel
                    width: warning_size_otrad_rect.width - (warning_size_otrad_rect.border.width * 2)
                    height: warning_size_otrad_rect.height * 0.1
                    anchors.bottom: warning_size_otrad_rect.bottom
                    anchors.bottomMargin: warning_size_otrad_rect.border.width
                    anchors.horizontalCenter: warning_size_otrad_rect.horizontalCenter
                    color: warning_size_otrad_rect.color

                    Text
                    {
                        id: warning_size_otrad_text
                        width: warning_size_otrad_cansel.width
                        height: warning_size_otrad_cansel.height
                        anchors.centerIn: warning_size_otrad_cansel
                        color: "white"
                        text:qsTr("Хорошо")
                        font.family: "Segoe Print"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 17
                        fontSizeMode: Text.Fit
                        minimumPointSize: 8
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        hoverEnabled: true

                        onHoveredChanged:
                        {
                            warning_size_otrad_cansel.color = "orange";
                            warning_size_otrad_text.color = "red";
                        }

                        onExited:
                        {
                            warning_size_otrad_cansel.color = warning_size_otrad_rect.color;
                            warning_size_otrad_text.color = "white";
                        }

                        onClicked:
                        {
                            warning_size_otrad.visible = false;
                        }
                    }
                }

                Rectangle
                {
                    id: warning_size_otrad_vopros
                    width: warning_size_otrad_rect.width - (warning_size_otrad_rect.border.width * 2)
                    height: warning_size_otrad_rect.height * 0.25
                    anchors.top: warning_size_otrad_rect.top
                    anchors.topMargin: warning_size_otrad_rect.border.width
                    anchors.horizontalCenter: warning_size_otrad_rect.horizontalCenter
                    color: warning_size_otrad_rect.color

                    Text
                    {
                        id: warning_size_otrad_vopros_text
                        width: warning_size_otrad_vopros.width
                        height: warning_size_otrad_vopros.height
                        anchors.centerIn: warning_size_otrad_vopros
                        color: "white"
                        text:qsTr("Расположите бойцов в отряде.(Расстановка команды находится в меню с героем и его отрядом)")
                        font.family: "Segoe Print"
                        wrapMode: TextEdit.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 25
                        fontSizeMode: Text.Fit
                        minimumPointSize: 8
                    }
                }
            }
        }

        Rectangle
        {
            id: menu_seath
            width: parent.width
            height: parent.height
            color: "#C0000000"
            visible: false

            MouseArea //заглушка от случайного нажатия на другую форму
            {
                anchors.fill: parent
                onClicked: {}
            }

            Rectangle
            {
                id: menu_seath_rect
                width: menu_seath.width * 0.5
                height: menu_seath.height * 0.5
                color: "#333333"
                border.color: "white"
                border.width: 3
                anchors.centerIn: menu_seath

                Rectangle
                {
                    id: menu_seath_cansel
                    width: menu_seath_rect.width - (menu_seath_rect.border.width * 2)
                    height: menu_seath_rect.height * 0.1
                    anchors.bottom: menu_seath_rect.bottom
                    anchors.bottomMargin: menu_seath_rect.border.width
                    anchors.horizontalCenter: menu_seath_rect.horizontalCenter
                    color: menu_seath_rect.color

                    Text
                    {
                        id: menu_seath_cansel_text
                        width: menu_seath_cansel.width
                        height: menu_seath_cansel.height
                        anchors.centerIn: menu_seath_cansel
                        color: "white"
                        text:qsTr("Нет")
                        font.family: "Segoe Print"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 17
                        fontSizeMode: Text.Fit
                        minimumPointSize: 8
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        hoverEnabled: true

                        onHoveredChanged:
                        {
                            menu_seath_cansel.color = "orange";
                            menu_seath_cansel_text.color = "red";
                        }

                        onExited:
                        {
                            menu_seath_cansel.color = menu_seath_rect.color;
                            menu_seath_cansel_text.color = "white";
                        }

                        onClicked:
                        {
                            menu_seath.visible = false;
                        }
                    }
                }

                Rectangle
                {
                    id: menu_seath_start
                    width: menu_seath_rect.width - (menu_seath_rect.border.width * 2)
                    height: menu_seath_rect.height * 0.1
                    anchors.bottom: menu_seath_cansel.top
                    anchors.horizontalCenter: menu_seath_rect.horizontalCenter
                    color: menu_seath_rect.color

                    Text
                    {
                        id: menu_seath_start_text
                        width: menu_seath_start.width
                        height: menu_seath_start.height
                        anchors.centerIn: menu_seath_start
                        color: "white"
                        text:qsTr("Да")
                        font.family: "Segoe Print"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 17
                        fontSizeMode: Text.Fit
                        minimumPointSize: 8
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        hoverEnabled: true

                        onHoveredChanged:
                        {
                            menu_seath_start.color = "orange";
                            menu_seath_start_text.color = "green";
                        }

                        onExited:
                        {
                            menu_seath_start.color = select_menu_rect.color;
                            menu_seath_start_text.color = "white";
                        }

                        onClicked:
                        {
                            var gold = global_settings.get_resurs("gold");
                            if(gold >= 100)
                            {
                                global_settings.set_resurs("gold",(gold - 100));
                                global_settings.set_seath_otrad(global_settings.get_level_game(),true);
                                update_resurs();
                                truba.visible = false;
                                menu_seath.visible = false;
                            }
                        }
                    }
                }

                Rectangle
                {
                    id: menu_seath_vopros
                    width: menu_seath_rect.width - (menu_seath_rect.border.width * 2)
                    height: menu_seath_rect.height * 0.15
                    anchors.top: menu_seath_rect.top
                    anchors.topMargin: menu_seath_rect.border.width
                    anchors.horizontalCenter: menu_seath_rect.horizontalCenter
                    color: menu_seath_rect.color

                    Text
                    {
                        id: menu_seath_vopros_text
                        width: menu_seath_vopros.width
                        height: menu_seath_vopros.height
                        anchors.centerIn: menu_seath_vopros
                        color: "white"
                        text:qsTr("Заказать разведку за 100 золотых?")
                        font.family: "Segoe Print"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 25
                        fontSizeMode: Text.Fit
                        minimumPointSize: 8
                    }
                }
            }
        }
    }

    Image
    {
        id: fon_bottom
        width: parent.width
        height: parent.height * 0.1
        anchors.top: fon_level.bottom

        Image
        {
            id: image_1
            height: parent.height * 0.8
            width: image_1.height
            anchors.left: parent.left
            anchors.leftMargin: image_1.height * 0.5
            anchors.verticalCenter: parent.verticalCenter
        }

        Image
        {
            id: image_2
            height: parent.height * 0.8
            width: image_2.height
            anchors.left: image_1.right
            anchors.leftMargin: image_1.width * 0.5
            anchors.verticalCenter: parent.verticalCenter
        }

        Image
        {
            id: image_3
            height: parent.height * 0.8
            width: image_3.height
            anchors.left: image_2.right
            anchors.leftMargin: image_2.width * 0.5
            anchors.verticalCenter: parent.verticalCenter
        }

        Image
        {
            id: image_4
            height: parent.height * 0.8
            width: image_4.height
            anchors.left: image_3.right
            anchors.leftMargin: image_3.width * 0.5
            anchors.verticalCenter: parent.verticalCenter
        }

        Image
        {
            id: image_5
            height: parent.height * 0.8
            width: image_5.height
            anchors.left: image_4.right
            anchors.leftMargin: image_4.width * 0.5
            anchors.verticalCenter: parent.verticalCenter
        }

        Image
        {
            id: image_6
            height: parent.height * 0.8
            width: image_6.height
            anchors.left: image_5.right
            anchors.leftMargin: image_5.width * 0.5
            anchors.verticalCenter: parent.verticalCenter
        }

        Image
        {
            id: image_7
            height: parent.height * 0.8
            width: image_7.height
            anchors.left: image_6.right
            anchors.leftMargin: image_6.width * 0.5
            anchors.verticalCenter: parent.verticalCenter
        }

        Image
        {
            id: truba
            height: parent.height * 0.8
            width: truba.height
            anchors.left: image_7.right
            anchors.leftMargin: image_7.width * 0.5
            anchors.verticalCenter: parent.verticalCenter
            visible: false

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    truba.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/truba.png";
                }
                onExited:
                {
                    truba.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/truba_black.png";
                }
                onClicked:
                {
                    select_menu.visible = false;
                    menu_seath.visible = true;
                }
            }
        }

        Image
        {
            id: next_day
            height: parent.height * 0.8
            width: next_day.height
            anchors.right: parent.right
            anchors.rightMargin: image_7.width * 0.5
            anchors.verticalCenter: parent.verticalCenter

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    next_day.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/next.png";
                }
                onExited:
                {
                    next_day.source = "file:///" + applicationDirPath + "/image/taktic_game/main_date/next_black.png";
                }
                onClicked:
                {
                    //menu_buy.visible = true;
                }
            }
        }
    }
}

