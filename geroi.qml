import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

Rectangle  //начало игры выбор героя
{
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    visible: true

    Component
    {
        id:style_orange
        TextFieldStyle
        {
            background: Rectangle
            {
                color: "orange"
                radius: input_name.height * 0.3
            }
        }
    }

    Component
    {
        id:style_green
        TextFieldStyle
        {
            background: Rectangle
            {
                color: "green"
                radius: input_name.height * 0.3
            }
        }
    }

    Item
    {
        id: settings

        property int number: 1

        function settings_voin()
        {
            label_class_text.text = "Воин";
            label_type_damage_text.text = "Оружие";
            label_ver_damage_text.text = "80%";
            label_damage_text.text = "50";
            label_life_text.text = "350";
            label_bron_text.text = "0";
            label_inishiativa_text.text = "50";
            label_shel_text.text = "1";
            label_zashita_text.text = "Нет";
            label_immunitet_text.text = "Нет";
            label_shel_atack_text.text = "1-ряд";
            opisanie_text.text = "В идеале владеет холодным оружием, а дополнительные навыки только это подчеркивают. Вся сила " +
                                 "и ярость атак направлена на ближайших врагов."
        }

        function settings_lushnik()
        {
            label_class_text.text = "Лучник";
            label_type_damage_text.text = "Оружие";
            label_ver_damage_text.text = "80%";
            label_damage_text.text = "35";
            label_life_text.text = "300";
            label_bron_text.text = "0";
            label_inishiativa_text.text = "55";
            label_shel_text.text = "1";
            label_zashita_text.text = "Нет";
            label_immunitet_text.text = "Нет";
            label_shel_atack_text.text = "Любой ряд";
            opisanie_text.text = "Нет соперника, который был бы недоступен для его атаки. Лучник истребляет неудобных оппонентов, делая " +
                                 "победу все ближе."
        }

        function settings_mag()
        {
            label_class_text.text = "Маг";
            label_type_damage_text.text = "Молния";
            label_ver_damage_text.text = "80%";
            label_damage_text.text = "20";
            label_life_text.text = "250";
            label_bron_text.text = "0";
            label_inishiativa_text.text = "45";
            label_shel_text.text = "6";
            label_zashita_text.text = "Нет";
            label_immunitet_text.text = "Нет";
            label_shel_atack_text.text = "Все";
            opisanie_text.text = "Обрушивает атаки на всю армию противника. Имеет массу вспомогательных навыков, что делает его просто не заменимым в команде."
        }
    }

    Image
    {
        id: main_image
        width: parent.width
        height: parent.height
        source: "/person/image/person/fon_geroi.jpg"

        Label
        {
            id: top_text
            anchors.horizontalCenter: main_image.horizontalCenter
            color:"black"
            text:qsTr("Выберите героя")
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 27
        }

        Image
        {
            id: select_image
            width: main_image.width * 0.3
            height: main_image.height * 0.3
            anchors.top: top_text.bottom
            anchors.horizontalCenter: main_image.horizontalCenter
            source: "/person/image/person/person_geroi_voin.jpg"
        }


        Image
        {
            id: left_st
            width: select_image.width * 0.4
            height: select_image.height * 0.4
            anchors.right: select_image.left
            anchors.verticalCenter: select_image.verticalCenter
            source: "/person/image/person/green_st.png"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    parent.width = select_image.width * 0.45
                    parent.height = select_image.height * 0.45
                }
                onExited:
                {
                    parent.width = select_image.width * 0.4
                    parent.height = select_image.height * 0.4
                }
                onClicked:
                {
                    settings.number--;
                    if(settings.number < 0) {settings.number = 0;return;}
                    else if(settings.number == 0)
                    {
                        select_image.source = "/person/image/person/person_geroi_lush.jpg";
                        left_st.source = "/person/image/person/red_st.png";
                        left_st.rotation = 180;
                        settings.settings_lushnik();
                    }
                    else if(settings.number == 1)
                    {
                        select_image.source = "/person/image/person/person_geroi_voin.jpg";
                        right_st.source = "/person/image/person/green_st.png";
                        right_st.rotation = 180;
                        settings.settings_voin();
                    }
                }
            }
        }

        Image
        {
            id: right_st
            width: select_image.width * 0.4
            height: select_image.height * 0.4
            anchors.left: select_image.right
            anchors.verticalCenter: select_image.verticalCenter
            source: "/person/image/person/green_st.png"
            rotation: 180

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    parent.width = select_image.width * 0.45
                    parent.height = select_image.height * 0.45
                }
                onExited:
                {
                    parent.width = select_image.width * 0.4
                    parent.height = select_image.height * 0.4
                }
                onClicked:
                {
                    settings.number++;
                    if(settings.number > 2) {settings.number = 2;return;}
                    else if(settings.number == 2)
                    {
                        select_image.source = "/person/image/person/person_geroi_mag.jpg";
                        right_st.source = "/person/image/person/red_st.png";
                        right_st.rotation = 0
                        settings.settings_mag();
                    }
                    else if(settings.number == 1)
                    {
                        select_image.source = "/person/image/person/person_geroi_voin.jpg";
                        left_st.source = "/person/image/person/green_st.png";
                        left_st.rotation = 0;
                        settings.settings_voin();
                    }
                }
            }
        }

        Rectangle
        {
            id:left_rect
            width: main_image.width * 0.45
            height: main_image.height * 0.4
            color: "grey"
            anchors.top: select_image.bottom
            anchors.left: main_image.left
            anchors.leftMargin: main_image.width * 0.02
            anchors.topMargin: main_image.height * 0.03
            radius: 20
            border.width: 2
            border.color: "black"

            ///////////////////////////////////////////////////////////////
            Label
            {
                id: label_class
                color:"blue"
                text:qsTr("Класс:")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: left_rect.top
                anchors.topMargin: left_rect.height * 0.03
                anchors.left: left_rect.left
                anchors.leftMargin: left_rect.width * 0.03
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
            }
            //////////////////////
            Label
            {
                id: label_class_text
                color:"blue"
                text:qsTr("Воин")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: left_rect.top
                anchors.topMargin: left_rect.height * 0.03
                x: left_rect.x + (left_rect.width * 0.7)
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
                width: left_rect.width * 0.3
            }
            ///////////////////////////////////////////////////////////////
            Label
            {
                id: label_type_damage
                color:"black"
                text:qsTr("Тип урона:")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_class.bottom
                anchors.topMargin: left_rect.height * 0.005
                anchors.left: left_rect.left
                anchors.leftMargin: left_rect.width * 0.03
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
            }
            //////////////////////
            Label
            {
                id: label_type_damage_text
                color:"black"
                text:qsTr("Оружие")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_class_text.bottom
                anchors.topMargin: left_rect.height * 0.005
                x: left_rect.x + (left_rect.width * 0.7)
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
                width: left_rect.width * 0.3
            }
            ///////////////////////////////////////////////////////////////
            Label
            {
                id: label_ver_damage
                color:"black"
                text:qsTr("Вероятность попадения:")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_type_damage.bottom
                anchors.topMargin: left_rect.height * 0.005
                anchors.left: left_rect.left
                anchors.leftMargin: left_rect.width * 0.03
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
            }
            //////////////////////
            Label
            {
                id: label_ver_damage_text
                color:"black"
                text:qsTr("80%")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_type_damage_text.bottom
                anchors.topMargin: left_rect.height * 0.005
                x: left_rect.x + (left_rect.width * 0.7)
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
                width: left_rect.width * 0.3
            }
            ///////////////////////////////////////////////////////////////
            Label
            {
                id: label_damage
                color:"black"
                text:qsTr("Урон:")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_ver_damage.bottom
                anchors.topMargin: left_rect.height * 0.005
                anchors.left: left_rect.left
                anchors.leftMargin: left_rect.width * 0.03
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
            }
            //////////////////////
            Label
            {
                id: label_damage_text
                color:"black"
                text:qsTr("50")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_ver_damage_text.bottom
                anchors.topMargin: left_rect.height * 0.005
                x: left_rect.x + (left_rect.width * 0.7)
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
                width: left_rect.width * 0.3
            }
            ///////////////////////////////////////////////////////////////
            Label
            {
                id: label_life
                color:"red"
                text:qsTr("Жизнь:")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_damage.bottom
                anchors.topMargin: left_rect.height * 0.005
                anchors.left: left_rect.left
                anchors.leftMargin: left_rect.width * 0.03
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
            }
            //////////////////////
            Label
            {
                id: label_life_text
                color:"red"
                text:qsTr("350")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_damage_text.bottom
                anchors.topMargin: left_rect.height * 0.005
                x: left_rect.x + (left_rect.width * 0.7)
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
                width: left_rect.width * 0.3
            }
            ///////////////////////////////////////////////////////////////
            Label
            {
                id: label_bron
                color:"black"
                text:qsTr("Броня:")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_life.bottom
                anchors.topMargin: left_rect.height * 0.005
                anchors.left: left_rect.left
                anchors.leftMargin: left_rect.width * 0.03
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
            }
            //////////////////////
            Label
            {
                id: label_bron_text
                color:"black"
                text:qsTr("0")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_life_text.bottom
                anchors.topMargin: left_rect.height * 0.005
                x: left_rect.x + (left_rect.width * 0.7)
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
                width: left_rect.width * 0.3
            }
            ///////////////////////////////////////////////////////////////
            Label
            {
                id: label_inishiativa
                color:"black"
                text:qsTr("Инициатива:")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_bron.bottom
                anchors.topMargin: left_rect.height * 0.005
                anchors.left: left_rect.left
                anchors.leftMargin: left_rect.width * 0.03
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
            }
            //////////////////////
            Label
            {
                id: label_inishiativa_text
                color:"black"
                text:qsTr("50")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_bron_text.bottom
                anchors.topMargin: left_rect.height * 0.005
                x: left_rect.x + (left_rect.width * 0.7)
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
                width: left_rect.width * 0.3
            }
            ///////////////////////////////////////////////////////////////
            Label
            {
                id: label_shel
                color:"black"
                text:qsTr("Цель:")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_inishiativa.bottom
                anchors.topMargin: left_rect.height * 0.005
                anchors.left: left_rect.left
                anchors.leftMargin: left_rect.width * 0.03
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
            }
            //////////////////////
            Label
            {
                id: label_shel_text
                color:"black"
                text:qsTr("1")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_inishiativa_text.bottom
                anchors.topMargin: left_rect.height * 0.005
                x: left_rect.x + (left_rect.width * 0.7)
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
                width: left_rect.width * 0.3
            }
            ///////////////////////////////////////////////////////////////
            Label
            {
                id: label_zashita
                color:"black"
                text:qsTr("Защита:")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_shel.bottom
                anchors.topMargin: left_rect.height * 0.005
                anchors.left: left_rect.left
                anchors.leftMargin: left_rect.width * 0.03
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
            }
            //////////////////////
            Label
            {
                id: label_zashita_text
                color:"black"
                text:qsTr("Нет")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_shel_text.bottom
                anchors.topMargin: left_rect.height * 0.005
                x: left_rect.x + (left_rect.width * 0.7)
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
                width: left_rect.width * 0.3
            }
            ///////////////////////////////////////////////////////////////
            Label
            {
                id: label_immunitet
                color:"yellow"
                text:qsTr("Иммунитет:")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_zashita.bottom
                anchors.topMargin: left_rect.height * 0.005
                anchors.left: left_rect.left
                anchors.leftMargin: left_rect.width * 0.03
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
            }
            //////////////////////
            Label
            {
                id: label_immunitet_text
                color:"yellow"
                text:qsTr("Нет")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_zashita_text.bottom
                anchors.topMargin: left_rect.height * 0.005
                x: left_rect.x + (left_rect.width * 0.7)
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
                width: left_rect.width * 0.3
            }
            ///////////////////////////////////////////////////////////////
            Label
            {
                id: label_shel_atack
                color:"black"
                text:qsTr("Цель атак:")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_immunitet.bottom
                anchors.topMargin: left_rect.height * 0.005
                anchors.left: left_rect.left
                anchors.leftMargin: left_rect.width * 0.03
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
            }
            //////////////////////
            Label
            {
                id: label_shel_atack_text
                color:"black"
                text:qsTr("1-ряд")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 13
                anchors.top: label_immunitet_text.bottom
                anchors.topMargin: left_rect.height * 0.005
                x: left_rect.x + (left_rect.width * 0.7)
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: left_rect.height * 0.08
                width: left_rect.width * 0.3
            }
            ///////////////////////////////////////////////////////////////
        }
        Rectangle
        {
            id:right_rect
            width: main_image.width * 0.45
            height: main_image.height * 0.4
            color: "grey"
            anchors.top: select_image.bottom
            anchors.right: main_image.right
            anchors.rightMargin: main_image.width * 0.02
            anchors.topMargin: main_image.height * 0.03
            radius: 20
            border.width: 2
            border.color: "black"

            Label
            {
                id: opisanie
                color: "black"
                text: qsTr("Описание:")
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 17
                anchors.horizontalCenter: right_rect.horizontalCenter
                anchors.topMargin: right_rect.height * 0.005
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                height: right_rect.height * 0.12
            }

            Label
            {
                id: opisanie_text
                color: "blue"
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 14

                anchors.top: opisanie.bottom
                anchors.bottom: right_rect.bottom
                anchors.bottomMargin: right_rect.height * 0.05
                anchors.left: right_rect.left
                anchors.leftMargin: right_rect.width * 0.05
                anchors.right: right_rect.right
                anchors.rightMargin: right_rect.width * 0.05
                wrapMode: TextEdit.WordWrap
                text: qsTr("В идеале владеет холодным оружием, а дополнительные навыки только это подчеркивают. Вся сила " +
                           "и ярость атак направлена на ближайших врагов.")
            }
        }

        TextField
        {
            id:input_name
            anchors.horizontalCenter: main_image.horizontalCenter
            y: main_image.height * 0.9
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 14
            horizontalAlignment: Text.AlignHCenter
            maximumLength: 8
            validator: RegExpValidator {regExp:/[a-zA-Z]{8}/}
            style: style_orange
            focus: true

            onDisplayTextChanged:
            {
                if(input_name.displayText == "")
                {
                    input_name.style = style_orange;
                    button_start.visible = false;
                    button_start_text.visible = false;
                }
                else
                {
                    input_name.style = style_green;
                    button_start.visible = true;
                    button_start_text.visible = true;
                }
            }
        }

        Label
        {
            id: input_name_const
            color: "yellow"
            text: qsTr("Введите имя(EN):")
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 17
            anchors.right: input_name.left
            y: main_image.height * 0.9
            fontSizeMode: Text.Fit
            minimumPointSize: 8
            height: right_rect.height * 0.12
        }

        Style_files
        {
            id:button_start
            visible: false
            height: input_name.height
            width: input_name.width
            anchors.right: right_rect.right
            y: main_image.height * 0.9

            onClicked:
            {
                global_settings.set_name_geroy(label_class_text.text + ":" + input_name.text);

                if(label_class_text.text == "Воин")  //ставим изначальные показатели
                {
                    global_settings.set_point_sila(15);
                    global_settings.set_point_lovkost(10);
                    global_settings.set_point_energy(10);
                }
                else if(label_class_text.text == "Лучник")
                {
                    global_settings.set_point_sila(10);
                    global_settings.set_point_lovkost(15);
                    global_settings.set_point_energy(10);
                }
                else if(label_class_text.text == "Маг")
                {
                    global_settings.set_point_sila(10);
                    global_settings.set_point_lovkost(10);
                    global_settings.set_point_energy(15);
                }
                global_settings.set_point_life(20);

                global_settings.set_level_game(1);
                global_settings.set_level_team(1);
                global_settings.set_number_date(1);
                global_settings.set_exp(0);
                global_settings.set_resurs("gold",1000);
                global_settings.set_resurs("ruda",5);
                item_loader_windows.settings_select("history.qml");
            }
        }

        Text
        {
            id:button_start_text
            visible: false
            anchors.centerIn: button_start
            color:"white"
            text:qsTr("Далее")
            font.family: "Segoe Print"
            font.pointSize: 17
            fontSizeMode: Text.Fit
            minimumPointSize: 8
        }
    }
}
