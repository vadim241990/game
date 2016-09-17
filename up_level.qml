import QtQuick 2.0
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

Rectangle //вступительная заставка к новому уровню
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

    property bool var_init: false
    property string name_magic: ""

    function remove_anchors()
    {
        opisanie_2.anchors.left = undefined;
        opisanie_2.anchors.right = undefined;
        opisanie_2.anchors.top = undefined;
        opisanie_2.anchors.bottom = undefined;

        opisanie_2.anchors.leftMargin = undefined;
        opisanie_2.anchors.rightMargin = undefined;
        opisanie_2.anchors.topMargin = undefined;
        opisanie_2.anchors.bottomMargin = undefined;

        opisanie_2.anchors.horizontalCenter = undefined;
        opisanie_2.anchors.verticalCenter = undefined;
    }

    function show_left()
    {
        left_1.visible = false;
        left_2_1.visible = false;
        left_2_2.visible = false;
        left_3_1.visible = false;
        left_3_2.visible = false;
        left_3_3.visible = false;
        left_4_1.visible = false;
        left_4_2.visible = false;
        left_4_3.visible = false;
        left_4_4.visible = false;

        remove_anchors();
        opisanie_2.anchors.verticalCenter = rect_main.verticalCenter;
        opisanie_2.anchors.right = rect_main.left;
        opisanie_2.anchors.rightMargin = fon.height * 0.1;
        opisanie_2.visible = true;
    }

    function disable_left()
    {
        left_1.visible = true;
        left_2_1.visible = true;
        left_2_2.visible = true;
        left_3_1.visible = true;
        left_3_2.visible = true;
        left_3_3.visible = true;
        left_4_1.visible = true;
        left_4_2.visible = true;
        left_4_3.visible = true;
        left_4_4.visible = true;

        opisanie_2.visible = false;
    }

    function show_right()
    {
        right_1.visible = false;
        right_2_1.visible = false;
        right_2_2.visible = false;
        right_3_1.visible = false;
        right_3_2.visible = false;
        right_3_3.visible = false;
        right_4_1.visible = false;
        right_4_2.visible = false;
        right_4_3.visible = false;
        right_4_4.visible = false;

        remove_anchors();
        opisanie_2.visible = true;
        opisanie_2.anchors.verticalCenter = rect_main.verticalCenter;
        opisanie_2.anchors.left = rect_main.right;
        opisanie_2.anchors.leftMargin = fon.height * 0.1;
    }

    function disable_right()
    {
        right_1.visible = true;
        right_2_1.visible = true;
        right_2_2.visible = true;
        right_3_1.visible = true;
        right_3_2.visible = true;
        right_3_3.visible = true;
        right_4_1.visible = true;
        right_4_2.visible = true;
        right_4_3.visible = true;
        right_4_4.visible = true;

        opisanie_2.visible = false;
    }

    function show_top()
    {
        top_1.visible = false;
        top_2_1.visible = false;
        top_2_2.visible = false;
        top_3_1.visible = false;
        top_3_2.visible = false;
        top_3_3.visible = false;

        remove_anchors();
        opisanie_2.visible = true;
        opisanie_2.anchors.horizontalCenter = rect_main.horizontalCenter;
        opisanie_2.anchors.bottom = rect_main.top;
        opisanie_2.anchors.bottomMargin = fon.height * 0.1;
    }

    function disable_top()
    {
        top_1.visible = true;
        top_2_1.visible = true;
        top_2_2.visible = true;
        top_3_1.visible = true;
        top_3_2.visible = true;
        top_3_3.visible = true;

        opisanie_2.visible = false;
    }

    function show_bottom()
    {
        bottom_1.visible = false;
        bottom_2_1.visible = false;
        bottom_2_2.visible = false;
        bottom_3_1.visible = false;
        bottom_3_2.visible = false;
        bottom_3_3.visible = false;

        remove_anchors();
        opisanie_2.visible = true;
        opisanie_2.anchors.horizontalCenter = rect_main.horizontalCenter;
        opisanie_2.anchors.top = rect_main.bottom;
        opisanie_2.anchors.topMargin = fon.height * 0.1;
    }

    function disable_bottom()
    {
        bottom_1.visible = true;
        bottom_2_1.visible = true;
        bottom_2_2.visible = true;
        bottom_3_1.visible = true;
        bottom_3_2.visible = true;
        bottom_3_3.visible = true;

        opisanie_2.visible = false;
    }

    function right_open_4()
    {
        image_right_4_1.source = "file:///" + applicationDirPath + "/image/up_level/add_shit.jpg";
        image_right_4_2.source = "file:///" + applicationDirPath + "/image/up_level/othil_2.jpg";
        image_right_4_3.source = "file:///" + applicationDirPath + "/image/up_level/add_life_3.jpg";
        image_right_4_4.source = "file:///" + applicationDirPath + "/image/up_level/dragon_bron.jpg";
    }

    function right_close_4()
    {
        image_right_4_1.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_right_4_2.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_right_4_3.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_right_4_4.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
    }

    function right_open_3()
    {
        image_right_3_1.source = "file:///" + applicationDirPath + "/image/up_level/othil.jpg";
        image_right_3_2.source = "file:///" + applicationDirPath + "/image/up_level/shlem.jpg";
        image_right_3_3.source = "file:///" + applicationDirPath + "/image/up_level/add_life_2.jpg";
    }

    function right_close_3()
    {
        image_right_3_1.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_right_3_2.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_right_3_3.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
    }

    function right_open_2()
    {
        image_right_2_1.source = "file:///" + applicationDirPath + "/image/up_level/add_life.jpg";
        image_right_2_2.source = "file:///" + applicationDirPath + "/image/up_level/armor.jpg";
    }

    function right_close_2()
    {
        image_right_2_1.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_right_2_2.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
    }

    function bottom_open_3()
    {
        image_bottom_3_1.source = "file:///" + applicationDirPath + "/image/up_level/volunteer.jpg";
        image_bottom_3_2.source = "file:///" + applicationDirPath + "/image/up_level/poison_2.jpg";
        image_bottom_3_3.source = "file:///" + applicationDirPath + "/image/up_level/lightning_2.jpg";
    }

    function bottom_close_3()
    {
        image_bottom_3_1.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_bottom_3_2.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_bottom_3_3.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
    }

    function bottom_open_2()
    {
        image_bottom_2_1.source = "file:///" + applicationDirPath + "/image/up_level/poison.jpg";
        image_bottom_2_2.source = "file:///" + applicationDirPath + "/image/up_level/lightning.jpg";
    }

    function bottom_close_2()
    {
        image_bottom_2_1.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_bottom_2_2.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
    }

    function top_open_3()
    {
        image_top_3_1.source = "file:///" + applicationDirPath + "/image/up_level/apple_2.jpg";
        image_top_3_2.source = "file:///" + applicationDirPath + "/image/up_level/fire_2.jpg";
        image_top_3_3.source = "file:///" + applicationDirPath + "/image/up_level/cold_2.jpg";
    }

    function top_close_3()
    {
        image_top_3_1.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_top_3_2.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_top_3_3.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
    }

    function top_open_2()
    {
        image_top_2_1.source = "file:///" + applicationDirPath + "/image/up_level/fire.jpg";
        image_top_2_2.source = "file:///" + applicationDirPath + "/image/up_level/cold.jpg";
    }

    function top_close_2()
    {
        image_top_2_1.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_top_2_2.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
    }

    function left_open_4()
    {
        image_left_4_1.source = "file:///" + applicationDirPath + "/image/up_level/ushas_2.jpg";
        image_left_4_2.source = "file:///" + applicationDirPath + "/image/up_level/damage_all_2.jpg";
        image_left_4_3.source = "file:///" + applicationDirPath + "/image/up_level/mesh_life_2.jpg";
        image_left_4_4.source = "file:///" + applicationDirPath + "/image/up_level/mesh_and_poison_2.jpg";
    }

    function left_close_4()
    {
        image_left_4_1.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_left_4_2.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_left_4_3.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_left_4_4.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
    }

    function left_open_3()
    {
        image_left_3_1.source = "file:///" + applicationDirPath + "/image/up_level/mesh_in_fire.jpg";
        image_left_3_2.source = "file:///" + applicationDirPath + "/image/up_level/ushas.jpg";
        image_left_3_3.source = "file:///" + applicationDirPath + "/image/up_level/damage_all.jpg";
    }

    function left_close_3()
    {
        image_left_3_1.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_left_3_2.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_left_3_3.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
    }

    function left_open_2()
    {
        image_left_2_1.source = "file:///" + applicationDirPath + "/image/up_level/mesh_life.jpg";
        image_left_2_2.source = "file:///" + applicationDirPath + "/image/up_level/mesh_and_poison.jpg";
    }

    function left_close_2()
    {
        image_left_2_1.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
        image_left_2_2.source = "file:///" + applicationDirPath + "/image/up_level/zamok_lock.jpg";
    }

    function bottom_2_opisanie_use()
    {
        if(global_settings.get_geroy_skill("inishiativa_1") === true)
            return true;
        else
            return false;
    }

    function bottom_3_opisanie_use()
    {
        var res_1 = global_settings.get_geroy_skill("def_poison_1");
        var res_2 = global_settings.get_geroy_skill("def_electriciti_1");

        if((res_1 === true) && (res_2 === true))
            return true;
        else
            return false;
    }

    function top_2_opisanie_use()
    {
        if(global_settings.get_geroy_skill("toshnost_1") === true)
            return true;
        else
            return false;
    }

    function top_3_opisanie_use()
    {
        var res_1 = global_settings.get_geroy_skill("def_fier_1");
        var res_2 = global_settings.get_geroy_skill("def_cold_1");

        if((res_1 === true) && (res_2 === true))
            return true;
        else
            return false;
    }

    function right_2_opisanie_use()
    {
        if(global_settings.get_geroy_skill("bron_1") === true)
            return true;
        else
            return false;
    }

    function right_3_opisanie_use()
    {
        var res_1 = global_settings.get_geroy_skill("bron_2");
        var res_2 = global_settings.get_geroy_skill("bron_life_1");

        if((res_1 === true) && (res_2 === true))
            return true;
        else
            return false;
    }

    function right_4_opisanie_use()
    {
        var res_1 = global_settings.get_geroy_skill("bron_3");
        var res_2 = global_settings.get_geroy_skill("bron_life_2");
        var res_3 = global_settings.get_geroy_skill("bron_regen_1");

        if((res_1 === true) && (res_2 === true) && (res_3 === true))
            return true;
        else
            return false;
    }

    function left_2_opisanie_use()
    {
        if(global_settings.get_geroy_skill("damage_1") === true)
            return true;
        else
            return false;
    }

    function left_3_opisanie_use()
    {
        var res_1 = global_settings.get_geroy_skill("damage_poison_1");
        var res_2 = global_settings.get_geroy_skill("damage_vampir_1");

        if((res_1 === true) && (res_2 === true))
            return true;
        else
            return false;
    }

    function left_4_opisanie_use()
    {
        var res_1 = global_settings.get_geroy_skill("damage_2");
        var res_2 = global_settings.get_geroy_skill("damage_all_team_1");
        var res_3 = global_settings.get_geroy_skill("damage_ushas_1");

        if((res_1 === true) && (res_2 === true) && (res_3 === true))
            return true;
        else
            return false;
    }

    function repaint_fon_1_point_energy()
    {
        energy_number.text = global_settings.get_point_energy();
        point.text = "Осталось пунктов: " + global_settings.get_point_1();
    }

    function repaint_fon_1_point_life()
    {
        life_number.text = global_settings.get_point_life();
        point.text = "Осталось пунктов: " + global_settings.get_point_1();
    }

    function repaint_fon_1_point_lovkost()
    {
        lovkost_number.text = global_settings.get_point_lovkost();
        point.text = "Осталось пунктов: " + global_settings.get_point_1();
    }

    function repaint_fon_1_point_sila()
    {
        sila_number.text = global_settings.get_point_sila();
        point.text = "Осталось пунктов: " + global_settings.get_point_1();
    }

    function click_button_fon_2(name_mag)
    {
        if(global_settings.get_point_2() > 0)
        {
            if(global_settings.get_geroy_skill(name_mag) === true)
                return;

            global_settings.set_geroy_skill(name_mag,true);
            repaint_fon_2();
            global_settings.set_point_2(global_settings.get_point_2() - 1);
            number_points.text = "Осталось баллов: " + global_settings.get_point_2();
        }
    }

    function repaint_table()
    {
        if(var_init === false)
        {
            global_settings.set_point_1(global_settings.get_point_1() + 5); //тестовая строка
            global_settings.add_point_2();                                  //тестовая строка
            global_settings.add_point_2();                                  //тестовая строка

            fon.source = "file:///" + applicationDirPath + "/image/up_level/fon_up_level.jpg";

            var adress = "";
            var name = global_settings.get_name_geroy();
            var end_index = name.indexOf(":",1);
            name = name.slice(0,end_index);

            if(name === "Воин")
            {
                adress = applicationDirPath + "/XML/heroes/xml_heroes_voin.xml";
                name = "voin";
            }
            else if(name === "Лучник")
            {
                adress = applicationDirPath + "/XML/heroes/xml_heroes_luchnik.xml";
                name = "luchnik";
            }
            else if(name === "Маг")
            {
                adress = applicationDirPath + "/XML/heroes/xml_heroes_mag.xml";
                name = "mag";
            }

            table.parsing_string(adress,name,0);
            var_init = true;
        }
    }

    function repaint_fon_2()
    {
        if(bottom_2_opisanie_use() === false)
        {
            bottom_close_3();
            bottom_close_2();
        }
        else
        {
            effect_bottom_1.color = "green";
            bottom_open_2();
            if(bottom_3_opisanie_use() === false)
            {
                if(global_settings.get_geroy_skill("def_poison_1") === true)
                    effect_bottom_2_1.color = "green";
                if(global_settings.get_geroy_skill("def_electriciti_1") === true)
                    effect_bottom_2_2.color = "green";

                bottom_close_3();
            }
            else
            {
                effect_bottom_2_1.color = "green";
                effect_bottom_2_2.color = "green";
                bottom_open_3();

                if(global_settings.get_geroy_skill("inishiativa_2") === true)
                    effect_bottom_3_1.color = "green";
                if(global_settings.get_geroy_skill("def_poison_2") === true)
                    effect_bottom_3_2.color = "green";
                if(global_settings.get_geroy_skill("def_electriciti_2") === true)
                    effect_bottom_3_3.color = "green";
            }
        }

        if(top_2_opisanie_use() === false)
        {
            top_close_3();
            top_close_2();
        }
        else
        {
            effect_top_1.color = "green";
            top_open_2();
            if(top_3_opisanie_use() === false)
            {
                if(global_settings.get_geroy_skill("def_fier_1") === true)
                    effect_top_2_1.color = "green";
                if(global_settings.get_geroy_skill("def_cold_1") === true)
                    effect_top_2_2.color = "green";

                top_close_3();
            }
            else
            {
                effect_top_2_1.color = "green";
                effect_top_2_2.color = "green";
                top_open_3();

                if(global_settings.get_geroy_skill("toshnost_2") === true)
                    effect_top_3_1.color = "green";
                if(global_settings.get_geroy_skill("def_fier_2") === true)
                    effect_top_3_2.color = "green";
                if(global_settings.get_geroy_skill("def_cold_2") === true)
                    effect_top_3_3.color = "green";
            }
        }

        if(right_2_opisanie_use() === false)
        {
            right_close_4();
            right_close_3();
            right_close_2();
        }
        else
        {
            effect_right_1.color = "green";
            right_open_2();
            if(right_3_opisanie_use() === false) //не все прокачано
            {
                if(global_settings.get_geroy_skill("bron_life_1") === true)
                    effect_right_2_1.color = "green";
                if(global_settings.get_geroy_skill("bron_2") === true)
                    effect_right_2_2.color = "green";

                right_close_3();
                right_close_4();
            }
            else
            {
                effect_right_2_1.color = "green";
                effect_right_2_2.color = "green";
                right_open_3();
                if(right_4_opisanie_use() === false) //не все прокачано
                {
                    if(global_settings.get_geroy_skill("bron_regen_1") === true)
                        effect_right_3_1.color = "green";
                    if(global_settings.get_geroy_skill("bron_3") === true)
                        effect_right_3_2.color = "green";
                    if(global_settings.get_geroy_skill("bron_life_2") === true)
                        effect_right_3_3.color = "green";

                    right_close_4();
                }
                else
                {
                    effect_right_3_1.color = "green";
                    effect_right_3_2.color = "green";
                    effect_right_3_3.color = "green";
                    right_open_4();

                    if(global_settings.get_geroy_skill("bron_shit_1") === true)
                        effect_right_4_1.color = "green";
                    if(global_settings.get_geroy_skill("bron_regen_2") === true)
                        effect_right_4_2.color = "green";
                    if(global_settings.get_geroy_skill("bron_life_3") === true)
                        effect_right_4_3.color = "green";
                    if(global_settings.get_geroy_skill("bron_4") === true)
                        effect_right_4_4.color = "green";
                }
            }
        }

        if(left_2_opisanie_use() === false) //разбор левой части
        {
            left_close_4();
            left_close_3();
            left_close_2();
        }
        else
        {
            effect_left_1.color = "green";
            left_open_2();
            if(left_3_opisanie_use() === false) //не все прокачано
            {
                if(global_settings.get_geroy_skill("damage_vampir_1") === true)
                    effect_left_2_1.color = "green";
                if(global_settings.get_geroy_skill("damage_poison_1") === true)
                    effect_left_2_2.color = "green";

                left_close_3();
                left_close_4();
            }
            else
            {
                effect_left_2_1.color = "green";
                effect_left_2_2.color = "green";
                left_open_3();
                if(left_4_opisanie_use() === false) //не все прокачано
                {
                    if(global_settings.get_geroy_skill("damage_2") === true)
                        effect_left_3_1.color = "green";
                    if(global_settings.get_geroy_skill("damage_ushas_1") === true)
                        effect_left_3_2.color = "green";
                    if(global_settings.get_geroy_skill("damage_all_team_1") === true)
                        effect_left_3_3.color = "green";

                    left_close_4();
                }
                else
                {
                    effect_left_3_1.color = "green";
                    effect_left_3_2.color = "green";
                    effect_left_3_3.color = "green";
                    left_open_4();

                    if(global_settings.get_geroy_skill("damage_ushas_2") === true)
                        effect_left_4_1.color = "green";
                    if(global_settings.get_geroy_skill("damage_all_team_2") === true)
                        effect_left_4_2.color = "green";
                    if(global_settings.get_geroy_skill("damage_vampir_2") === true)
                        effect_left_4_3.color = "green";
                    if(global_settings.get_geroy_skill("damage_poison_2") === true)
                        effect_left_4_4.color = "green";
                }
            }
        }
    }

    function repaint_fon_3()
    {
        var level_use = global_settings.get_books_magic_use();
        var level_team = global_settings.get_level_team();

        top_text.anchors.centerIn = undefined; //сброс прошлой привязки
        top_text.anchors.top = undefined;
        top_text.anchors.horizontalCenter = undefined;

        if(level_team >= level_use)
        {
            top_text.anchors.top = fon_3.top;
            top_text.anchors.horizontalCenter = fon_3.horizontalCenter;
            top_text.text = "Выберите одно из магических заклинаний";

            if(level_use === 1) //c 1 => 2 уровень
            {
                image_select_1.visible = true;
                image_select_2.visible = true;
                image_select_1.source = "file:///" + applicationDirPath + "/image/up_level/magic/fire_strela.jpg";
                image_select_2.source = "file:///" + applicationDirPath + "/image/up_level/magic/cold_line.jpg";
            }
        }
        else
        {
            select_1.visible = false;
            select_2.visible = false;
            top_text.anchors.centerIn = fon_3;
            top_text.text = "Все текущие баллы потрачены. Для новых баллов нужен новый уровень.";
        }
    }

    function magic_select(select) // распределяет необходимое описание на данном уровне
    {
        var level = global_settings.get_books_magic_use();
        if(level === 1)
            magic_1(select);
    }

    function magic_1(select)
    {
        if(select === 1)
        {
            opisanie_3_text.text = "<h3>Стрела огня</h3> <p>Наносит выбранному отряду 25 единиц урона от Огня.</p>";
            name_magic = "Стрела огня";
        }
        else
        {
            opisanie_3_text.text = "<h3>Луч холода</h3> <p>Наносит выбранному отряду 15 единиц урона от Холода с вероятностью обморожения 70% на один ход с уроном 20.</p>";
            name_magic = "Луч холода";
        }
    }

    Image
    {
        id: fon
        width: parent.width
        height: parent.height
        anchors.centerIn: main_windows
        source: repaint_table()
        visible: true

        Rectangle
        {
            id: sila
            height: fon.height * 0.1
            width: sila.height
            color: "white"
            anchors.left: fon.left
            anchors.leftMargin: fon.height * 0.1
            anchors.top: fon.top
            anchors.topMargin: fon.height * 0.05

            Image
            {
                id: sila_image
                height: parent.height - 6
                width: parent.width - 6
                anchors.centerIn: sila
                source: "file:///" + applicationDirPath + "/image/up_level/sila.jpg";
            }
        }

        Rectangle
        {
            id: lovkost
            height: fon.height * 0.1
            width: lovkost.height
            color: "white"
            anchors.left: fon.left
            anchors.leftMargin: fon.height * 0.1
            anchors.top: sila.bottom
            anchors.topMargin: fon.height * 0.05

            Image
            {
                id: lovkost_image
                height: parent.height - 6
                width: parent.width - 6
                anchors.centerIn: lovkost
                source: "file:///" + applicationDirPath + "/image/up_level/lovkost.jpg";
            }
        }

        Rectangle
        {
            id: life
            height: fon.height * 0.1
            width: life.height
            color: "white"
            anchors.left: fon.left
            anchors.leftMargin: fon.height * 0.1
            anchors.top: lovkost.bottom
            anchors.topMargin: fon.height * 0.05

            Image
            {
                id: life_image
                height: parent.height - 6
                width: parent.width - 6
                anchors.centerIn: life
                source: "file:///" + applicationDirPath + "/image/up_level/life.jpg";
            }
        }

        Rectangle
        {
            id: energy
            height: fon.height * 0.1
            width: energy.height
            color: "white"
            anchors.left: fon.left
            anchors.leftMargin: fon.height * 0.1
            anchors.top: life.bottom
            anchors.topMargin: fon.height * 0.05

            Image
            {
                id: energy_image
                height: parent.height - 6
                width: parent.width - 6
                anchors.centerIn: energy
                source: "file:///" + applicationDirPath + "/image/up_level/energy.jpg";
            }
        }

        Text
        {
            id: sila_text
            height: sila.height
            width: sila.width * 3
            wrapMode: TextEdit.WordWrap
            color: "white"
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 27
            anchors.left: sila.right
            anchors.leftMargin: fon.height * 0.05
            anchors.top: fon.top
            anchors.topMargin: fon.height * 0.05
            fontSizeMode: Text.Fit
            minimumPointSize: 18
            text: "Сила"
        }

        Text
        {
            id: lovkost_text
            height: lovkost.height
            width: lovkost.width * 3
            wrapMode: TextEdit.WordWrap
            color: "white"
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 27
            anchors.left: lovkost.right
            anchors.leftMargin: fon.height * 0.05
            anchors.top: sila_text.bottom
            anchors.topMargin: fon.height * 0.05
            fontSizeMode: Text.Fit
            minimumPointSize: 18
            text: "Ловкость"
        }

        Text
        {
            id: life_text
            height: life.height
            width: life.width * 3
            wrapMode: TextEdit.WordWrap
            color: "white"
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 27
            anchors.left: life.right
            anchors.leftMargin: fon.height * 0.05
            anchors.top: lovkost_text.bottom
            anchors.topMargin: fon.height * 0.05
            fontSizeMode: Text.Fit
            minimumPointSize: 18
            text: "Жизнь"
        }

        Text
        {
            id: energy_text
            height: energy.height
            width: energy.width * 3
            wrapMode: TextEdit.WordWrap
            color: "white"
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 27
            anchors.left: energy.right
            anchors.leftMargin: fon.height * 0.05
            anchors.top: life_text.bottom
            anchors.topMargin: fon.height * 0.05
            fontSizeMode: Text.Fit
            minimumPointSize: 18
            text: "Энергия"
        }

        Image
        {
            id: add_sila
            height: fon.height * 0.08
            width: add_sila.height
            anchors.left: sila_text.right
            anchors.leftMargin: fon.height * 0.1
            anchors.verticalCenter: sila_text.verticalCenter
            source: "file:///" + applicationDirPath + "/image/up_level/blue_plus.png";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    add_sila.source = "file:///" + applicationDirPath + "/image/up_level/green_plus.png";
                    opisanie_text.text = "Повышает урон героя использующий силовую атаку ближнего боя.";
                    opisanie.visible = true;
                }
                onExited:
                {
                    add_sila.source = "file:///" + applicationDirPath + "/image/up_level/blue_plus.png";
                    opisanie.visible = false;
                }
                onClicked:
                {
                    if(global_settings.get_point_1() > 0)
                    {
                        global_settings.set_point_sila(global_settings.get_point_sila() + 1);
                        global_settings.set_point_1(global_settings.get_point_1() - 1);
                        repaint_fon_1_point_sila();
                        table.update_damage_for_geroy();
                    }
                }
            }
        }

        Image
        {
            id: add_lovkost
            height: fon.height * 0.08
            width: add_lovkost.height
            anchors.left: lovkost_text.right
            anchors.leftMargin: fon.height * 0.1
            anchors.verticalCenter: lovkost_text.verticalCenter
            source: "file:///" + applicationDirPath + "/image/up_level/blue_plus.png";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    add_lovkost.source = "file:///" + applicationDirPath + "/image/up_level/green_plus.png";
                    opisanie_text.text = "Повышает урон героя использующий оружие дальнего боя.";
                    opisanie.visible = true;
                }
                onExited:
                {
                    add_lovkost.source = "file:///" + applicationDirPath + "/image/up_level/blue_plus.png";
                    opisanie.visible = false;
                }
                onClicked:
                {
                    if(global_settings.get_point_1() > 0)
                    {
                        global_settings.set_point_lovkost(global_settings.get_point_lovkost() + 1);
                        global_settings.set_point_1(global_settings.get_point_1() - 1);
                        repaint_fon_1_point_lovkost();
                        table.update_damage_for_geroy();
                    }
                }
            }
        }

        Image
        {
            id: add_life
            height: fon.height * 0.08
            width: add_life.height
            anchors.left: life_text.right
            anchors.leftMargin: fon.height * 0.1
            anchors.verticalCenter: life_text.verticalCenter
            source: "file:///" + applicationDirPath + "/image/up_level/blue_plus.png";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    add_life.source = "file:///" + applicationDirPath + "/image/up_level/green_plus.png";
                    opisanie_text.text = "Повышает жизненные показатели героя.";
                    opisanie.visible = true;
                }
                onExited:
                {
                    add_life.source = "file:///" + applicationDirPath + "/image/up_level/blue_plus.png";
                    opisanie.visible = false;
                }
                onClicked:
                {
                    if(global_settings.get_point_1() > 0)
                    {
                        global_settings.set_point_life(global_settings.get_point_life() + 1);
                        global_settings.set_point_1(global_settings.get_point_1() - 1);
                        repaint_fon_1_point_life();
                        table.update_life_for_geroy();
                    }
                }
            }
        }

        Image
        {
            id: add_energy
            height: fon.height * 0.08
            width: add_energy.height
            anchors.left: energy_text.right
            anchors.leftMargin: fon.height * 0.1
            anchors.verticalCenter: energy_text.verticalCenter
            source: "file:///" + applicationDirPath + "/image/up_level/blue_plus.png";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    add_energy.source = "file:///" + applicationDirPath + "/image/up_level/green_plus.png";
                    opisanie_text.text = "Повышает урон героя использующий магию.";
                    opisanie.visible = true;

                }
                onExited:
                {
                    add_energy.source = "file:///" + applicationDirPath + "/image/up_level/blue_plus.png";
                    opisanie.visible = false;
                }
                onClicked:
                {
                    if(global_settings.get_point_1() > 0)
                    {
                        global_settings.set_point_energy(global_settings.get_point_energy() + 1);
                        global_settings.set_point_1(global_settings.get_point_1() - 1);
                        repaint_fon_1_point_energy();
                        table.update_damage_for_geroy();
                    }
                }
            }
        }

        Text
        {
            id: sila_number
            width: sila.width
            height: sila.height
            anchors.top: fon.top
            anchors.topMargin: fon.height * 0.05
            anchors.left: add_sila.right
            anchors.leftMargin: fon.height * 0.05
            color: "white"
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 27
            fontSizeMode: Text.Fit
            minimumPointSize: 18
            text: global_settings.get_point_sila()
        }

        Text
        {
            id: lovkost_number
            width: lovkost.width
            height: lovkost.height
            anchors.top: sila_number.bottom
            anchors.topMargin: fon.height * 0.05
            anchors.left: add_lovkost.right
            anchors.leftMargin: fon.height * 0.05
            color: "white"
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 27
            fontSizeMode: Text.Fit
            minimumPointSize: 18
            text: global_settings.get_point_lovkost()
        }

        Text
        {
            id: life_number
            width: life.width
            height: life.height
            anchors.top: lovkost_number.bottom
            anchors.topMargin: fon.height * 0.05
            anchors.left: add_life.right
            anchors.leftMargin: fon.height * 0.05
            color: "white"
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 27
            fontSizeMode: Text.Fit
            minimumPointSize: 18
            text: global_settings.get_point_life()
        }

        Text
        {
            id: energy_number
            width: energy.width
            height: energy.height
            anchors.top: life_number.bottom
            anchors.topMargin: fon.height * 0.05
            anchors.left: add_energy.right
            anchors.leftMargin: fon.height * 0.05
            color: "white"
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 27
            fontSizeMode: Text.Fit
            minimumPointSize: 18
            text: global_settings.get_point_energy()
        }

        Text
        {
            id: point
            width: energy_text.width
            height: energy_text.height
            anchors.top: energy_text.bottom
            anchors.topMargin: fon.height * 0.05
            anchors.left: energy_text.left
            color: "yellow"
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 27
            fontSizeMode: Text.Fit
            minimumPointSize: 18
            text: "Осталось пунктов: " + global_settings.get_point_1()
        }

        Rectangle
        {
            id: opisanie
            height: sila.height * 1.5
            color: "white"
            anchors.left: sila.left
            anchors.right: add_sila.right
            anchors.top: point.bottom
            radius: 10
            visible: false

            gradient: Gradient
            {
                GradientStop { position: 0.0 ; color: "#33ccff" }
                GradientStop { position: 0.1 ; color: "#33ccff" }
                GradientStop { position: 0.2 ; color: "#00bfff" }
                GradientStop { position: 0.8 ; color: "#00bfff" }
                GradientStop { position: 0.9 ; color: "#33ccff" }
                GradientStop { position: 1.0 ; color: "#33ccff" }
            }

            Text
            {
                id: opisanie_text
                width: opisanie.width
                height: opisanie.height
                anchors.centerIn: opisanie
                wrapMode: TextEdit.WordWrap
                color: "white"
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 14
                fontSizeMode: Text.Fit
                minimumPointSize: 10
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Table_property
        {
            id: table
            width: parent.width * 0.4
            height: parent.height * 0.6
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.rightMargin: parent.width * 0.05
            color: "#00000000"
        }

        Image
        {
            id: next
            height: fon.height * 0.1
            width: next.height
            anchors.bottom: fon.bottom
            anchors.bottomMargin: fon.height * 0.05
            anchors.right: fon.right
            anchors.rightMargin: fon.height * 0.1
            source: "file:///" + applicationDirPath + "/image/up_level/st_blue.png";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    next.source = "file:///" + applicationDirPath + "/image/up_level/st_green.png";
                }
                onExited:
                {
                    next.source = "file:///" + applicationDirPath + "/image/up_level/st_blue.png";
                }
                onClicked:
                {
                    fon.visible = false;
                    fon_2.visible = true;
                    repaint_fon_2();
                }
            }
        }
    }

    Image
    {
        id: fon_2
        height: parent.height
        width: parent.width
        anchors.centerIn: parent
        source: "file:///" + applicationDirPath + "/image/up_level/fon_2.jpg";
        visible: false

        Rectangle
        {
            id: rect_main
            height: fon.height * 0.1
            width: rect_main.height
            anchors.centerIn: fon_2

            RectangularGlow
            {
                id: effect
                anchors.fill: rect_main
                glowRadius: 10
                spread: 0.2
                color: "green"
            }

            Image
            {
                id: image_main
                height: parent.height
                width: parent.width
                anchors.centerIn: rect_main
                source: global_settings.get_image_geroy()
            }
        }

        Rectangle
        {
            id: left_1
            height: fon.height * 0.1
            width: left_1.height
            anchors.right: rect_main.left
            anchors.rightMargin: fon.height * 0.025
            anchors.verticalCenter: rect_main.verticalCenter

            RectangularGlow
            {
                id: effect_left_1
                anchors.fill: left_1
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_left_1
                height: parent.height
                width: parent.width
                anchors.centerIn: left_1
                source: "file:///" + applicationDirPath + "/image/up_level/mech.jpg";
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    show_right();
                    effect_left_1.color = "indigo"
                    opisanie_2_text.text = "Постоянный эффект к увеличению урона героя на 10%";
                }
                onExited:
                {
                    disable_right();
                    if(global_settings.get_geroy_skill("damage_1") === true)
                        effect_left_1.color = "green";
                    else
                        effect_left_1.color = "blue";
                }
                onClicked:
                {
                    click_button_fon_2("damage_1");
                }
            }
        }

        Rectangle
        {
            id: top_1
            height: fon.height * 0.1
            width: top_1.height
            anchors.bottom: rect_main.top
            anchors.bottomMargin: fon.height * 0.025
            anchors.horizontalCenter: rect_main.horizontalCenter

            RectangularGlow
            {
                id: effect_top_1
                anchors.fill: top_1
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_top_1
                height: parent.height
                width: parent.width
                anchors.centerIn: top_1
                source: "file:///" + applicationDirPath + "/image/up_level/apple.jpg";
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    show_bottom();
                    effect_top_1.color = "indigo"
                    opisanie_2_text.text = "Постоянный эффект к увеличению точности героя на 10";
                }
                onExited:
                {
                    disable_bottom();
                    if(global_settings.get_geroy_skill("toshnost_1") === true)
                        effect_top_1.color = "green";
                    else
                        effect_top_1.color = "blue";
                }
                onClicked:
                {
                    click_button_fon_2("toshnost_1");
                }
            }
        }

        Rectangle
        {
            id: bottom_1
            height: fon.height * 0.1
            width: bottom_1.height
            anchors.top: rect_main.bottom
            anchors.topMargin: fon.height * 0.025
            anchors.horizontalCenter: rect_main.horizontalCenter

            RectangularGlow
            {
                id: effect_bottom_1
                anchors.fill: bottom_1
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_bottom_1
                height: parent.height
                width: parent.width
                anchors.centerIn: bottom_1
                source: "file:///" + applicationDirPath + "/image/up_level/employee.jpg";
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    show_top();
                    effect_bottom_1.color = "indigo"
                    opisanie_2_text.text = "Постоянный эффект к увеличению инициативы всех в отряде на 15%";
                }
                onExited:
                {
                    disable_top();
                    if(global_settings.get_geroy_skill("inishiativa_1") === true)
                        effect_bottom_1.color = "green";
                    else
                        effect_bottom_1.color = "blue";
                }
                onClicked:
                {
                    click_button_fon_2("inishiativa_1");
                }
            }
        }

        Rectangle
        {
            id: right_1
            height: fon.height * 0.1
            width: right_1.height
            anchors.left: rect_main.right
            anchors.leftMargin: fon.height * 0.025
            anchors.verticalCenter: rect_main.verticalCenter

            RectangularGlow
            {
                id: effect_right_1
                anchors.fill: right_1
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_right_1
                height: parent.height
                width: parent.width
                anchors.centerIn: right_1
                source: "file:///" + applicationDirPath + "/image/up_level/shit.jpg";
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    show_left();
                    effect_right_1.color = "indigo"
                    opisanie_2_text.text = "Постоянный эффект к увеличению брони героя на 10";
                }
                onExited:
                {
                    disable_left();
                    if(global_settings.get_geroy_skill("bron_1") === true)
                        effect_right_1.color = "green";
                    else
                        effect_right_1.color = "blue";
                }
                onClicked:
                {
                    click_button_fon_2("bron_1");
                }
            }
        }

        Rectangle
        {
            id: left_2_1
            height: fon.height * 0.1
            width: left_2_1.height
            anchors.right: left_1.left
            anchors.rightMargin: fon.height * 0.025
            anchors.top: rect_main.verticalCenter
            anchors.topMargin: (fon.height * 0.025) /2

            RectangularGlow
            {
                id: effect_left_2_1
                anchors.fill: left_2_1
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_left_2_1
                height: parent.height
                width: parent.width
                anchors.centerIn: left_2_1
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(left_2_opisanie_use() === true)
                    {
                        show_right();
                        opisanie_2_text.text = "Восполняет здоровье герою в объеме 30% от нанесенного урона по одной цели или 7% по множественным целям(герой маг)";
                    }

                    effect_left_2_1.color = "indigo";
                }
                onExited:
                {
                    if(left_2_opisanie_use() === true)
                        disable_right();

                    if(global_settings.get_geroy_skill("damage_vampir_1") === true)
                        effect_left_2_1.color = "green";
                    else
                        effect_left_2_1.color = "blue";
                }
                onClicked:
                {
                    if(left_2_opisanie_use() === false)
                        return;

                    click_button_fon_2("damage_vampir_1");
                }
            }
        }

        Rectangle
        {
            id: left_2_2
            height: fon.height * 0.1
            width: left_2_2.height
            anchors.right: left_1.left
            anchors.rightMargin: fon.height * 0.025
            anchors.bottom: rect_main.verticalCenter
            anchors.bottomMargin: (fon.height * 0.025) /2

            RectangularGlow
            {
                id: effect_left_2_2
                anchors.fill: left_2_2
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_left_2_2
                height: parent.height
                width: parent.width
                anchors.centerIn: left_2_2
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(left_2_opisanie_use() === true)
                    {
                        show_right();
                        opisanie_2_text.text = "отравляет противника на 2 следующих хода. Урон ядом 20%(для героя мага 10%) от нанесенного урона. Эффект не суммируется и не обновляется после первого хода";
                    }

                    effect_left_2_2.color = "indigo";
                }
                onExited:
                {
                    if(left_2_opisanie_use() === true)
                        disable_right();

                    if(global_settings.get_geroy_skill("damage_poison_1") === true)
                        effect_left_2_2.color = "green";
                    else
                        effect_left_2_2.color = "blue";

                }
                onClicked:
                {
                    if(left_2_opisanie_use() === false)
                        return;

                    click_button_fon_2("damage_poison_1");
                }
            }
        }

        Rectangle
        {
            id: top_2_1
            height: fon.height * 0.1
            width: top_2_1.height
            anchors.bottom: top_1.top
            anchors.bottomMargin: fon.height * 0.025
            anchors.right: rect_main.horizontalCenter
            anchors.rightMargin: (fon.height * 0.025) /2

            RectangularGlow
            {
                id: effect_top_2_1
                anchors.fill: top_2_1
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_top_2_1
                height: parent.height
                width: parent.width
                anchors.centerIn: top_2_1
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(top_2_opisanie_use() === true)
                    {
                        show_bottom();
                        opisanie_2_text.text = "Герой приобретает защиту от Огня";
                    }

                    effect_top_2_1.color = "indigo";
                }
                onExited:
                {
                    if(top_2_opisanie_use() === true)
                        disable_bottom();

                    if(global_settings.get_geroy_skill("def_fier_1") === true)
                        effect_top_2_1.color = "green";
                    else
                        effect_top_2_1.color = "blue";
                }
                onClicked:
                {
                    if(top_2_opisanie_use() === false)
                        return;

                    click_button_fon_2("def_fier_1");
                }
            }
        }

        Rectangle
        {
            id: top_2_2
            height: fon.height * 0.1
            width: top_2_2.height
            anchors.bottom: top_1.top
            anchors.bottomMargin: fon.height * 0.025
            anchors.left: rect_main.horizontalCenter
            anchors.leftMargin: (fon.height * 0.025) /2

            RectangularGlow
            {
                id: effect_top_2_2
                anchors.fill: top_2_2
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_top_2_2
                height: parent.height
                width: parent.width
                anchors.centerIn: top_2_2
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(top_2_opisanie_use() === true)
                    {
                        show_bottom();
                        opisanie_2_text.text = "Герой приобретает защиту от Холода";
                    }

                    effect_top_2_2.color = "indigo";
                }
                onExited:
                {
                    if(top_2_opisanie_use() === true)
                        disable_bottom();

                    if(global_settings.get_geroy_skill("def_cold_1") === true)
                        effect_top_2_2.color = "green";
                    else
                        effect_top_2_2.color = "blue";
                }
                onClicked:
                {
                    if(top_2_opisanie_use() === false)
                        return;

                    click_button_fon_2("def_cold_1");
                }
            }
        }

        Rectangle
        {
            id: bottom_2_1
            height: fon.height * 0.1
            width: bottom_2_1.height
            anchors.top: bottom_1.bottom
            anchors.topMargin: fon.height * 0.025
            anchors.right: rect_main.horizontalCenter
            anchors.rightMargin: (fon.height * 0.025) /2

            RectangularGlow
            {
                id: effect_bottom_2_1
                anchors.fill: bottom_2_1
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_bottom_2_1
                height: parent.height
                width: parent.width
                anchors.centerIn: bottom_2_1
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(bottom_2_opisanie_use() === true)
                    {
                        show_top();
                        opisanie_2_text.text = "Герой приобретает защиту от Яда";
                    }

                    effect_bottom_2_1.color = "indigo";
                }
                onExited:
                {
                    if(bottom_2_opisanie_use() === true)
                        disable_top();

                    if(global_settings.get_geroy_skill("def_poison_1") === true)
                        effect_bottom_2_1.color = "green";
                    else
                        effect_bottom_2_1.color = "blue";
                }
                onClicked:
                {
                    if(bottom_2_opisanie_use() === false)
                        return;

                    click_button_fon_2("def_poison_1");
                }
            }
        }

        Rectangle
        {
            id: bottom_2_2
            height: fon.height * 0.1
            width: bottom_2_2.height
            anchors.top: bottom_1.bottom
            anchors.topMargin: fon.height * 0.025
            anchors.left: rect_main.horizontalCenter
            anchors.leftMargin: (fon.height * 0.025) /2

            RectangularGlow
            {
                id: effect_bottom_2_2
                anchors.fill: bottom_2_2
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_bottom_2_2
                height: parent.height
                width: parent.width
                anchors.centerIn: bottom_2_2
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(bottom_2_opisanie_use() === true)
                    {
                        show_top();
                        opisanie_2_text.text = "Герой приобретает защиту от Молнии";
                    }

                    effect_bottom_2_2.color = "indigo";
                }
                onExited:
                {
                    if(bottom_2_opisanie_use() === true)
                        disable_top();

                    if(global_settings.get_geroy_skill("def_electriciti_1") === true)
                        effect_bottom_2_2.color = "green";
                    else
                        effect_bottom_2_2.color = "blue";
                }
                onClicked:
                {
                    if(bottom_2_opisanie_use() === false)
                        return;

                    click_button_fon_2("def_electriciti_1");
                }
            }
        }

        Rectangle
        {
            id: right_2_1
            height: fon.height * 0.1
            width: right_2_1.height
            anchors.left: right_1.right
            anchors.leftMargin: fon.height * 0.025
            anchors.top: rect_main.verticalCenter
            anchors.topMargin: (fon.height * 0.025) /2

            RectangularGlow
            {
                id: effect_right_2_1
                anchors.fill: right_2_1
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_right_2_1
                height: parent.height
                width: parent.width
                anchors.centerIn: right_2_1
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(right_2_opisanie_use() === true)
                    {
                        show_left();
                        opisanie_2_text.text = "Постоянный эффект к увеличению здоровья на 20%";
                    }

                    effect_right_2_1.color = "indigo"
                }
                onExited:
                {
                    if(right_2_opisanie_use() === true)
                        disable_left();

                    if(global_settings.get_geroy_skill("bron_life_1") === true)
                        effect_right_2_1.color = "green";
                    else
                        effect_right_2_1.color = "blue";
                }
                onClicked:
                {
                    if(right_2_opisanie_use() === false)
                        return;

                    click_button_fon_2("bron_life_1");
                }
            }
        }

        Rectangle
        {
            id: right_2_2
            height: fon.height * 0.1
            width: right_2_2.height
            anchors.left: right_1.right
            anchors.leftMargin: fon.height * 0.025
            anchors.bottom: rect_main.verticalCenter
            anchors.bottomMargin: (fon.height * 0.025) /2

            RectangularGlow
            {
                id: effect_right_2_2
                anchors.fill: right_2_2
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_right_2_2
                height: parent.height
                width: parent.width
                anchors.centerIn: right_2_2
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(right_2_opisanie_use() === true)
                    {
                        show_left();
                        opisanie_2_text.text = "Увеличение постоянного эффекта брони героя до 25";
                    }

                    effect_right_2_2.color = "indigo";
                }
                onExited:
                {
                    if(right_2_opisanie_use() === true)
                        disable_left();

                    if(global_settings.get_geroy_skill("bron_2") === true)
                        effect_right_2_2.color = "green";
                    else
                        effect_right_2_2.color = "blue";
                }
                onClicked:
                {
                    if(right_2_opisanie_use() === false)
                        return;

                    click_button_fon_2("bron_2");
                }
            }
        }

        Rectangle
        {
            id: left_3_1
            height: fon.height * 0.1
            width: left_3_1.height
            anchors.right: left_2_1.left
            anchors.rightMargin: fon.height * 0.025
            anchors.verticalCenter: rect_main.verticalCenter

            RectangularGlow
            {
                id: effect_left_3_1
                anchors.fill: left_3_1
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_left_3_1
                height: parent.height
                width: parent.width
                anchors.centerIn: left_3_1
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(left_3_opisanie_use() === true)
                    {
                        show_right();
                        opisanie_2_text.text = "Увеличение постоянного эффекта к урону героя до 30%";
                    }

                    effect_left_3_1.color = "indigo";
                }
                onExited:
                {
                    if(left_3_opisanie_use() === true)
                        disable_right();

                    if(global_settings.get_geroy_skill("damage_2") === true)
                        effect_left_3_1.color = "green";
                    else
                        effect_left_3_1.color = "blue";
                }
                onClicked:
                {
                    if(left_3_opisanie_use() === false)
                        return;

                    click_button_fon_2("damage_2");
                }
            }
        }

        Rectangle
        {
            id: left_3_2
            height: fon.height * 0.1
            width: left_3_2.height
            anchors.right: left_2_1.left
            anchors.rightMargin: fon.height * 0.025
            anchors.top: left_3_1.bottom
            anchors.topMargin: fon.height * 0.025

            RectangularGlow
            {
                id: effect_left_3_2
                anchors.fill: left_3_2
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_left_3_2
                height: parent.height
                width: parent.width
                anchors.centerIn: left_3_2
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(left_3_opisanie_use() === true)
                    {
                        show_right();
                        opisanie_2_text.text = "При попадании с вероятностью 30%(для мага 5%) наводит ужас на цель. От ужаса цель пропустит следующий ход";
                    }

                    effect_left_3_2.color = "indigo";
                }
                onExited:
                {
                    if(left_3_opisanie_use() === true)
                        disable_right();

                    if(global_settings.get_geroy_skill("damage_ushas_1") === true)
                        effect_left_3_2.color = "green";
                    else
                        effect_left_3_2.color = "blue";
                }
                onClicked:
                {
                    if(left_3_opisanie_use() === false)
                        return;

                    click_button_fon_2("damage_ushas_1");
                }
            }
        }

        Rectangle
        {
            id: left_3_3
            height: fon.height * 0.1
            width: left_3_3.height
            anchors.right: left_2_1.left
            anchors.rightMargin: fon.height * 0.025
            anchors.bottom: left_3_1.top
            anchors.bottomMargin: fon.height * 0.025

            RectangularGlow
            {
                id: effect_left_3_3
                anchors.fill: left_3_3
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_left_3_3
                height: parent.height
                width: parent.width
                anchors.centerIn: left_3_3
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(left_3_opisanie_use() === true)
                    {
                        show_right();
                        opisanie_2_text.text = "Все в отряде кроме самого героя получают постоянный эффект к урону 15%";
                    }

                    effect_left_3_3.color = "indigo";
                }
                onExited:
                {
                    if(left_3_opisanie_use() === true)
                        disable_right();

                    if(global_settings.get_geroy_skill("damage_all_team_1") === true)
                        effect_left_3_3.color = "green";
                    else
                        effect_left_3_3.color = "blue";
                }
                onClicked:
                {
                    if(left_3_opisanie_use() === false)
                        return;

                    click_button_fon_2("damage_all_team_1");
                }
            }
        }

        Rectangle
        {
            id: top_3_1
            height: fon.height * 0.1
            width: top_3_1.height
            anchors.bottom: top_2_1.top
            anchors.bottomMargin: fon.height * 0.025
            anchors.horizontalCenter: rect_main.horizontalCenter

            RectangularGlow
            {
                id: effect_top_3_1
                anchors.fill: top_3_1
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_top_3_1
                height: parent.height
                width: parent.width
                anchors.centerIn: top_3_1
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(top_3_opisanie_use() === true)
                    {
                        show_bottom();
                        opisanie_2_text.text = "Увеличение эффекта точности героя до 20";
                    }

                    effect_top_3_1.color = "indigo";
                }
                onExited:
                {
                    if(top_3_opisanie_use() === true)
                        disable_bottom();

                    if(global_settings.get_geroy_skill("toshnost_2") === true)
                        effect_top_3_1.color = "green";
                    else
                        effect_top_3_1.color = "blue";
                }
                onClicked:
                {
                    if(top_3_opisanie_use() === false)
                        return;

                    click_button_fon_2("toshnost_2");
                }
            }
        }

        Rectangle
        {
            id: top_3_2
            height: fon.height * 0.1
            width: top_3_2.height
            anchors.bottom: top_2_1.top
            anchors.bottomMargin: fon.height * 0.025
            anchors.right: top_3_1.left
            anchors.rightMargin: fon.height * 0.025

            RectangularGlow
            {
                id: effect_top_3_2
                anchors.fill: top_3_2
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_top_3_2
                height: parent.height
                width: parent.width
                anchors.centerIn: top_3_2
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(top_3_opisanie_use() === true)
                    {
                        show_bottom();
                        opisanie_2_text.text = "Герой преобретает иммунитет к Огню";
                    }

                    effect_top_3_2.color = "indigo";
                }
                onExited:
                {
                    if(top_3_opisanie_use() === true)
                        disable_bottom();

                    if(global_settings.get_geroy_skill("def_fier_2") === true)
                        effect_top_3_2.color = "green";
                    else
                        effect_top_3_2.color = "blue";
                }
                onClicked:
                {
                    if(top_3_opisanie_use() === false)
                        return;

                    click_button_fon_2("def_fier_2");
                }
            }
        }

        Rectangle
        {
            id: top_3_3
            height: fon.height * 0.1
            width: top_3_3.height
            anchors.bottom: top_2_1.top
            anchors.bottomMargin: fon.height * 0.025
            anchors.left: top_3_1.right
            anchors.leftMargin: fon.height * 0.025

            RectangularGlow
            {
                id: effect_top_3_3
                anchors.fill: top_3_3
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_top_3_3
                height: parent.height
                width: parent.width
                anchors.centerIn: top_3_3
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(top_3_opisanie_use() === true)
                    {
                        show_bottom();
                        opisanie_2_text.text = "Герой преобретает иммунитет к Холоду";
                    }

                    effect_top_3_3.color = "indigo";
                }
                onExited:
                {
                    if(top_3_opisanie_use() === true)
                        disable_bottom();

                    if(global_settings.get_geroy_skill("def_cold_2") === true)
                        effect_top_3_3.color = "green";
                    else
                        effect_top_3_3.color = "blue";
                }
                onClicked:
                {
                    if(top_3_opisanie_use() === false)
                        return;

                    click_button_fon_2("def_cold_2");
                }
            }
        }

        Rectangle
        {
            id: bottom_3_1
            height: fon.height * 0.1
            width: bottom_3_1.height
            anchors.top: bottom_2_1.bottom
            anchors.topMargin: fon.height * 0.025
            anchors.horizontalCenter: rect_main.horizontalCenter

            RectangularGlow
            {
                id: effect_bottom_3_1
                anchors.fill: bottom_3_1
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_bottom_3_1
                height: parent.height
                width: parent.width
                anchors.centerIn: bottom_3_1
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(bottom_3_opisanie_use() === true)
                    {
                        show_top();
                        opisanie_2_text.text = "Увеличение постоянного эффекта к инициативе всех в отряде повышается до 40%";
                    }

                    effect_bottom_3_1.color = "indigo";
                }
                onExited:
                {
                    if(bottom_3_opisanie_use() === true)
                        disable_top();

                    if(global_settings.get_geroy_skill("inishiativa_2") === true)
                        effect_bottom_3_1.color = "green";
                    else
                        effect_bottom_3_1.color = "blue";
                }
                onClicked:
                {
                    if(bottom_3_opisanie_use() === false)
                        return;

                    click_button_fon_2("inishiativa_2");
                }
            }
        }

        Rectangle
        {
            id: bottom_3_2
            height: fon.height * 0.1
            width: bottom_3_2.height
            anchors.top: bottom_2_1.bottom
            anchors.topMargin: fon.height * 0.025
            anchors.right: bottom_3_1.left
            anchors.rightMargin: fon.height * 0.025

            RectangularGlow
            {
                id: effect_bottom_3_2
                anchors.fill: bottom_3_2
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_bottom_3_2
                height: parent.height
                width: parent.width
                anchors.centerIn: bottom_3_2
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(bottom_3_opisanie_use() === true)
                    {
                        show_top();
                        opisanie_2_text.text = "Герой преобретает иммунитет к Яду";
                    }

                    effect_bottom_3_2.color = "indigo";
                }
                onExited:
                {
                    if(bottom_3_opisanie_use() === true)
                        disable_top();

                    if(global_settings.get_geroy_skill("def_poison_2") === true)
                        effect_bottom_3_2.color = "green";
                    else
                        effect_bottom_3_2.color = "blue";
                }
                onClicked:
                {
                    if(bottom_3_opisanie_use() === false)
                        return;

                    click_button_fon_2("def_poison_2");
                }
            }
        }

        Rectangle
        {
            id: bottom_3_3
            height: fon.height * 0.1
            width: bottom_3_3.height
            anchors.top: bottom_2_1.bottom
            anchors.topMargin: fon.height * 0.025
            anchors.left: bottom_3_1.right
            anchors.leftMargin: fon.height * 0.025

            RectangularGlow
            {
                id: effect_bottom_3_3
                anchors.fill: bottom_3_3
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_bottom_3_3
                height: parent.height
                width: parent.width
                anchors.centerIn: bottom_3_3
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(bottom_3_opisanie_use() === true)
                    {
                        show_top();
                        opisanie_2_text.text = "Герой преобретает иммунитет к Молнии";
                    }

                    effect_bottom_3_3.color = "indigo";
                }
                onExited:
                {
                    if(bottom_3_opisanie_use() === true)
                        disable_top();

                    if(global_settings.get_geroy_skill("def_electriciti_2") === true)
                        effect_bottom_3_3.color = "green";
                    else
                        effect_bottom_3_3.color = "blue";
                }
                onClicked:
                {
                    if(bottom_3_opisanie_use() === false)
                        return;

                    click_button_fon_2("def_electriciti_2");
                }
            }
        }

        Rectangle
        {
            id: right_3_1
            height: fon.height * 0.1
            width: right_3_1.height
            anchors.left: right_2_1.right
            anchors.leftMargin: fon.height * 0.025
            anchors.verticalCenter: rect_main.verticalCenter

            RectangularGlow
            {
                id: effect_right_3_1
                anchors.fill: right_3_1
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_right_3_1
                height: parent.height
                width: parent.width
                anchors.centerIn: right_3_1
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(right_3_opisanie_use() === true)
                    {
                        show_left();
                        opisanie_2_text.text = "Регенерирует 5% от максимальноко количества здоровья за ход";
                    }

                    effect_right_3_1.color = "indigo";                    
                }
                onExited:
                {
                    if(right_3_opisanie_use() === true)
                        disable_left();

                    if(global_settings.get_geroy_skill("bron_regen_1") === true)
                        effect_right_3_1.color = "green";
                    else
                        effect_right_3_1.color = "blue";
                }
                onClicked:
                {
                    if(right_3_opisanie_use() === false)
                        return;

                    click_button_fon_2("bron_regen_1");
                }
            }
        }

        Rectangle
        {
            id: right_3_2
            height: fon.height * 0.1
            width: right_3_2.height
            anchors.left: right_2_1.right
            anchors.leftMargin: fon.height * 0.025
            anchors.bottom: right_3_1.top
            anchors.bottomMargin: fon.height * 0.025

            RectangularGlow
            {
                id: effect_right_3_2
                anchors.fill: right_3_2
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_right_3_2
                height: parent.height
                width: parent.width
                anchors.centerIn: right_3_2
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(right_3_opisanie_use() === true)
                    {
                        show_left();
                        opisanie_2_text.text = "Увеличение постоянного эффекта брони героя до 40";
                    }

                    effect_right_3_2.color = "indigo";                    
                }
                onExited:
                {
                    if(right_3_opisanie_use() === true)
                        disable_left();

                    if(global_settings.get_geroy_skill("bron_3") === true)
                        effect_right_3_2.color = "green";
                    else
                        effect_right_3_2.color = "blue";
                }
                onClicked:
                {
                    if(right_3_opisanie_use() === false)
                        return;

                    click_button_fon_2("bron_3");
                }
            }
        }

        Rectangle
        {
            id: right_3_3
            height: fon.height * 0.1
            width: right_3_3.height
            anchors.left: right_2_1.right
            anchors.leftMargin: fon.height * 0.025
            anchors.top: right_3_1.bottom
            anchors.topMargin: fon.height * 0.025

            RectangularGlow
            {
                id: effect_right_3_3
                anchors.fill: right_3_3
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_right_3_3
                height: parent.height
                width: parent.width
                anchors.centerIn: right_3_3
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(right_3_opisanie_use() === true)
                    {
                        show_left();
                        opisanie_2_text.text = "Увеличение постоянного эффекта к здоровью до 50%";
                    }

                    effect_right_3_3.color = "indigo";                    
                }
                onExited:
                {
                    if(right_3_opisanie_use() === true)
                        disable_left();

                    if(global_settings.get_geroy_skill("bron_life_2") === true)
                        effect_right_3_3.color = "green";
                    else
                        effect_right_3_3.color = "blue";
                }
                onClicked:
                {
                    if(right_3_opisanie_use() === false)
                        return;

                    click_button_fon_2("bron_life_2");
                }
            }
        }

        Rectangle
        {
            id: left_4_1
            height: fon.height * 0.1
            width: left_4_1.height
            anchors.right: left_3_1.left
            anchors.rightMargin: fon.height * 0.025
            anchors.top: rect_main.verticalCenter
            anchors.topMargin: (fon.height * 0.025) /2

            RectangularGlow
            {
                id: effect_left_4_1
                anchors.fill: left_4_1
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_left_4_1
                height: parent.height
                width: parent.width
                anchors.centerIn: left_4_1
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(left_4_opisanie_use() === true)
                    {
                        show_right();
                        opisanie_2_text.text = "При попадании с возросшей вероятностью 50%(для мага 10%) наводит ужас на цель. От ужаса цель пропустит следующий ход";
                    }

                    effect_left_4_1.color = "indigo";
                }
                onExited:
                {
                    if(left_4_opisanie_use() === true)
                        disable_right();

                    if(global_settings.get_geroy_skill("damage_ushas_2") === true)
                        effect_left_4_1.color = "green";
                    else
                        effect_left_4_1.color = "blue";
                }
                onClicked:
                {
                    if(left_4_opisanie_use() === false)
                        return;

                    click_button_fon_2("damage_ushas_2");
                }
            }
        }

        Rectangle
        {
            id: left_4_2
            height: fon.height * 0.1
            width: left_4_2.height
            anchors.right: left_3_1.left
            anchors.rightMargin: fon.height * 0.025
            anchors.bottom: rect_main.verticalCenter
            anchors.bottomMargin: (fon.height * 0.025) /2

            RectangularGlow
            {
                id: effect_left_4_2
                anchors.fill: left_4_2
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_left_4_2
                height: parent.height
                width: parent.width
                anchors.centerIn: left_4_2
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(left_4_opisanie_use() === true)
                    {
                        show_right();
                        opisanie_2_text.text = "Все в отряде кроме самого героя получают повышенный постоянный эффект к урону 25%";
                    }

                    effect_left_4_2.color = "indigo";
                }
                onExited:
                {
                    if(left_4_opisanie_use() === true)
                        disable_right();

                    if(global_settings.get_geroy_skill("damage_all_team_2") === true)
                        effect_left_4_2.color = "green";
                    else
                        effect_left_4_2.color = "blue";
                }
                onClicked:
                {
                    if(left_4_opisanie_use() === false)
                        return;

                    click_button_fon_2("damage_all_team_2");
                }
            }
        }

        Rectangle
        {
            id: left_4_3
            height: fon.height * 0.1
            width: left_4_3.height
            anchors.right: left_3_1.left
            anchors.rightMargin: fon.height * 0.025
            anchors.top: left_4_1.bottom
            anchors.topMargin: fon.height * 0.025

            RectangularGlow
            {
                id: effect_left_4_3
                anchors.fill: left_4_3
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_left_4_3
                height: parent.height
                width: parent.width
                anchors.centerIn: left_4_3
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(left_4_opisanie_use() === true)
                    {
                        show_right();
                        opisanie_2_text.text = "Увеличивает восполнение здоровья герою в объеме 50% от нанесенного урона по одной цели или 10% по множественным целям(герой маг)";
                    }

                    effect_left_4_3.color = "indigo";
                }
                onExited:
                {
                    if(left_4_opisanie_use() === true)
                        disable_right();

                    if(global_settings.get_geroy_skill("damage_vampir_2") === true)
                        effect_left_4_3.color = "green";
                    else
                        effect_left_4_3.color = "blue";
                }
                onClicked:
                {
                    if(left_4_opisanie_use() === false)
                        return;

                    click_button_fon_2("damage_vampir_2");
                }
            }
        }

        Rectangle
        {
            id: left_4_4
            height: fon.height * 0.1
            width: left_4_4.height
            anchors.right: left_3_1.left
            anchors.rightMargin: fon.height * 0.025
            anchors.bottom: left_4_2.top
            anchors.bottomMargin: fon.height * 0.025

            RectangularGlow
            {
                id: effect_left_4_4
                anchors.fill: left_4_4
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_left_4_4
                height: parent.height
                width: parent.width
                anchors.centerIn: left_4_4
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(left_4_opisanie_use() === true)
                    {
                        show_right();
                        opisanie_2_text.text = "отравляет противника на 2 следующих хода. Урон ядом увеличивается до 40%(для героя мага 20%) от нанесенного урона. Эффект не суммируется и не обновляется после первого хода";
                    }

                    effect_left_4_4.color = "indigo";
                }
                onExited:
                {
                    if(left_4_opisanie_use() === true)
                        disable_right();

                    if(global_settings.get_geroy_skill("damage_poison_2") === true)
                        effect_left_4_4.color = "green";
                    else
                        effect_left_4_4.color = "blue";
                }
                onClicked:
                {
                    if(left_4_opisanie_use() === false)
                        return;

                    click_button_fon_2("damage_poison_2");
                }
            }
        }

        Rectangle
        {
            id: right_4_1
            height: fon.height * 0.1
            width: right_4_1.height
            anchors.left: right_3_1.right
            anchors.leftMargin: fon.height * 0.025
            anchors.top: rect_main.verticalCenter
            anchors.topMargin: (fon.height * 0.025) /2

            RectangularGlow
            {
                id: effect_right_4_1
                anchors.fill: right_4_1
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_right_4_1
                height: parent.height
                width: parent.width
                anchors.centerIn: right_4_1
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(right_4_opisanie_use() === true)
                    {
                        show_left();
                        opisanie_2_text.text = "Накладывает магический щит в размере 10% от максимального здоровья героя. Обновляется каждый ход";
                    }

                    effect_right_4_1.color = "indigo";
                }
                onExited:
                {
                    if(right_4_opisanie_use() === true)
                        disable_left();

                    if(global_settings.get_geroy_skill("bron_shit_1") === true)
                        effect_right_4_1.color = "green";
                    else
                        effect_right_4_1.color = "blue";
                }
                onClicked:
                {
                    if(right_4_opisanie_use() === false)
                        return;

                    click_button_fon_2("bron_shit_1");
                }
            }
        }

        Rectangle
        {
            id: right_4_2
            height: fon.height * 0.1
            width: right_4_2.height
            anchors.left: right_3_1.right
            anchors.leftMargin: fon.height * 0.025
            anchors.bottom: rect_main.verticalCenter
            anchors.bottomMargin: (fon.height * 0.025) /2

            RectangularGlow
            {
                id: effect_right_4_2
                anchors.fill: right_4_2
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_right_4_2
                height: parent.height
                width: parent.width
                anchors.centerIn: right_4_2
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(right_4_opisanie_use() === true)
                    {
                        show_left();
                        opisanie_2_text.text = "Увеличивает регенерацию до 12% от максимальноко количества здоровья за ход";
                    }

                    effect_right_4_2.color = "indigo";
                }
                onExited:
                {
                    if(right_4_opisanie_use() === true)
                        disable_left();

                    if(global_settings.get_geroy_skill("bron_regen_2") === true)
                        effect_right_4_2.color = "green";
                    else
                        effect_right_4_2.color = "blue";
                }
                onClicked:
                {
                    if(right_4_opisanie_use() === false)
                        return;

                    click_button_fon_2("bron_regen_2");
                }
            }
        }

        Rectangle
        {
            id: right_4_3
            height: fon.height * 0.1
            width: right_4_3.height
            anchors.left: right_3_1.right
            anchors.leftMargin: fon.height * 0.025
            anchors.top: right_4_1.bottom
            anchors.topMargin: fon.height * 0.025

            RectangularGlow
            {
                id: effect_right_4_3
                anchors.fill: right_4_3
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_right_4_3
                height: parent.height
                width: parent.width
                anchors.centerIn: right_4_3
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(right_4_opisanie_use() === true)
                    {
                        show_left();
                        opisanie_2_text.text = "Увеличение постоянного эффекта к здоровью до 75%";
                    }

                    effect_right_4_3.color = "indigo";                    
                }
                onExited:
                {
                    if(right_4_opisanie_use() === true)
                        disable_left();

                    if(global_settings.get_geroy_skill("bron_life_3") === true)
                        effect_right_4_3.color = "green";
                    else
                        effect_right_4_3.color = "blue";
                }
                onClicked:
                {
                    if(right_4_opisanie_use() === false)
                        return;

                    click_button_fon_2("bron_life_3");
                }
            }
        }

        Rectangle
        {
            id: right_4_4
            height: fon.height * 0.1
            width: right_4_4.height
            anchors.left: right_3_1.right
            anchors.leftMargin: fon.height * 0.025
            anchors.bottom: right_4_2.top
            anchors.bottomMargin: fon.height * 0.025

            RectangularGlow
            {
                id: effect_right_4_4
                anchors.fill: right_4_4
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_right_4_4
                height: parent.height
                width: parent.width
                anchors.centerIn: right_4_4
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    if(right_4_opisanie_use() === true)
                    {
                        show_left();
                        opisanie_2_text.text = "Увеличение постоянного эффекта брони героя до 60";
                    }

                    effect_right_4_4.color = "indigo";
                }
                onExited:
                {
                    if(right_4_opisanie_use() === true)
                        disable_left();

                    if(global_settings.get_geroy_skill("bron_4") === true)
                        effect_right_4_4.color = "green";
                    else
                        effect_right_4_4.color = "blue";
                }
                onClicked:
                {
                    if(right_4_opisanie_use() === false)
                        return;

                    click_button_fon_2("bron_4");
                }
            }
        }

        Text
        {
            id: input_text
            width: fon_2.width * 0.5
            height: fon.height * 0.05
            anchors.top: fon_2.top
            anchors.topMargin: fon.height * 0.005
            anchors.horizontalCenter: fon_2.horizontalCenter
            wrapMode: TextEdit.WordWrap
            color: "white"
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 16
            fontSizeMode: Text.Fit
            minimumPointSize: 8
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            text: "Выберите пассивное умение"
        }

        Text
        {
            id: number_points
            width: fon_2.width * 0.5
            height: fon.height * 0.05
            anchors.bottom: fon_2.bottom
            anchors.bottomMargin: fon.height * 0.005
            anchors.horizontalCenter: fon_2.horizontalCenter
            wrapMode: TextEdit.WordWrap
            color: "white"
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 16
            fontSizeMode: Text.Fit
            minimumPointSize: 8
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            text: "Осталось баллов: " + global_settings.get_point_2();
        }

        Rectangle
        {
            id: opisanie_2
            height: fon.height * 0.2
            width: opisanie_2.height * 2
            radius: 10
            visible: false

            gradient: Gradient
            {
                GradientStop { position: 0.0 ; color: "#33ccff" }
                GradientStop { position: 0.1 ; color: "#33ccff" }
                GradientStop { position: 0.2 ; color: "#00bfff" }
                GradientStop { position: 0.8 ; color: "#00bfff" }
                GradientStop { position: 0.9 ; color: "#33ccff" }
                GradientStop { position: 1.0 ; color: "#33ccff" }
            }

            Text
            {
                id: opisanie_2_text
                width: opisanie_2.width
                height: opisanie_2.height
                anchors.centerIn: opisanie_2
                wrapMode: TextEdit.WordWrap
                color: "white"
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 12
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Image
        {
            id: next_2
            height: fon.height * 0.1
            width: next_2.height
            anchors.bottom: fon_2.bottom
            anchors.bottomMargin: fon_2.height * 0.05
            anchors.right: fon_2.right
            anchors.rightMargin: fon_2.height * 0.1
            source: "file:///" + applicationDirPath + "/image/up_level/st_blue.png";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    next_2.source = "file:///" + applicationDirPath + "/image/up_level/st_green.png";
                }
                onExited:
                {
                    next_2.source = "file:///" + applicationDirPath + "/image/up_level/st_blue.png";
                }
                onClicked:
                {
                    fon_2.visible = false;
                    fon_3.visible = true;
                    repaint_fon_3();
                }
            }
        }
    }

    Image
    {
        id: fon_3
        height: parent.height
        width: parent.width
        anchors.centerIn: parent
        source: "file:///" + applicationDirPath + "/image/up_level/fon_3.jpg";
        visible: false

        Text
        {
            id: top_text
            width: fon_3.width * 0.5
            height: fon_3.height * 0.1
            wrapMode: TextEdit.WordWrap
            color: "white"
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 18
            fontSizeMode: Text.Fit
            minimumPointSize: 8
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Rectangle
        {
            id: select_1
            height: fon_3.height * 0.25
            width: select_1.height
            anchors.top: top_text.bottom
            anchors.topMargin: fon_3.height * 0.1
            anchors.right: fon_3.horizontalCenter
            anchors.rightMargin: fon_3.height * 0.2

            RectangularGlow
            {
                id: effect_select_1
                anchors.fill: select_1
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_select_1
                height: parent.height
                width: parent.width
                anchors.centerIn: select_1
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    effect_select_1.color = "indigo";
                    magic_select(1);
                    opisanie_3.visible = true;
                }
                onExited:
                {
                    effect_select_1.color = "blue";
                    opisanie_3.visible = false;
                }
                onClicked:
                {
                    if(name_magic != "") // в случае если еще не сработал Hover(курсор уже там стоял)
                    {
                        global_settings.set_books_magic(global_settings.get_books_magic_use() - 1,name_magic);
                        repaint_fon_3();
                    }
                }
            }
        }

        Rectangle
        {
            id: select_2
            height: fon_3.height * 0.25
            width: select_2.height
            anchors.top: top_text.bottom
            anchors.topMargin: fon_3.height * 0.1
            anchors.left: fon_3.horizontalCenter
            anchors.leftMargin: fon_3.height * 0.2

            RectangularGlow
            {
                id: effect_select_2
                anchors.fill: select_2
                glowRadius: 10
                spread: 0.2
                color: "blue"
            }

            Image
            {
                id: image_select_2
                height: parent.height
                width: parent.width
                anchors.centerIn: select_2
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    effect_select_2.color = "indigo";
                    magic_select(2);
                    opisanie_3.visible = true;
                }
                onExited:
                {
                    effect_select_2.color = "blue";
                    opisanie_3.visible = false;
                }
                onClicked:
                {
                    if(name_magic != "") // в случае если еще не сработал Hover(курсор уже там стоял)
                    {
                        global_settings.set_books_magic(global_settings.get_books_magic_use() - 1,name_magic);
                        repaint_fon_3();
                    }
                }
            }
        }

        Rectangle
        {
            id: opisanie_3
            height: select_1.height
            width: fon_3.width * 0.5
            color: "white"
            anchors.top: select_1.bottom
            anchors.topMargin: select_1.height * 0.5
            anchors.horizontalCenter: fon_3.horizontalCenter
            radius: 10
            visible: false

            gradient: Gradient
            {
                GradientStop { position: 0.0 ; color: "#33ccff" }
                GradientStop { position: 0.1 ; color: "#33ccff" }
                GradientStop { position: 0.2 ; color: "#00bfff" }
                GradientStop { position: 0.8 ; color: "#00bfff" }
                GradientStop { position: 0.9 ; color: "#33ccff" }
                GradientStop { position: 1.0 ; color: "#33ccff" }
            }

            Text
            {
                id: opisanie_3_text
                width: opisanie_3.width
                height: opisanie_3.height
                anchors.centerIn: opisanie_3
                wrapMode: TextEdit.WordWrap
                color: "white"
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 14
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Image
        {
            id: next_3
            height: fon.height * 0.1
            width: next_3.height
            anchors.bottom: fon_3.bottom
            anchors.bottomMargin: fon_3.height * 0.05
            anchors.right: fon_3.right
            anchors.rightMargin: fon_3.height * 0.1
            source: "file:///" + applicationDirPath + "/image/up_level/st_blue.png";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    next_3.source = "file:///" + applicationDirPath + "/image/up_level/st_green.png";
                }
                onExited:
                {
                    next_3.source = "file:///" + applicationDirPath + "/image/up_level/st_blue.png";
                }
                onClicked:
                {
                    item_loader_windows.settings_select("army.qml");
                }
            }
        }
    }

    ESC
    {
        id:esc_esc
    }
}
