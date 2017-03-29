import QtQuick 2.4

Rectangle
{
    width: parent.width
    height: parent.height

    property int can_otrad_index: 0;
    property int border_width: 6;

    function in_or_out(x,y,index)
    {
        var pos_x = middle.width + middle_kamen.width
        var size_index = global_settings.get_otrad_size();
        if(index !== 100) //проверка на героя
        {
            if(size_index <= index)
                return;
        }

        if(((pos_x + position_0_0.x) <= x) && ((pos_x + position_0_0.x + position_0_0.width) >= x))
        {
            if((position_0_0.y <= y) && ((position_0_0.y + position_0_0.height) >= y))
            {
                if(index === 100) //100 индекс героя
                    global_settings.add_position_otrad(global_settings.get_name_geroy(),0,0);
                else
                    global_settings.add_position_otrad(global_settings.get_otrad(index),0,0);

                position_repaint();
                return;
            }
        }

        if(((pos_x + position_0_1.x) <= x) && ((pos_x + position_0_1.x + position_0_1.width) >= x))
        {
            if((position_0_1.y <= y) && ((position_0_1.y + position_0_1.height) >= y))
            {
                if(index === 100) //100 индекс героя
                    global_settings.add_position_otrad(global_settings.get_name_geroy(),0,1);
                else
                    global_settings.add_position_otrad(global_settings.get_otrad(index),0,1);

                position_repaint();
                return;
            }
        }

        if(((pos_x + position_0_2.x) <= x) && ((pos_x + position_0_2.x + position_0_2.width) >= x))
        {
            if((position_0_2.y <= y) && ((position_0_2.y + position_0_2.height) >= y))
            {
                if(index === 100) //100 индекс героя
                    global_settings.add_position_otrad(global_settings.get_name_geroy(),0,2);
                else
                    global_settings.add_position_otrad(global_settings.get_otrad(index),0,2);

                position_repaint();
                return;
            }
        }

        if(((pos_x + position_1_0.x) <= x) && ((pos_x + position_1_0.x + position_1_0.width) >= x))
        {
            if((position_1_0.y <= y) && ((position_1_0.y + position_1_0.height) >= y))
            {
                if(index === 100) //100 индекс героя
                    global_settings.add_position_otrad(global_settings.get_name_geroy(),1,0);
                else
                    global_settings.add_position_otrad(global_settings.get_otrad(index),1,0);

                position_repaint();
                return;
            }
        }

        if(((pos_x + position_1_1.x) <= x) && ((pos_x + position_1_1.x + position_1_1.width) >= x))
        {
            if((position_1_1.y <= y) && ((position_1_1.y + position_1_1.height) >= y))
            {
                if(index === 100) //100 индекс героя
                    global_settings.add_position_otrad(global_settings.get_name_geroy(),1,1);
                else
                    global_settings.add_position_otrad(global_settings.get_otrad(index),1,1);

                position_repaint();
                return;
            }
        }

        if(((pos_x + position_1_2.x) <= x) && ((pos_x + position_1_2.x + position_1_2.width) >= x))
        {
            if((position_1_2.y <= y) && ((position_1_2.y + position_1_2.height) >= y))
            {
                if(index === 100) //100 индекс героя
                    global_settings.add_position_otrad(global_settings.get_name_geroy(),1,2);
                else
                    global_settings.add_position_otrad(global_settings.get_otrad(index),1,2);

                position_repaint();
                return;
            }
        }
    }

    function in_or_out_v2(x,y,index,x1,y1)
    {
        var pos_x = middle.width + middle_kamen.width

        if(((pos_x + position_0_0.x) <= x) && ((pos_x + position_0_0.x + position_0_0.width) >= x))
        {
            if((position_0_0.y <= y) && ((position_0_0.y + position_0_0.height) >= y))
            {

                if(global_settings.get_position_otrad(0,0) === "")
                {
                    if(index === 100)
                        global_settings.add_position_otrad(global_settings.get_name_geroy(),0,0);
                    else
                        global_settings.add_position_otrad(global_settings.get_otrad(index),0,0);
                }
                else
                    global_settings.rotation_position_otrad(0,0,x1,y1);

                position_repaint();
                return;
            }
        }

        if(((pos_x + position_0_1.x) <= x) && ((pos_x + position_0_1.x + position_0_1.width) >= x))
        {
            if((position_0_1.y <= y) && ((position_0_1.y + position_0_1.height) >= y))
            {
                if(global_settings.get_position_otrad(0,1) === "")
                {
                    if(index === 100)
                        global_settings.add_position_otrad(global_settings.get_name_geroy(),0,1);
                    else
                        global_settings.add_position_otrad(global_settings.get_otrad(index),0,1);
                }
                else
                    global_settings.rotation_position_otrad(0,1,x1,y1);

                position_repaint();
                return;
            }
        }

        if(((pos_x + position_0_2.x) <= x) && ((pos_x + position_0_2.x + position_0_2.width) >= x))
        {
            if((position_0_2.y <= y) && ((position_0_2.y + position_0_2.height) >= y))
            {
                if(global_settings.get_position_otrad(0,2) === "")
                {
                    if(index === 100)
                        global_settings.add_position_otrad(global_settings.get_name_geroy(),0,2);
                    else
                        global_settings.add_position_otrad(global_settings.get_otrad(index),0,2);
                }
                else
                    global_settings.rotation_position_otrad(0,2,x1,y1);

                position_repaint();
                return;
            }
        }

        if(((pos_x + position_1_0.x) <= x) && ((pos_x + position_1_0.x + position_1_0.width) >= x))
        {
            if((position_1_0.y <= y) && ((position_1_0.y + position_1_0.height) >= y))
            {
                if(global_settings.get_position_otrad(1,0) === "")
                {
                    if(index === 100)
                        global_settings.add_position_otrad(global_settings.get_name_geroy(),1,0);
                    else
                        global_settings.add_position_otrad(global_settings.get_otrad(index),1,0);
                }
                else
                    global_settings.rotation_position_otrad(1,0,x1,y1);

                position_repaint();
                return;
            }
        }

        if(((pos_x + position_1_1.x) <= x) && ((pos_x + position_1_1.x + position_1_1.width) >= x))
        {
            if((position_1_1.y <= y) && ((position_1_1.y + position_1_1.height) >= y))
            {
                if(global_settings.get_position_otrad(1,1) === "")
                {
                    if(index === 100)
                        global_settings.add_position_otrad(global_settings.get_name_geroy(),1,1);
                    else
                        global_settings.add_position_otrad(global_settings.get_otrad(index),1,1);
                }
                else
                    global_settings.rotation_position_otrad(1,1,x1,y1);

                position_repaint();
                return;
            }
        }

        if(((pos_x + position_1_2.x) <= x) && ((pos_x + position_1_2.x + position_1_2.width) >= x))
        {
            if((position_1_2.y <= y) && ((position_1_2.y + position_1_2.height) >= y))
            {
                if(global_settings.get_position_otrad(1,2) === "")
                {
                    if(index === 100)
                        global_settings.add_position_otrad(global_settings.get_name_geroy(),1,2);
                    else
                        global_settings.add_position_otrad(global_settings.get_otrad(index),1,2);
                }
                else
                    global_settings.rotation_position_otrad(1,2,x1,y1);

                position_repaint();
                return;
            }
        }
    }

    function help_output_otrad_this_geroy()
    {
        pro_otrad.name_otrad = global_settings.get_image_geroy();
        pro_otrad.name_otrad_name = global_settings.get_name_geroy();
        pro_otrad.visible = true;
        pro_otrad.repaint();
    }

    function output_otrad(number)
    {
        var size = 0;
        if(number <= 20) //вывод картинки для купленных отрядов
        {
            size = global_settings.get_otrad_size();
            if(number > size){return;}
            else
            {
                pro_otrad.name_otrad = global_settings.get_sourse_otrad(global_settings.get_otrad(number - 1),global_settings.get_level_team());
                pro_otrad.name_otrad_name = global_settings.get_otrad(number - 1);
                pro_otrad.visible = true;
                pro_otrad.repaint();
            }
        }
        else if(number <= 26)
        {
            var x = 0;
            var y = 0;
            if(number === 22)      {y = 1;}
            else if(number === 23) {y = 2;}
            else if(number === 24) {x = 1;}
            else if(number === 25) {x = 1; y = 1;}
            else if(number === 26) {x = 1; y = 2;}

            var name = global_settings.get_position_otrad(x,y);
            if(name.indexOf(":") !== -1)
            {
                help_output_otrad_this_geroy();
                return;
            }


            if(name === "")
                return;

            pro_otrad.name_otrad = global_settings.get_sourse_otrad(name,global_settings.get_level_team());
            pro_otrad.name_otrad_name = name;
            pro_otrad.visible = true;
            pro_otrad.repaint();
        }
        else if(number === 27)
        {
            help_output_otrad_this_geroy();
        }
        else
        {
            size = global_settings.get_can_buy_otrad_size();
            pro_otrad.name_otrad = global_settings.get_sourse_otrad(global_settings.get_can_buy_otrad(number - 28),global_settings.get_level_team());
            pro_otrad.name_otrad_name = global_settings.get_can_buy_otrad(number - 28);
            pro_otrad.visible = true;
            pro_otrad.repaint();
        }
    }

    function update_resurs()
    {
        parent.update_gold_and_ruda();
    }

    function otrad_5_rad_disable()
    {
        team_20.visible = false;
        team_19.visible = false;
        team_18.visible = false;
        team_17.visible = false;
    }

    function otrad_4_rad_disable()
    {
        team_16.visible = false;
        team_15.visible = false;
        team_14.visible = false;
        team_13.visible = false;
    }

    function otrad_3_rad_disable()
    {
        team_12.visible = false;
        team_11.visible = false;
        team_10.visible = false;
        team_9.visible = false;
    }

    function otrad_2_rad_disable()
    {
        team_8.visible = false;
        team_7.visible = false;
        team_6.visible = false;
        team_5.visible = false;
    }

    function position_repaint()
    {
        if(global_settings.get_position_otrad(0,0) === "")
            image_position_0_0.source = "file:///" + applicationDirPath + "/image/army/add.jpg";
        else if(global_settings.get_position_otrad(0,0) === global_settings.get_name_geroy())
            image_position_0_0.source = global_settings.get_image_geroy();
        else
            image_position_0_0.source = global_settings.get_sourse_otrad(global_settings.get_position_otrad(0,0),global_settings.get_level_team());

///////////////////////
        if(global_settings.get_position_otrad(0,1) === "")
            image_position_0_1.source = "file:///" + applicationDirPath + "/image/army/add.jpg";
        else if(global_settings.get_position_otrad(0,1) === global_settings.get_name_geroy())
            image_position_0_1.source = global_settings.get_image_geroy();
        else
            image_position_0_1.source = global_settings.get_sourse_otrad(global_settings.get_position_otrad(0,1),global_settings.get_level_team());
///////////////////////
        if(global_settings.get_position_otrad(0,2) === "")
            image_position_0_2.source = "file:///" + applicationDirPath + "/image/army/add.jpg";
        else if(global_settings.get_position_otrad(0,2) === global_settings.get_name_geroy())
            image_position_0_2.source = global_settings.get_image_geroy();
        else
            image_position_0_2.source = global_settings.get_sourse_otrad(global_settings.get_position_otrad(0,2),global_settings.get_level_team());
///////////////////////
        if(global_settings.get_position_otrad(1,0) === "")
            image_position_1_0.source = "file:///" + applicationDirPath + "/image/army/add.jpg";
        else if(global_settings.get_position_otrad(1,0) === global_settings.get_name_geroy())
            image_position_1_0.source = global_settings.get_image_geroy();
        else
            image_position_1_0.source = global_settings.get_sourse_otrad(global_settings.get_position_otrad(1,0),global_settings.get_level_team());
///////////////////////
        if(global_settings.get_position_otrad(1,1) === "")
            image_position_1_1.source = "file:///" + applicationDirPath + "/image/army/add.jpg";
        else if(global_settings.get_position_otrad(1,1) === global_settings.get_name_geroy())
            image_position_1_1.source = global_settings.get_image_geroy();
        else
            image_position_1_1.source = global_settings.get_sourse_otrad(global_settings.get_position_otrad(1,1),global_settings.get_level_team());
///////////////////////
        if(global_settings.get_position_otrad(1,2) === "")
            image_position_1_2.source = "file:///" + applicationDirPath + "/image/army/add.jpg";
        else if(global_settings.get_position_otrad(1,2) === global_settings.get_name_geroy())
            image_position_1_2.source = global_settings.get_image_geroy();
        else
            image_position_1_2.source = global_settings.get_sourse_otrad(global_settings.get_position_otrad(1,2),global_settings.get_level_team());
    }

    function otrad_repaint()
    {
        var size = global_settings.get_otrad_size();
        if(size <= 4)
        {
            otrad_5_rad_disable();
            otrad_4_rad_disable();
            otrad_3_rad_disable();
            otrad_2_rad_disable();
        }
        else if(size <= 8)
        {
            otrad_5_rad_disable();
            otrad_4_rad_disable();
            otrad_3_rad_disable();
        }
        else if(size <= 12)
        {
            otrad_5_rad_disable();
            otrad_4_rad_disable();
        }
        else if(size <= 16)
            otrad_5_rad_disable();

        for(var i = 0; i < size; i++)
        {
            if(i === 0)
                team_1_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 1)
                team_2_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 2)
                team_3_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 3)
                team_4_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 4)
                team_5_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 5)
                team_6_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 6)
                team_7_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 7)
                team_8_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 8)
                team_9_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 9)
                team_10_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 10)
                team_11_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 11)
                team_12_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 12)
                team_13_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 13)
                team_14_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 14)
                team_15_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 15)
                team_16_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 16)
                team_17_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 17)
                team_18_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 18)
                team_19_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
            else if(i === 19)
                team_20_image.source = global_settings.get_sourse_otrad(global_settings.get_otrad(i),global_settings.get_level_team());
        }
    }

    function repaint()
    {
        if(global_settings.get_can_buy_otrad_size() === 0)
        {
            orange_st_left.visible = false;
            orange_st_right.visible = false;
            text_cost.visible = false;
            add_otrad.visible = false;
            not_otard.visible = true;
        }
        else
        {
            not_otard.visible = false;
            image_add_otrad.source = global_settings.get_sourse_otrad(global_settings.get_can_buy_otrad(can_otrad_index),global_settings.get_level_team());
            orange_st_left.visible = false;
            if(global_settings.get_can_buy_otrad_size() === 1)
                orange_st_right.visible = false;
        }

        if((global_settings.get_point_1() !== 0) || (global_settings.get_point_2() !== 0) || (global_settings.get_point_3() !== 0))
            up.source = "file:///" + applicationDirPath + "/image/army/up.jpg";
        else
            up.source = "file:///" + applicationDirPath + "/image/army/up_black.jpg";
    }

    Rectangle
    {
        id: middle
        width: parent.width * 0.35
        height: parent.height
        color: "black"
        anchors.left: parent.left

        Text
        {
            id: text_level_team
            width: middle.width
            height: middle.height * 0.05
            anchors.top: middle.top
            anchors.topMargin: middle.height * 0.005
            anchors.left: middle.left
            color:"yellow"
            text:qsTr("Уровень команды: " + global_settings.get_level_team())
            font.family: "Segoe Print"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 17
            fontSizeMode: Text.Fit
            minimumPointSize: 8
        }

        Text
        {
            id: text_exp
            width: middle.width
            height: middle.height * 0.05
            anchors.top: text_level_team.bottom
            anchors.left: middle.left
            color:"white"
            text:qsTr("Опыт команды:")
            font.family: "Segoe Print"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            fontSizeMode: Text.Fit
            minimumPointSize: 8
        }

        Bar
        {
            id: pro_bar
            width: middle.width * 0.7
            height: middle.height * 0.0225
            anchors.top: text_exp.bottom
            anchors.horizontalCenter: middle.horizontalCenter
        }

        Rectangle
        {
            id: border_imag
            width: middle.width * 0.4
            height: border_imag.width
            anchors.top: pro_bar.bottom
            anchors.topMargin: middle.height * 0.03
            anchors.left: middle.left
            anchors.leftMargin: middle.width * 0.05
            border.color: "white"
            border.width: border_width

            Image
            {
                id: image_geroy
                width: border_imag.width - border_imag.border.width
                height: border_imag.height - border_imag.border.width
                anchors.centerIn: border_imag
                source: global_settings.get_image_geroy()
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(27);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    rect_move.visible = true;
                    rect_move.x = border_imag.x + mouse.x;
                    rect_move.y = border_imag.y + mouse.y;
                    rect_move_image.source = image_geroy.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,100); //100 индекс героя
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: border_up
            width: image_geroy.width * 0.5
            height: border_up.width
            anchors.right: middle.right
            anchors.rightMargin: middle.width * 0.175
            anchors.verticalCenter: border_imag.verticalCenter
            border.color: "white"
            border.width: border_width

            Image
            {
                id: up
                width: border_up.width - (border_up.border.width)
                height: border_up.height - (border_up.border.width)
                anchors.centerIn: border_up

                MouseArea
                {
                    anchors.fill: parent
                    hoverEnabled: true

                    onHoveredChanged: border_up.border.color = "green";

                    onExited: border_up.border.color = "white";

                    onClicked: item_loader_windows.settings_select("up_level.qml");
                }
            }
        }

        Text
        {
            id: text_static
            width: middle.width
            height: middle.height * 0.05
            anchors.top: border_imag.bottom
            anchors.topMargin: middle.height * 0.005
            anchors.left: middle.left
            color:"yellow"
            text:qsTr("Команда:")
            font.family: "Segoe Print"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 17
            fontSizeMode: Text.Fit
            minimumPointSize: 8
        }

        Rectangle
        {
            id: team_1
            width: middle.width * 0.2
            height: team_1.width
            anchors.top: text_static.bottom
            anchors.topMargin: middle.height * 0.01
            anchors.left: middle.left
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_1_image
                width: team_1.width - (team_1.border.width)
                height: team_1.height - (team_1.border.width)
                anchors.centerIn: team_1
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(1);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 1)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_1.x + mouse.x;
                    rect_move.y = team_1.y + mouse.y;
                    rect_move_image.source = team_1_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,0);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_2
            width: middle.width * 0.2
            height: team_2.width
            anchors.top: text_static.bottom
            anchors.topMargin: middle.height * 0.01
            anchors.left: team_1.right
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_2_image
                width: team_2.width - (team_2.border.width)
                height: team_2.height - (team_2.border.width)
                anchors.centerIn: team_2
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(2);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 2)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_2.x + mouse.x;
                    rect_move.y = team_2.y + mouse.y;
                    rect_move_image.source = team_2_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,1);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_3
            width: middle.width * 0.2
            height: team_3.width
            anchors.top: text_static.bottom
            anchors.topMargin: middle.height * 0.01
            anchors.left: team_2.right
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_3_image
                width: team_3.width - (team_3.border.width)
                height: team_3.height - (team_3.border.width)
                anchors.centerIn: team_3
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(3);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 3)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_3.x + mouse.x;
                    rect_move.y = team_3.y + mouse.y;
                    rect_move_image.source = team_3_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,2);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_4
            width: middle.width * 0.2
            height: team_4.width
            anchors.top: text_static.bottom
            anchors.topMargin: middle.height * 0.01
            anchors.left: team_3.right
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_4_image
                width: team_4.width - (team_4.border.width)
                height: team_4.height - (team_4.border.width)
                anchors.centerIn: team_4
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked:
                {
                    output_otrad(4);
                }
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 4)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_4.x + mouse.x;
                    rect_move.y = team_4.y + mouse.y;
                    rect_move_image.source = team_4_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,3);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_5
            width: middle.width * 0.2
            height: team_5.width
            anchors.top: team_1.bottom
            anchors.topMargin: middle.height * 0.02
            anchors.left: middle.left
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_5_image
                width: team_5.width - (team_5.border.width)
                height: team_5.height - (team_5.border.width)
                anchors.centerIn: team_5
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(5);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 5)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_5.x + mouse.x;
                    rect_move.y = team_5.y + mouse.y;
                    rect_move_image.source = team_5_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,4);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_6
            width: middle.width * 0.2
            height: team_6.width
            anchors.top: team_2.bottom
            anchors.topMargin: middle.height * 0.02
            anchors.left: team_5.right
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_6_image
                width: team_6.width - (team_6.border.width)
                height: team_6.height - (team_6.border.width)
                anchors.centerIn: team_6
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(6);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 6)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_6.x + mouse.x;
                    rect_move.y = team_6.y + mouse.y;
                    rect_move_image.source = team_6_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,5);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_7
            width: middle.width * 0.2
            height: team_7.width
            anchors.top: team_3.bottom
            anchors.topMargin: middle.height * 0.02
            anchors.left: team_6.right
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_7_image
                width: team_7.width - (team_7.border.width)
                height: team_7.height - (team_7.border.width)
                anchors.centerIn: team_7
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(7);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 7)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_7.x + mouse.x;
                    rect_move.y = team_7.y + mouse.y;
                    rect_move_image.source = team_7_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,6);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_8
            width: middle.width * 0.2
            height: team_8.width
            anchors.top: team_4.bottom
            anchors.topMargin: middle.height * 0.02
            anchors.left: team_7.right
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_8_image
                width: team_8.width - (team_8.border.width)
                height: team_8.height - (team_8.border.width)
                anchors.centerIn: team_8
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(8);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 8)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_8.x + mouse.x;
                    rect_move.y = team_8.y + mouse.y;
                    rect_move_image.source = team_8_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,7);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_9
            width: middle.width * 0.2
            height: team_9.width
            anchors.top: team_5.bottom
            anchors.topMargin: middle.height * 0.02
            anchors.left: middle.left
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_9_image
                width: team_9.width - (team_9.border.width)
                height: team_9.height - (team_9.border.width)
                anchors.centerIn: team_9
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(9);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 9)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_9.x + mouse.x;
                    rect_move.y = team_9.y + mouse.y;
                    rect_move_image.source = team_9_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,8);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_10
            width: middle.width * 0.2
            height: team_10.width
            anchors.top: team_6.bottom
            anchors.topMargin: middle.height * 0.02
            anchors.left: team_9.right
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_10_image
                width: team_10.width - (team_10.border.width)
                height: team_10.height - (team_10.border.width)
                anchors.centerIn: team_10
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(10);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 10)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_10.x + mouse.x;
                    rect_move.y = team_10.y + mouse.y;
                    rect_move_image.source = team_10_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,9);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_11
            width: middle.width * 0.2
            height: team_11.width
            anchors.top: team_7.bottom
            anchors.topMargin: middle.height * 0.02
            anchors.left: team_10.right
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_11_image
                width: team_11.width - (team_11.border.width)
                height: team_11.height - (team_11.border.width)
                anchors.centerIn: team_11
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(11);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 11)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_11.x + mouse.x;
                    rect_move.y = team_11.y + mouse.y;
                    rect_move_image.source = team_11_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,10);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_12
            width: middle.width * 0.2
            height: team_12.width
            anchors.top: team_8.bottom
            anchors.topMargin: middle.height * 0.02
            anchors.left: team_11.right
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_12_image
                width: team_12.width - (team_12.border.width)
                height: team_12.height - (team_12.border.width)
                anchors.centerIn: team_12
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(12);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 12)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_12.x + mouse.x;
                    rect_move.y = team_12.y + mouse.y;
                    rect_move_image.source = team_12_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,11);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_13
            width: middle.width * 0.2
            height: team_13.width
            anchors.top: team_9.bottom
            anchors.topMargin: middle.height * 0.02
            anchors.left: middle.left
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_13_image
                width: team_13.width - (team_13.border.width)
                height: team_13.height - (team_13.border.width)
                anchors.centerIn: team_13
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(13);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 13)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_13.x + mouse.x;
                    rect_move.y = team_13.y + mouse.y;
                    rect_move_image.source = team_13_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,12);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_14
            width: middle.width * 0.2
            height: team_14.width
            anchors.top: team_10.bottom
            anchors.topMargin: middle.height * 0.02
            anchors.left: team_13.right
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_14_image
                width: team_14.width - (team_14.border.width)
                height: team_14.height - (team_14.border.width)
                anchors.centerIn: team_14
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(14);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 14)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_14.x + mouse.x;
                    rect_move.y = team_14.y + mouse.y;
                    rect_move_image.source = team_14_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,13);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_15
            width: middle.width * 0.2
            height: team_15.width
            anchors.top: team_11.bottom
            anchors.topMargin: middle.height * 0.02
            anchors.left: team_14.right
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_15_image
                width: team_15.width - (team_15.border.width)
                height: team_15.height - (team_15.border.width)
                anchors.centerIn: team_15
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(15);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 15)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_15.x + mouse.x;
                    rect_move.y = team_15.y + mouse.y;
                    rect_move_image.source = team_15_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,14);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_16
            width: middle.width * 0.2
            height: team_16.width
            anchors.top: team_12.bottom
            anchors.topMargin: middle.height * 0.02
            anchors.left: team_15.right
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_16_image
                width: team_16.width - (team_16.border.width)
                height: team_16.height - (team_16.border.width)
                anchors.centerIn: team_16
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(16);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 16)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_16.x + mouse.x;
                    rect_move.y = team_16.y + mouse.y;
                    rect_move_image.source = team_16_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,15);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_17
            width: middle.width * 0.2
            height: team_17.width
            anchors.top: team_13.bottom
            anchors.topMargin: middle.height * 0.02
            anchors.left: middle.left
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_17_image
                width: team_17.width - (team_17.border.width)
                height: team_17.height - (team_17.border.width)
                anchors.centerIn: team_17
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(17);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 17)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_17.x + mouse.x;
                    rect_move.y = team_17.y + mouse.y;
                    rect_move_image.source = team_17_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,16);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }


        Rectangle
        {
            id: team_18
            width: middle.width * 0.2
            height: team_18.width
            anchors.top: team_14.bottom
            anchors.topMargin: middle.height * 0.02
            anchors.left: team_17.right
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_18_image
                width: team_18.width - (team_18.border.width)
                height: team_18.height - (team_18.border.width)
                anchors.centerIn: team_18
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(18);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 18)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_18.x + mouse.x;
                    rect_move.y = team_18.y + mouse.y;
                    rect_move_image.source = team_18_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,17);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_19
            width: middle.width * 0.2
            height: team_19.width
            anchors.top: team_15.bottom
            anchors.topMargin: middle.height * 0.02
            anchors.left: team_18.right
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_19_image
                width: team_19.width - (team_19.border.width)
                height: team_19.height - (team_19.border.width)
                anchors.centerIn: team_19
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(19);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 19)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_19.x + mouse.x;
                    rect_move.y = team_19.y + mouse.y;
                    rect_move_image.source = team_19_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,18);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: team_20
            width: middle.width * 0.2
            height: team_20.width
            anchors.top: team_16.bottom
            anchors.topMargin: middle.height * 0.02
            anchors.left: team_19.right
            anchors.leftMargin: middle.width * 0.04
            border.color: "white"
            border.width: border_width

            Image
            {
                id: team_20_image
                width: team_20.width - (team_20.border.width)
                height: team_20.height - (team_20.border.width)
                anchors.centerIn: team_20
                source: "file:///" + applicationDirPath + "/image/army/closed.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(20);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    var size = global_settings.get_otrad_size();
                    if(size < 20)
                        return;
                    rect_move.visible = true;
                    rect_move.x = team_20.x + mouse.x;
                    rect_move.y = team_20.y + mouse.y;
                    rect_move_image.source = team_20_image.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        in_or_out(rect_move.x,rect_move.y,19);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }
    }

    Image
    {
        id: middle_kamen
        width: parent.width * 0.2
        height: parent.height
        anchors.left: middle.right
        fillMode: Image.TileHorizontally
        source: "file:///" + applicationDirPath + "/image/taktic_game/kamen.jpg"
    }

    Rectangle
    {
        id: position
        width: parent.width * 0.45
        height: parent.height
        anchors.left: middle_kamen.right
        color: "black"

        Text
        {
            id: text_position
            width: position.width
            height: position.height * 0.05
            anchors.top: position.top
            anchors.topMargin: position.height * 0.005
            anchors.left: position.left
            color:"yellow"
            text:qsTr("Расстановка команды:")
            font.family: "Segoe Print"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 17
            fontSizeMode: Text.Fit
            minimumPointSize: 8
        }

        Text
        {
            id: text_2_rad
            width: position.width * 0.5
            height: position.height * 0.05
            anchors.top: text_position.bottom
            anchors.left: position.left
            color:"white"
            text:qsTr("2-ряд")
            font.family: "Segoe Print"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            fontSizeMode: Text.Fit
            minimumPointSize: 8
        }

        Text
        {
            id: text_1_rad
            width: position.width * 0.5
            height: position.height * 0.05
            anchors.top: text_position.bottom
            anchors.left: text_2_rad.right
            color:"white"
            text:qsTr("1-ряд")
            font.family: "Segoe Print"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            fontSizeMode: Text.Fit
            minimumPointSize: 8
        }

        Rectangle
        {
            id: position_0_0
            width: position.width * 0.2
            height: position_0_0.width
            anchors.top: text_2_rad.bottom
            anchors.topMargin: position.height * 0.005
            anchors.horizontalCenter: text_2_rad.horizontalCenter
            border.color: "yellow"
            border.width: border_width

            Image
            {
                id: image_position_0_0
                width: position_0_0.width - (position_0_0.border.width)
                height: position_0_0.width - (position_0_0.border.width)
                anchors.centerIn: position_0_0
                source: "file:///" + applicationDirPath + "/image/army/add.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(21);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    if(global_settings.get_position_otrad(0,0) === "")
                        return;
                    rect_move.visible = true;
                    rect_move.x = middle.width + middle_kamen.width + position_0_0.x + mouse.x;
                    rect_move.y = position_0_0.y + mouse.y;
                    rect_move_image.source = image_position_0_0.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        var index;
                        var name = global_settings.get_position_otrad(0,0);
                        if(name === "")
                            return;
                        if(name === global_settings.get_name_geroy())
                            index = 100;
                        else
                            index = global_settings.get_index_otrad(name);

                        if(index === -1)
                            return;
                        in_or_out_v2(rect_move.x,rect_move.y,index,0,0);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: position_0_1
            width: position.width * 0.2
            height: position_0_1.width
            anchors.top: position_0_0.bottom
            anchors.topMargin: position.height * 0.02
            anchors.horizontalCenter: text_2_rad.horizontalCenter
            border.color: "yellow"
            border.width: border_width

            Image
            {
                id: image_position_0_1
                width: position_0_1.width - (position_0_1.border.width)
                height: position_0_1.width - (position_0_1.border.width)
                anchors.centerIn: position_0_1
                source: "file:///" + applicationDirPath + "/image/army/add.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(22);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    if(global_settings.get_position_otrad(0,1) === "")
                        return;
                    rect_move.visible = true;
                    rect_move.x = middle.width + middle_kamen.width + position_0_1.x + mouse.x;
                    rect_move.y = position_0_1.y + mouse.y;
                    rect_move_image.source = image_position_0_1.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        var index;
                        var name = global_settings.get_position_otrad(0,1);
                        if(name === "")
                            return;
                        if(name === global_settings.get_name_geroy())
                            index = 100;
                        else
                            index = global_settings.get_index_otrad(name);

                        if(index === -1)
                            return;
                        in_or_out_v2(rect_move.x,rect_move.y,index,0,1);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: position_0_2
            width: position.width * 0.2
            height: position_0_2.width
            anchors.top: position_0_1.bottom
            anchors.topMargin: position.height * 0.02
            anchors.horizontalCenter: text_2_rad.horizontalCenter
            border.color: "yellow"
            border.width: border_width

            Image
            {
                id: image_position_0_2
                width: position_0_2.width - (position_0_2.border.width)
                height: position_0_2.width - (position_0_2.border.width)
                anchors.centerIn: position_0_2
                source: "file:///" + applicationDirPath + "/image/army/add.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(23);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    if(global_settings.get_position_otrad(0,2) === "")
                        return;
                    rect_move.visible = true;
                    rect_move.x = middle.width + middle_kamen.width + position_0_2.x + mouse.x;
                    rect_move.y = position_0_2.y + mouse.y;
                    rect_move_image.source = image_position_0_2.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        var index;
                        var name = global_settings.get_position_otrad(0,2);
                        if(name === "")
                            return;
                        if(name === global_settings.get_name_geroy())
                            index = 100;
                        else
                            index = global_settings.get_index_otrad(name);

                        if(index === -1)
                            return;
                        in_or_out_v2(rect_move.x,rect_move.y,index,0,2);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: position_1_0
            width: position.width * 0.2
            height: position_1_0.width
            anchors.top: text_1_rad.bottom
            anchors.topMargin: position.height * 0.005
            anchors.horizontalCenter: text_1_rad.horizontalCenter
            border.color: "yellow"
            border.width: border_width

            Image
            {
                id: image_position_1_0
                width: position_1_0.width - (position_1_0.border.width)
                height: position_1_0.width - (position_1_0.border.width)
                anchors.centerIn: position_1_0
                source: "file:///" + applicationDirPath + "/image/army/add.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(24);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    if(global_settings.get_position_otrad(1,0) === "")
                        return;
                    rect_move.visible = true;
                    rect_move.x = middle.width + middle_kamen.width + position_1_0.x + mouse.x;
                    rect_move.y = position_1_0.y + mouse.y;
                    rect_move_image.source = image_position_1_0.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        var index;
                        var name = global_settings.get_position_otrad(1,0);
                        if(name === "")
                            return;
                        if(name === global_settings.get_name_geroy())
                            index = 100;
                        else
                            index = global_settings.get_index_otrad(name);

                        if(index === -1)
                            return;
                        in_or_out_v2(rect_move.x,rect_move.y,index,1,0);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: position_1_1
            width: position.width * 0.2
            height: position_1_1.width
            anchors.top: position_1_0.bottom
            anchors.topMargin: position.height * 0.02
            anchors.horizontalCenter: text_1_rad.horizontalCenter
            border.color: "yellow"
            border.width: border_width

            Image
            {
                id: image_position_1_1
                width: position_1_1.width - (position_1_1.border.width)
                height: position_1_1.width - (position_1_1.border.width)
                anchors.centerIn: position_1_1
                source: "file:///" + applicationDirPath + "/image/army/add.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(25);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    if(global_settings.get_position_otrad(1,1) === "")
                        return;
                    rect_move.visible = true;
                    rect_move.x = middle.width + middle_kamen.width + position_1_1.x + mouse.x;
                    rect_move.y = position_1_1.y + mouse.y;
                    rect_move_image.source = image_position_1_1.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        var index;
                        var name = global_settings.get_position_otrad(1,1);
                        if(name === "")
                            return;
                        if(name === global_settings.get_name_geroy())
                            index = 100;
                        else
                            index = global_settings.get_index_otrad(name);

                        if(index === -1)
                            return;
                        in_or_out_v2(rect_move.x,rect_move.y,index,1,1);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Rectangle
        {
            id: position_1_2
            width: position.width * 0.2
            height: position_1_2.width
            anchors.top: position_1_1.bottom
            anchors.topMargin: position.height * 0.02
            anchors.horizontalCenter: text_1_rad.horizontalCenter
            border.color: "yellow"
            border.width: border_width

            Image
            {
                id: image_position_1_2
                width: position_1_2.width - (position_1_2.border.width)
                height: position_1_2.width - (position_1_2.border.width)
                anchors.centerIn: position_1_2
                source: "file:///" + applicationDirPath + "/image/army/add.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(26);
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton

                onPositionChanged:
                {
                    if(global_settings.get_position_otrad(1,2) === "")
                        return;
                    rect_move.visible = true;
                    rect_move.x = middle.width + middle_kamen.width + position_1_2.x + mouse.x;
                    rect_move.y = position_1_2.y + mouse.y;
                    rect_move_image.source = image_position_1_2.source;
                }

                onPressedChanged:
                {
                    if(pressed === false)
                    {
                        var index;
                        var name = global_settings.get_position_otrad(1,2);
                        if(name === "")
                            return;
                        if(name === global_settings.get_name_geroy())
                            index = 100;
                        else
                            index = global_settings.get_index_otrad(name);

                        if(index === -1)
                            return;
                        in_or_out_v2(rect_move.x,rect_move.y,index,1,2);
                        rect_move.visible = false;
                        rect_move.x = 0;
                        rect_move.y = 0;
                    }
                }
            }
        }

        Text
        {
            id: text_otrad
            width: position.width
            height: position.height * 0.05
            anchors.top: position_1_2.bottom
            anchors.topMargin: position.height * 0.03
            anchors.left: position.left
            color:"yellow"
            text:qsTr("Нанять отряд:")
            font.family: "Segoe Print"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 17
            fontSizeMode: Text.Fit
            minimumPointSize: 8
        }

        Rectangle
        {
            id: add_otrad
            width: position.width * 0.2
            height: add_otrad.width
            anchors.top: text_otrad.bottom
            anchors.topMargin: position.height * 0.02
            anchors.horizontalCenter: position.horizontalCenter
            border.color: "green"
            border.width: border_width

            Image
            {
                id: image_add_otrad
                width: add_otrad.width - (add_otrad.border.width)
                height: add_otrad.width - (add_otrad.border.width)
                anchors.centerIn: add_otrad
                source: "file:///" + applicationDirPath + "/image/army/add.jpg"
            }

            MouseArea
            {
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: output_otrad(28 + can_otrad_index);
            }
        }

        Image
        {
            id: orange_st_right
            width: add_otrad.width
            height: orange_st_right.width
            anchors.horizontalCenter: position_1_2.horizontalCenter
            anchors.verticalCenter: add_otrad.verticalCenter
            source: "file:///" + applicationDirPath + "/image/army/orange_st.png"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    orange_st_right.width *= 1.1;
                    orange_st_right.height *= 1.1;
                }
                onExited:
                {
                    orange_st_right.width = add_otrad.width;
                    orange_st_right.height = orange_st_right.width;
                }
                onClicked:
                {
                    can_otrad_index++;
                    orange_st_left.visible = true;
                    image_add_otrad.source = global_settings.get_sourse_otrad(global_settings.get_can_buy_otrad(can_otrad_index),global_settings.get_level_team());
                    if(global_settings.get_can_buy_otrad_size() === (can_otrad_index + 1))
                    {
                        orange_st_right.visible = false;
                    }
                }
            }
        }

        Image
        {
            id: orange_st_left
            width: add_otrad.width
            height: orange_st_left.width
            anchors.horizontalCenter: position_0_2.horizontalCenter
            anchors.verticalCenter: add_otrad.verticalCenter
            rotation: 180
            source: "file:///" + applicationDirPath + "/image/army/orange_st.png"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    orange_st_left.width *= 1.1;
                    orange_st_left.height *= 1.1;
                }
                onExited:
                {
                    orange_st_left.width = add_otrad.width;
                    orange_st_left.height = orange_st_left.width;
                }
                onClicked:
                {
                    can_otrad_index--;
                    orange_st_right.visible = true;
                    image_add_otrad.source = global_settings.get_sourse_otrad(global_settings.get_can_buy_otrad(can_otrad_index),global_settings.get_level_team());
                    if(can_otrad_index === 0)
                    {
                        orange_st_left.visible = false;
                    }
                }
            }
        }

        Text
        {
            id: text_cost
            width: position.width
            height: position.height * 0.05
            anchors.top: add_otrad.bottom
            anchors.topMargin: position.height * 0.03
            anchors.left: position.left
            color: "lightgreen"
            text:qsTr("Нанять за 100 золотых")
            font.family: "Segoe Print"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 17
            fontSizeMode: Text.Fit
            minimumPointSize: 8

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    var many = global_settings.get_resurs("gold");
                    if(many >= 100)
                        text_cost.color = "green";
                }
                onExited:
                {
                    text_cost.color = "lightgreen";
                }
                onClicked:
                {
                    var many = global_settings.get_resurs("gold");
                    if(many >= 100)
                    {
                        global_settings.add_otrad(global_settings.get_can_buy_otrad(can_otrad_index));
                        global_settings.remove_can_buy_otrad(can_otrad_index);
                        can_otrad_index = 0;
                        global_settings.set_resurs("gold",(many - 100));
                        update_resurs();
                        repaint();
                        otrad_repaint();
                    }
                }
            }
        }

        Text
        {
            id: not_otard
            width: parent.width
            height: parent.height * 0.05
            anchors.centerIn: add_otrad
            color:"red"
            text:qsTr("Отсутствует отряд для найма")
            font.family: "Segoe Print"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 17
            fontSizeMode: Text.Fit
            minimumPointSize: 8
        }
    }

    Property_otrad
    {
        id: pro_otrad
    }

    Rectangle
    {
        id: rect_move
        width: middle.width * 0.2
        height: rect_move.width
        border.color: "white"
        border.width: 5
        visible: false

        Image
        {
            id: rect_move_image
            width: rect_move.width - (rect_move.border.width)
            height: rect_move.height - (rect_move.border.width)
            anchors.centerIn: rect_move
        }
    }
}

