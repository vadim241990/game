import QtQuick 2.4
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.3

Rectangle
{
    id:main_rect

    property int page: 0;
    property int level_building: 0; //от 0 до 4

    function update_resurs()
    {
        parent.update_gold_and_ruda();
    }

    function button_visible(name)
    {
        if(global_settings.get_building(name) === true){
            menu_ok.visible = false;
            menu_cansel.visible = false;
        }else{
            menu_ok.visible = true;
            menu_cansel.visible = true;
        }
    }

    function parsing_string(adress,name,level)
    {
        level_building = level;
        var start_index = 0;
        var massiv = new Array(11);

        var stroka = global_settings.read_XML(adress,name,level);

        var end_index = stroka.indexOf("#"); //заполняем название здания
        var name_res = stroka.slice(start_index,end_index);
        if(level === 0)
            menu_buy_text.text = name_res;
        else if(level === 1)
            menu_buy_text.text = name_res + " ур.5";
        else if(level === 2)
            menu_buy_text.text = name_res + " ур.10";
        else if(level === 3)
            menu_buy_text.text = name_res + " ур.17";
        else if(level === 4)
            menu_buy_text.text = name_res + " ур.25";

        for(var i = 0; i < massiv.length; i++) //парсинг строки
        {
            start_index = end_index;
            end_index = stroka.indexOf("#",start_index + 1);
            massiv[i] = stroka.slice(start_index + 1,end_index);
        }

        if(massiv[7] === "")
            massiv[7] = "Нет";
        if(massiv[8] === "")
            massiv[8] = "Нет";

        if((name === "lekar") || (name === "shelitel"))
        {
            model_list.set(2, {"name_model":"Лечение:", "value_model": massiv[2], "value_color": "white"});
        }
        else
        {
            model_list.set(2, {"name_model":"Урон:", "value_model": massiv[2], "value_color": "white"});
        }

        model_list.set(0, {"name_model":"Тип оружия:", "value_model": massiv[0], "value_color": "white"});
        model_list.set(1, {"name_model":"Вероятность попадения:", "value_model": massiv[1], "value_color": "white"});
        model_list.set(3, {"name_model":"Жизнь:", "value_model": massiv[3], "value_color": "red"});
        model_list.set(4, {"name_model":"Броня:", "value_model": massiv[4], "value_color": "white"});
        model_list.set(5, {"name_model":"Инициатива:", "value_model": massiv[5], "value_color": "white"});
        model_list.set(6, {"name_model":"Цель:", "value_model": massiv[6], "value_color": "white"});
        model_list.set(7, {"name_model":"Защита:", "value_model": massiv[7], "value_color": "white"});
        model_list.set(8, {"name_model":"Иммунитет:", "value_model": massiv[8], "value_color": "yellow"});
        model_list.set(9, {"name_model":"Цель атак:", "value_model": massiv[9], "value_color": "white"});
        model_list.set(10,{"name_model":"Описание:", "value_model": massiv[10], "value_color": "white"});
    }

    function repaint(number)
    {
        if((number > 1) && (number < 6))
           page = number;
        else
           return;

        if(number === 2)
        {
            fon.source = "file:///" + applicationDirPath + "/image/boez/boez_fon.jpg";

            if(global_settings.get_building("skelet_1") === false)
            {
                stolb_1_1.source = "file:///" + applicationDirPath + "/image/boez/boez_skelet_1_black.jpg";
                stolb_1_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_1_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_1_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_1_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                stolb_1_1.source = "file:///" + applicationDirPath + "/image/boez/boez_skelet_1.jpg";
                if(global_settings.get_building("skelet_2") === false)
                {
                    stolb_1_2.source = "file:///" + applicationDirPath + "/image/boez/boez_skelet_2_black.jpg";
                    stolb_1_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_1_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_1_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_1_2.source = "file:///" + applicationDirPath + "/image/boez/boez_skelet_2.jpg";
                        if(global_settings.get_building("skelet_3") === false)
                        {
                            stolb_1_3.source = "file:///" + applicationDirPath + "/image/boez/boez_skelet_3_black.jpg";
                            stolb_1_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                            stolb_1_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_1_3.source = "file:///" + applicationDirPath + "/image/boez/boez_skelet_3.jpg";
                            if(global_settings.get_building("skelet_4") === false)
                            {
                                stolb_1_4.source = "file:///" + applicationDirPath + "/image/boez/boez_skelet_4_black.jpg";
                                stolb_1_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                            }
                            else
                            {
                                stolb_1_4.source = "file:///" + applicationDirPath + "/image/boez/boez_skelet_4.jpg";
                                if(global_settings.get_building("skelet_5") === false)
                                    stolb_1_5.source = "file:///" + applicationDirPath + "/image/boez/boez_skelet_5_black.jpg";
                                else
                                    stolb_1_5.source = "file:///" + applicationDirPath + "/image/boez/boez_skelet_5.jpg";
                            }
                        }
                    }
                } //конец первого столбца

                if(global_settings.get_building("ogr_1") === false)
                {
                    stolb_2_1.source = "file:///" + applicationDirPath + "/image/boez/boez_ogr_1_black.jpg";
                    stolb_2_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_2_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_2_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_2_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_2_1.source = "file:///" + applicationDirPath + "/image/boez/boez_ogr_1.jpg";
                    if(global_settings.get_building("ogr_2") === false)
                    {
                        stolb_2_2.source = "file:///" + applicationDirPath + "/image/boez/boez_ogr_2_black.jpg";
                        stolb_2_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_2_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_2_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_2_2.source = "file:///" + applicationDirPath + "/image/boez/boez_ogr_2.jpg";
                        if(global_settings.get_building("ogr_3") === false)
                        {
                            stolb_2_3.source = "file:///" + applicationDirPath + "/image/boez/boez_ogr_3_black.jpg";
                            stolb_2_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                            stolb_2_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_2_3.source = "file:///" + applicationDirPath + "/image/boez/boez_ogr_3.jpg";
                            if(global_settings.get_building("ogr_4") === false)
                            {
                                stolb_2_4.source = "file:///" + applicationDirPath + "/image/boez/boez_ogr_4_black.jpg";
                                stolb_2_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                            }
                            else
                            {
                                stolb_2_4.source = "file:///" + applicationDirPath + "/image/boez/boez_ogr_4.jpg";
                                if(global_settings.get_building("ogr_5") === false)
                                    stolb_2_5.source = "file:///" + applicationDirPath + "/image/boez/boez_ogr_5_black.jpg";
                                else
                                    stolb_2_5.source = "file:///" + applicationDirPath + "/image/boez/boez_ogr_5.jpg";
                            }
                        }
                    }
                } //конец 2-го столбца

                if(global_settings.get_building("boez_cold_1") === false)
                {
                    stolb_3_1.source = "file:///" + applicationDirPath + "/image/boez/boez_cold_1_black.jpg";
                    stolb_3_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_3_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_3_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_3_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_3_1.source = "file:///" + applicationDirPath + "/image/boez/boez_cold_1.jpg";
                    if(global_settings.get_building("boez_cold_2") === false)
                    {
                        stolb_3_2.source = "file:///" + applicationDirPath + "/image/boez/boez_cold_2_black.jpg";
                        stolb_3_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_3_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_3_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_3_2.source = "file:///" + applicationDirPath + "/image/boez/boez_cold_2.jpg";
                        if(global_settings.get_building("boez_cold_3") === false)
                        {
                            stolb_3_3.source = "file:///" + applicationDirPath + "/image/boez/boez_cold_3_black.jpg";
                            stolb_3_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                            stolb_3_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_3_3.source = "file:///" + applicationDirPath + "/image/boez/boez_cold_3.jpg";
                            if(global_settings.get_building("boez_cold_4") === false)
                            {
                                stolb_3_4.source = "file:///" + applicationDirPath + "/image/boez/boez_cold_4_black.jpg";
                                stolb_3_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                            }
                            else
                            {
                                stolb_3_4.source = "file:///" + applicationDirPath + "/image/boez/boez_cold_4.jpg";
                                if(global_settings.get_building("boez_cold_5") === false)
                                    stolb_3_5.source = "file:///" + applicationDirPath + "/image/boez/boez_cold_5_black.jpg";
                                else
                                    stolb_3_5.source = "file:///" + applicationDirPath + "/image/boez/boez_cold_5.jpg";
                            }
                        }
                    }
                } //конец 3-го столбца

                if(global_settings.get_building("boez_fier_1") === false)
                {
                    stolb_4_1.source = "file:///" + applicationDirPath + "/image/boez/boez_fier_1_black.jpg";
                    stolb_4_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_4_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_4_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_4_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_4_1.source = "file:///" + applicationDirPath + "/image/boez/boez_fier_1.jpg";
                    if(global_settings.get_building("boez_fier_2") === false)
                    {
                        stolb_4_2.source = "file:///" + applicationDirPath + "/image/boez/boez_fier_2_black.jpg";
                        stolb_4_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_4_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_4_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_4_2.source = "file:///" + applicationDirPath + "/image/boez/boez_fier_2.jpg";
                        if(global_settings.get_building("boez_fier_3") === false)
                        {
                            stolb_4_3.source = "file:///" + applicationDirPath + "/image/boez/boez_fier_3_black.jpg";
                            stolb_4_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                            stolb_4_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_4_3.source = "file:///" + applicationDirPath + "/image/boez/boez_fier_3.jpg";
                            if(global_settings.get_building("boez_fier_4") === false)
                            {
                                stolb_4_4.source = "file:///" + applicationDirPath + "/image/boez/boez_fier_4_black.jpg";
                                stolb_4_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                            }
                            else
                            {
                                stolb_4_4.source = "file:///" + applicationDirPath + "/image/boez/boez_fier_4.jpg";
                                if(global_settings.get_building("boez_fier_5") === false)
                                    stolb_4_5.source = "file:///" + applicationDirPath + "/image/boez/boez_fier_5_black.jpg";
                                else
                                    stolb_4_5.source = "file:///" + applicationDirPath + "/image/boez/boez_fier_5.jpg";
                            }
                        }
                    }
                } //конец 4-го столбца

                if(global_settings.get_building("boez_vsadnik_1") === false)
                {
                    stolb_5_1.source = "file:///" + applicationDirPath + "/image/boez/boez_vsadnik_1_black.jpg";
                    stolb_5_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_5_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_5_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_5_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_5_1.source = "file:///" + applicationDirPath + "/image/boez/boez_vsadnik_1.jpg";
                    if(global_settings.get_building("boez_vsadnik_2") === false)
                    {
                        stolb_5_2.source = "file:///" + applicationDirPath + "/image/boez/boez_vsadnik_2_black.jpg";
                        stolb_5_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_5_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_5_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_5_2.source = "file:///" + applicationDirPath + "/image/boez/boez_vsadnik_2.jpg";
                        if(global_settings.get_building("boez_vsadnik_3") === false)
                        {
                            stolb_5_3.source = "file:///" + applicationDirPath + "/image/boez/boez_vsadnik_3_black.jpg";
                            stolb_5_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                            stolb_5_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_5_3.source = "file:///" + applicationDirPath + "/image/boez/boez_vsadnik_3.jpg";
                            if(global_settings.get_building("boez_vsadnik_4") === false)
                            {
                                stolb_5_4.source = "file:///" + applicationDirPath + "/image/boez/boez_vsadnik_4_black.jpg";
                                stolb_5_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                            }
                            else
                            {
                                stolb_5_4.source = "file:///" + applicationDirPath + "/image/boez/boez_vsadnik_4.jpg";
                                if(global_settings.get_building("boez_vsadnik_5") === false)
                                    stolb_5_5.source = "file:///" + applicationDirPath + "/image/boez/boez_vsadnik_5_black.jpg";
                                else
                                    stolb_5_5.source = "file:///" + applicationDirPath + "/image/boez/boez_vsadnik_5.jpg";
                            }
                        }
                    }
                } //конец 5-го столбца
        }
        else if(number === 3)
        {
            fon.source = "file:///" + applicationDirPath + "/image/killers/killers_fon.jpg";

            if(global_settings.get_building("arbaletshik_1") === false)
            {
                stolb_1_1.source = "file:///" + applicationDirPath + "/image/killers/arbaletshik_1_black.jpg";
                stolb_1_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_1_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_1_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_1_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                stolb_1_1.source = "file:///" + applicationDirPath + "/image/killers/arbaletshik_1.jpg";
                if(global_settings.get_building("arbaletshik_2") === false)
                {
                    stolb_1_2.source = "file:///" + applicationDirPath + "/image/killers/arbaletshik_2_black.jpg";
                    stolb_1_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_1_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_1_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_1_2.source = "file:///" + applicationDirPath + "/image/killers/arbaletshik_2.jpg";
                    if(global_settings.get_building("arbaletshik_3") === false)
                    {
                        stolb_1_3.source = "file:///" + applicationDirPath + "/image/killers/arbaletshik_3_black.jpg";
                        stolb_1_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_1_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_1_3.source = "file:///" + applicationDirPath + "/image/killers/arbaletshik_3.jpg";
                        if(global_settings.get_building("arbaletshik_4") === false)
                        {
                            stolb_1_4.source = "file:///" + applicationDirPath + "/image/killers/arbaletshik_4_black.jpg";
                            stolb_1_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_1_4.source = "file:///" + applicationDirPath + "/image/killers/arbaletshik_4.jpg";
                            if(global_settings.get_building("skelet_5") === false)
                                stolb_1_5.source = "file:///" + applicationDirPath + "/image/killers/arbaletshik_5_black.jpg";
                            else
                                stolb_1_5.source = "file:///" + applicationDirPath + "/image/killers/arbaletshik_5.jpg";
                        }
                    }
                }
            } //конец первого столбца

            if(global_settings.get_building("dark_mag_1") === false)
            {
                stolb_2_1.source = "file:///" + applicationDirPath + "/image/killers/dark_mag_1_black.jpg";
                stolb_2_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_2_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_2_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_2_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                stolb_2_1.source = "file:///" + applicationDirPath + "/image/killers/dark_mag_1.jpg";
                if(global_settings.get_building("dark_mag_2") === false)
                {
                    stolb_2_2.source = "file:///" + applicationDirPath + "/image/killers/dark_mag_2_black.jpg";
                    stolb_2_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_2_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_2_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_2_2.source = "file:///" + applicationDirPath + "/image/killers/dark_mag_2.jpg";
                    if(global_settings.get_building("dark_mag_3") === false)
                    {
                        stolb_2_3.source = "file:///" + applicationDirPath + "/image/killers/dark_mag_3_black.jpg";
                        stolb_2_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_2_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_2_3.source = "file:///" + applicationDirPath + "/image/killers/dark_mag_3.jpg";
                        if(global_settings.get_building("dark_mag_4") === false)
                        {
                            stolb_2_4.source = "file:///" + applicationDirPath + "/image/killers/dark_mag_4_black.jpg";
                            stolb_2_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_2_4.source = "file:///" + applicationDirPath + "/image/killers/dark_mag_4.jpg";
                            if(global_settings.get_building("dark_mag_5") === false)
                                stolb_2_5.source = "file:///" + applicationDirPath + "/image/killers/dark_mag_5_black.jpg";
                            else
                                stolb_2_5.source = "file:///" + applicationDirPath + "/image/killers/dark_mag_5.jpg";
                        }
                    }
                }
            } //конец 2-го столбца

            if(global_settings.get_building("fire_mag_1") === false)
            {
                stolb_3_1.source = "file:///" + applicationDirPath + "/image/killers/fire_mag_1_black.jpg";
                stolb_3_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_3_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_3_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_3_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                stolb_3_1.source = "file:///" + applicationDirPath + "/image/killers/fire_mag_1.jpg";
                if(global_settings.get_building("fire_mag_2") === false)
                {
                    stolb_3_2.source = "file:///" + applicationDirPath + "/image/killers/fire_mag_2_black.jpg";
                    stolb_3_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_3_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_3_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_3_2.source = "file:///" + applicationDirPath + "/image/killers/fire_mag_2.jpg";
                    if(global_settings.get_building("fire_mag_3") === false)
                    {
                        stolb_3_3.source = "file:///" + applicationDirPath + "/image/killers/fire_mag_3_black.jpg";
                        stolb_3_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_3_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_3_3.source = "file:///" + applicationDirPath + "/image/killers/fire_mag_3.jpg";
                        if(global_settings.get_building("fire_mag_4") === false)
                        {
                            stolb_3_4.source = "file:///" + applicationDirPath + "/image/killers/fire_mag_4_black.jpg";
                            stolb_3_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_3_4.source = "file:///" + applicationDirPath + "/image/killers/fire_mag_4.jpg";
                            if(global_settings.get_building("fire_mag_5") === false)
                                stolb_3_5.source = "file:///" + applicationDirPath + "/image/killers/fire_mag_5_black.jpg";
                            else
                                stolb_3_5.source = "file:///" + applicationDirPath + "/image/killers/fire_mag_5.jpg";
                        }
                    }
                }
            } //конец 3-го столбца

            if(global_settings.get_building("luchnik_1") === false)
            {
                stolb_4_1.source = "file:///" + applicationDirPath + "/image/killers/luchnik_1_black.jpg";
                stolb_4_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_4_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_4_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_4_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                stolb_4_1.source = "file:///" + applicationDirPath + "/image/killers/luchnik_1.jpg";
                if(global_settings.get_building("luchnik_2") === false)
                {
                    stolb_4_2.source = "file:///" + applicationDirPath + "/image/killers/luchnik_2_black.jpg";
                    stolb_4_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_4_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_4_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_4_2.source = "file:///" + applicationDirPath + "/image/killers/luchnik_2.jpg";
                    if(global_settings.get_building("luchnik_3") === false)
                    {
                        stolb_4_3.source = "file:///" + applicationDirPath + "/image/killers/luchnik_3_black.jpg";
                        stolb_4_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_4_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_4_3.source = "file:///" + applicationDirPath + "/image/killers/luchnik_3.jpg";
                        if(global_settings.get_building("luchnik_4") === false)
                        {
                            stolb_4_4.source = "file:///" + applicationDirPath + "/image/killers/luchnik_4_black.jpg";
                            stolb_4_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_4_4.source = "file:///" + applicationDirPath + "/image/killers/luchnik_4.jpg";
                            if(global_settings.get_building("luchnik_5") === false)
                                stolb_4_5.source = "file:///" + applicationDirPath + "/image/killers/luchnik_5_black.jpg";
                            else
                                stolb_4_5.source = "file:///" + applicationDirPath + "/image/killers/luchnik_5.jpg";
                        }
                    }
                }
            } //конец 4-го столбца

            if(global_settings.get_building("molniy_mag_1") === false)
            {
                stolb_5_1.source = "file:///" + applicationDirPath + "/image/killers/molniy_mag_1_black.jpg";
                stolb_5_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_5_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_5_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_5_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                stolb_5_1.source = "file:///" + applicationDirPath + "/image/killers/molniy_mag_1.jpg";
                if(global_settings.get_building("molniy_mag_2") === false)
                {
                    stolb_5_2.source = "file:///" + applicationDirPath + "/image/killers/molniy_mag_2_black.jpg";
                    stolb_5_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_5_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_5_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_5_2.source = "file:///" + applicationDirPath + "/image/killers/molniy_mag_2.jpg";
                    if(global_settings.get_building("molniy_mag_3") === false)
                    {
                        stolb_5_3.source = "file:///" + applicationDirPath + "/image/killers/molniy_mag_3_black.jpg";
                        stolb_5_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_5_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_5_3.source = "file:///" + applicationDirPath + "/image/killers/molniy_mag_3.jpg";
                        if(global_settings.get_building("molniy_mag_4") === false)
                        {
                            stolb_5_4.source = "file:///" + applicationDirPath + "/image/killers/molniy_mag_4_black.jpg";
                            stolb_5_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_5_4.source = "file:///" + applicationDirPath + "/image/killers/molniy_mag_4.jpg";
                            if(global_settings.get_building("molniy_mag_5") === false)
                                stolb_5_5.source = "file:///" + applicationDirPath + "/image/killers/molniy_mag_5_black.jpg";
                            else
                                stolb_5_5.source = "file:///" + applicationDirPath + "/image/killers/molniy_mag_5.jpg";
                        }
                    }
                }
            } //конец 5-го столбца
        }
        else if(number === 4)
        {
            fon.source = "file:///" + applicationDirPath + "/image/heal/heal_fon.jpg";

            if(global_settings.get_building("heal_1_1") === false)
            {
                stolb_1_1.source = "file:///" + applicationDirPath + "/image/heal/heal_1_1_black.jpg";
                stolb_1_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_1_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_1_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_1_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                stolb_1_1.source = "file:///" + applicationDirPath + "/image/heal/heal_1_1.jpg";
                if(global_settings.get_building("heal_2_1") === false)
                {
                    stolb_1_2.source = "file:///" + applicationDirPath + "/image/heal/heal_2_1_black.jpg";
                    stolb_1_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_1_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_1_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_1_2.source = "file:///" + applicationDirPath + "/image/heal/heal_2_1.jpg";
                    if(global_settings.get_building("heal_3_1") === false)
                    {
                        stolb_1_3.source = "file:///" + applicationDirPath + "/image/heal/heal_3_1_black.jpg";
                        stolb_1_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_1_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_1_3.source = "file:///" + applicationDirPath + "/image/heal/heal_3_1.jpg";
                        if(global_settings.get_building("heal_4_1") === false)
                        {
                            stolb_1_4.source = "file:///" + applicationDirPath + "/image/heal/heal_4_1_black.jpg";
                            stolb_1_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_1_4.source = "file:///" + applicationDirPath + "/image/heal/heal_4_1.jpg";
                            if(global_settings.get_building("heal_5_1") === false)
                                stolb_1_5.source = "file:///" + applicationDirPath + "/image/heal/heal_5_1_black.jpg";
                            else
                                stolb_1_5.source = "file:///" + applicationDirPath + "/image/heal/heal_5_1.jpg";
                        }
                    }
                }
            } //конец первого столбца

            if(global_settings.get_building("heal_1_6") === false)
            {
                stolb_2_1.source = "file:///" + applicationDirPath + "/image/heal/heal_1_6_black.jpg";
                stolb_2_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_2_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_2_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_2_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                stolb_2_1.source = "file:///" + applicationDirPath + "/image/heal/heal_1_6.jpg";
                if(global_settings.get_building("heal_2_6") === false)
                {
                    stolb_2_2.source = "file:///" + applicationDirPath + "/image/heal/heal_2_6_black.jpg";
                    stolb_2_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_2_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_2_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_2_2.source = "file:///" + applicationDirPath + "/image/heal/heal_2_6.jpg";
                    if(global_settings.get_building("heal_3_6") === false)
                    {
                        stolb_2_3.source = "file:///" + applicationDirPath + "/image/heal/heal_3_6_black.jpg";
                        stolb_2_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_2_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_2_3.source = "file:///" + applicationDirPath + "/image/heal/heal_3_6.jpg";
                        if(global_settings.get_building("heal_4_6") === false)
                        {
                            stolb_2_4.source = "file:///" + applicationDirPath + "/image/heal/heal_4_6_black.jpg";
                            stolb_2_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_2_4.source = "file:///" + applicationDirPath + "/image/heal/heal_4_6.jpg";
                            if(global_settings.get_building("heal_5_6") === false)
                                stolb_2_5.source = "file:///" + applicationDirPath + "/image/heal/heal_5_6_black.jpg";
                            else
                                stolb_2_5.source = "file:///" + applicationDirPath + "/image/heal/heal_5_6.jpg";
                        }
                    }
                }
            } //конец 2-го столбца

            if(global_settings.get_building("paralish_1") === false)
            {
                stolb_3_1.source = "file:///" + applicationDirPath + "/image/heal/paralish_1_black.jpg";
                stolb_3_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_3_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_3_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_3_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                stolb_3_1.source = "file:///" + applicationDirPath + "/image/heal/paralish_1.jpg";
                if(global_settings.get_building("paralish_2") === false)
                {
                    stolb_3_2.source = "file:///" + applicationDirPath + "/image/heal/paralish_2_black.jpg";
                    stolb_3_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_3_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_3_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_3_2.source = "file:///" + applicationDirPath + "/image/heal/paralish_2.jpg";
                    if(global_settings.get_building("paralish_3") === false)
                    {
                        stolb_3_3.source = "file:///" + applicationDirPath + "/image/heal/paralish_3_black.jpg";
                        stolb_3_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_3_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_3_3.source = "file:///" + applicationDirPath + "/image/heal/paralish_3.jpg";
                        if(global_settings.get_building("paralish_4") === false)
                        {
                            stolb_3_4.source = "file:///" + applicationDirPath + "/image/heal/paralish_4_black.jpg";
                            stolb_3_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_3_4.source = "file:///" + applicationDirPath + "/image/heal/paralish_4.jpg";
                            if(global_settings.get_building("paralish_5") === false)
                                stolb_3_5.source = "file:///" + applicationDirPath + "/image/heal/paralish_5_black.jpg";
                            else
                                stolb_3_5.source = "file:///" + applicationDirPath + "/image/heal/paralish_5.jpg";
                        }
                    }
                }
            } //конец 3-го столбца

            if(global_settings.get_building("proklynaet_1") === false)
            {
                stolb_4_1.source = "file:///" + applicationDirPath + "/image/heal/proklynaet_1_black.jpg";
                stolb_4_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_4_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_4_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_4_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                stolb_4_1.source = "file:///" + applicationDirPath + "/image/heal/proklynaet_1.jpg";
                if(global_settings.get_building("proklynaet_2") === false)
                {
                    stolb_4_2.source = "file:///" + applicationDirPath + "/image/heal/proklynaet_2_black.jpg";
                    stolb_4_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_4_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_4_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_4_2.source = "file:///" + applicationDirPath + "/image/heal/proklynaet_2.jpg";
                    if(global_settings.get_building("proklynaet_3") === false)
                    {
                        stolb_4_3.source = "file:///" + applicationDirPath + "/image/heal/proklynaet_3_black.jpg";
                        stolb_4_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_4_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_4_3.source = "file:///" + applicationDirPath + "/image/heal/proklynaet_3.jpg";
                        if(global_settings.get_building("proklynaet_4") === false)
                        {
                            stolb_4_4.source = "file:///" + applicationDirPath + "/image/heal/proklynaet_4_black.jpg";
                            stolb_4_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_4_4.source = "file:///" + applicationDirPath +"/image/heal/proklynaet_4.jpg";
                            if(global_settings.get_building("proklynaet_5") === false)
                                stolb_4_5.source = "file:///" + applicationDirPath + "/image/heal/proklynaet_5_black.jpg";
                            else
                                stolb_4_5.source = "file:///" + applicationDirPath + "/image/heal/proklynaet_5.jpg";
                        }
                    }
                }
            } //конец 4-го столбца

            if(global_settings.get_building("simbiot_1") === false)
            {
                stolb_5_1.source = "file:///" + applicationDirPath + "/image/heal/simbiot_1_black.jpg";
                stolb_5_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_5_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_5_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_5_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                stolb_5_1.source = "file:///" + applicationDirPath + "/image/heal/simbiot_1.jpg";
                if(global_settings.get_building("molniy_mag_2") === false)
                {
                    stolb_5_2.source = "file:///" + applicationDirPath + "/image/heal/simbiot_2_black.jpg";
                    stolb_5_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_5_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_5_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_5_2.source = "file:///" + applicationDirPath + "/image/heal/simbiot_2.jpg";
                    if(global_settings.get_building("molniy_mag_3") === false)
                    {
                        stolb_5_3.source = "file:///" + applicationDirPath + "/image/heal/simbiot_3_black.jpg";
                        stolb_5_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_5_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_5_3.source = "file:///" + applicationDirPath + "/image/heal/simbiot_3.jpg";
                        if(global_settings.get_building("molniy_mag_4") === false)
                        {
                            stolb_5_4.source = "file:///" + applicationDirPath + "/image/heal/simbiot_4_black.jpg";
                            stolb_5_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_5_4.source = "file:///" + applicationDirPath + "/image/heal/simbiot_4.jpg";
                            if(global_settings.get_building("molniy_mag_5") === false)
                                stolb_5_5.source = "file:///" + applicationDirPath + "/image/heal/simbiot_5_black.jpg";
                            else
                                stolb_5_5.source = "file:///" + applicationDirPath + "/image/heal/simbiot_5.jpg";
                        }
                    }
                }
            } //конец 5-го столбца
        }
        else if(number === 5)
        {
            fon.source = "file:///" + applicationDirPath + "/image/other_team/fon_other_team.jpg"

            if(global_settings.get_building("angel_1") === false)
            {
                stolb_1_1.source = "file:///" + applicationDirPath + "/image/other_team/angel_1_black.jpg";
                stolb_1_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_1_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_1_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_1_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                stolb_1_1.source = "file:///" + applicationDirPath + "/image/other_team/angel_1.jpg";
                if(global_settings.get_building("angel_2") === false)
                {
                    stolb_1_2.source = "file:///" + applicationDirPath + "/image/other_team/angel_2_black.jpg";
                    stolb_1_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_1_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_1_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_1_2.source = "file:///" + applicationDirPath + "/image/other_team/angel_2.jpg";
                    if(global_settings.get_building("angel_3") === false)
                    {
                        stolb_1_3.source = "file:///" + applicationDirPath + "/image/other_team/angel_3_black.jpg";
                        stolb_1_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_1_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_1_3.source = "file:///" + applicationDirPath + "/image/other_team/angel_3.jpg";
                        if(global_settings.get_building("angel_4") === false)
                        {
                            stolb_1_4.source = "file:///" + applicationDirPath + "/image/other_team/angel_4_black.jpg";
                            stolb_1_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_1_4.source = "file:///" + applicationDirPath + "/image/other_team/angel_4.jpg";
                            if(global_settings.get_building("angel_5") === false)
                                stolb_1_5.source = "file:///" + applicationDirPath + "/image/other_team/angel_5_black.jpg";
                            else
                                stolb_1_5.source = "file:///" + applicationDirPath + "image/other_team/angel_5.jpg";
                        }
                    }
                }
            } //конец первого столбца

            if(global_settings.get_building("elemental_cold_1") === false)
            {
                stolb_2_1.source = "file:///" + applicationDirPath + "/image/other_team/elemental_cold_1_black.jpg";
                stolb_2_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_2_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_2_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_2_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                stolb_2_1.source = "file:///" + applicationDirPath + "/image/other_team/elemental_cold_1.jpg";
                if(global_settings.get_building("elemental_cold_2") === false)
                {
                    stolb_2_2.source = "file:///" + applicationDirPath + "/image/other_team/elemental_cold_2_black.jpg";
                    stolb_2_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_2_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_2_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_2_2.source = "file:///" + applicationDirPath + "/image/other_team/elemental_cold_2.jpg";
                    if(global_settings.get_building("elemental_cold_3") === false)
                    {
                        stolb_2_3.source = "file:///" + applicationDirPath + "/image/other_team/elemental_cold_3_black.jpg";
                        stolb_2_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_2_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_2_3.source = "file:///" + applicationDirPath + "/image/other_team/elemental_cold_3.jpg";
                        if(global_settings.get_building("elemental_cold_4") === false)
                        {
                            stolb_2_4.source = "file:///" + applicationDirPath + "/image/other_team/elemental_cold_4_black.jpg";
                            stolb_2_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_2_4.source = "file:///" + applicationDirPath + "/image/other_team/elemental_cold_4.jpg";
                            if(global_settings.get_building("elemental_cold_5") === false)
                                stolb_2_5.source = "file:///" + applicationDirPath + "/image/other_team/elemental_cold_5_black.jpg";
                            else
                                stolb_2_5.source = "file:///" + applicationDirPath + "/image/other_team/elemental_cold_5.jpg";
                        }
                    }
                }
            } //конец 2-го столбца

            if(global_settings.get_building("golem_1") === false)
            {
                stolb_3_1.source = "file:///" + applicationDirPath + "/image/other_team/golem_1_black.jpg";
                stolb_3_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_3_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_3_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_3_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                stolb_3_1.source = "file:///" + applicationDirPath + "/image/other_team/golem_1.jpg";
                if(global_settings.get_building("golem_2") === false)
                {
                    stolb_3_2.source = "file:///" + applicationDirPath + "/image/other_team/golem_2_black.jpg";
                    stolb_3_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_3_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_3_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_3_2.source = "file:///" + applicationDirPath + "/image/other_team/golem_2.jpg";
                    if(global_settings.get_building("golem_3") === false)
                    {
                        stolb_3_3.source = "file:///" + applicationDirPath + "/image/other_team/golem_3_black.jpg";
                        stolb_3_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_3_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_3_3.source = "file:///" + applicationDirPath + "/image/other_team/golem_3.jpg";
                        if(global_settings.get_building("golem_4") === false)
                        {
                            stolb_3_4.source = "file:///" + applicationDirPath + "/image/other_team/golem_4_black.jpg";
                            stolb_3_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_3_4.source = "file:///" + applicationDirPath + "/image/other_team/golem_4.jpg";
                            if(global_settings.get_building("golem_5") === false)
                                stolb_3_5.source = "file:///" + applicationDirPath + "/image/other_team/golem_5_black.jpg";
                            else
                                stolb_3_5.source = "file:///" + applicationDirPath + "/image/other_team/golem_5.jpg";
                        }
                    }
                }
            } //конец 3-го столбца

            if(global_settings.get_building("vampir_1") === false)
            {
                stolb_4_1.source = "file:///" + applicationDirPath + "/image/other_team/vampir_1_black.jpg";
                stolb_4_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_4_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_4_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_4_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                stolb_4_1.source = "file:///" + applicationDirPath + "/image/other_team/vampir_1.jpg";
                if(global_settings.get_building("vampir_2") === false)
                {
                    stolb_4_2.source = "file:///" + applicationDirPath + "/image/other_team/vampir_2_black.jpg";
                    stolb_4_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_4_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_4_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_4_2.source = "file:///" + applicationDirPath + "/image/other_team/vampir_2.jpg";
                    if(global_settings.get_building("vampir_3") === false)
                    {
                        stolb_4_3.source = "file:///" + applicationDirPath + "/image/other_team/vampir_3_black.jpg";
                        stolb_4_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_4_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_4_3.source = "file:///" + applicationDirPath + "/image/other_team/vampir_3.jpg";
                        if(global_settings.get_building("vampir_4") === false)
                        {
                            stolb_4_4.source = "file:///" + applicationDirPath + "/image/other_team/vampir_4_black.jpg";
                            stolb_4_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_4_4.source = "file:///" + applicationDirPath + "/image/other_team/vampir_4.jpg";
                            if(global_settings.get_building("vampir_5") === false)
                                stolb_4_5.source = "file:///" + applicationDirPath + "/image/other_team/vampir_5_black.jpg";
                            else
                                stolb_4_5.source = "file:///" + applicationDirPath + "/image/other_team/vampir_5.jpg";
                        }
                    }
                }
            } //конец 4-го столбца

            if(global_settings.get_building("elemental_elektrisiti_1") === false)
            {
                stolb_5_1.source = "file:///" + applicationDirPath + "/image/other_team/elemental_elektrisiti_1_black.jpg";
                stolb_5_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_5_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_5_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                stolb_5_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                stolb_5_1.source = "file:///" + applicationDirPath + "/image/other_team/elemental_elektrisiti_1.jpg";
                if(global_settings.get_building("elemental_elektrisiti_2") === false)
                {
                    stolb_5_2.source = "file:///" + applicationDirPath + "/image/other_team/elemental_elektrisiti_2_black.jpg";
                    stolb_5_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_5_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    stolb_5_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    stolb_5_2.source = "file:///" + applicationDirPath + "/image/other_team/elemental_elektrisiti_2.jpg";
                    if(global_settings.get_building("elemental_elektrisiti_3") === false)
                    {
                        stolb_5_3.source = "file:///" + applicationDirPath + "/image/other_team/elemental_elektrisiti_3_black.jpg";
                        stolb_5_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        stolb_5_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        stolb_5_3.source = "file:///" + applicationDirPath + "/image/other_team/elemental_elektrisiti_3.jpg";
                        if(global_settings.get_building("elemental_elektrisiti_4") === false)
                        {
                            stolb_5_4.source = "file:///" + applicationDirPath + "/image/other_team/elemental_elektrisiti_4_black.jpg";
                            stolb_5_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            stolb_5_4.source = "file:///" + applicationDirPath + "/image/other_team/elemental_elektrisiti_4.jpg";
                            if(global_settings.get_building("elemental_elektrisiti_5") === false)
                                stolb_5_5.source = "file:///" + applicationDirPath + "/image/other_team/elemental_elektrisiti_5_black.jpg";
                            else
                                stolb_5_5.source = "file:///" + applicationDirPath + "/image/other_team/elemental_elektrisiti_5.jpg";
                        }
                    }
                }
            } //конец 5-го столбца
        }
    }

    Image
    {
        id: fon
        width: parent.width
        height: parent.height

        Image
        {
            id: stolb_3_1
            width: stolb_3_1.height
            height: fon.height * 0.12
            anchors.horizontalCenter: fon.horizontalCenter
            anchors.top: fon.top
            anchors.topMargin: fon.height * 0.02
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_3_2
            width: strelka_stolb_3_2.height
            height: fon.height * 0.07
            anchors.horizontalCenter: fon.horizontalCenter
            anchors.top: stolb_3_1.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_3_2
            width: stolb_3_2.height
            height: fon.height * 0.12
            anchors.horizontalCenter: fon.horizontalCenter
            anchors.top: strelka_stolb_3_2.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_3_3
            width: strelka_stolb_3_3.height
            height: fon.height * 0.07
            anchors.horizontalCenter: fon.horizontalCenter
            anchors.top: stolb_3_2.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_3_3
            width: stolb_3_3.height
            height: fon.height * 0.12
            anchors.horizontalCenter: fon.horizontalCenter
            anchors.top: strelka_stolb_3_3.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_3_4
            width: strelka_stolb_3_4.height
            height: fon.height * 0.07
            anchors.horizontalCenter: fon.horizontalCenter
            anchors.top: stolb_3_3.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_3_4
            width: stolb_3_4.height
            height: fon.height * 0.12
            anchors.horizontalCenter: fon.horizontalCenter
            anchors.top: strelka_stolb_3_4.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_3_5
            width: strelka_stolb_3_5.height
            height: fon.height * 0.07
            anchors.horizontalCenter: fon.horizontalCenter
            anchors.top: stolb_3_4.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_3_5
            width: stolb_3_5.height
            height: fon.height * 0.12
            anchors.horizontalCenter: fon.horizontalCenter
            anchors.top: strelka_stolb_3_5.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
            asynchronous: true
        }

        Image
        {
            id: stolb_2_1
            width: stolb_2_1.height
            height: fon.height * 0.12
            anchors.top: fon.top
            anchors.topMargin: fon.height * 0.02
            anchors.right: stolb_3_1.left
            anchors.rightMargin: fon.height * 0.15
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_2_2
            width: strelka_stolb_2_2.height
            height: fon.height * 0.07
            anchors.horizontalCenter: stolb_2_1.horizontalCenter
            anchors.top: stolb_2_1.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_2_2
            width: stolb_2_2.height
            height: fon.height * 0.12
            anchors.top: strelka_stolb_2_2.bottom
            anchors.topMargin: fon.height * 0.005
            anchors.horizontalCenter: stolb_2_1.horizontalCenter
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_2_3
            width: strelka_stolb_2_3.height
            height: fon.height * 0.07
            anchors.horizontalCenter: stolb_2_1.horizontalCenter
            anchors.top: stolb_2_2.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_2_3
            width: stolb_2_3.height
            height: fon.height * 0.12
            anchors.top: strelka_stolb_2_3.bottom
            anchors.topMargin: fon.height * 0.005
            anchors.horizontalCenter: stolb_2_1.horizontalCenter
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_2_4
            width: strelka_stolb_2_4.height
            height: fon.height * 0.07
            anchors.horizontalCenter: stolb_2_1.horizontalCenter
            anchors.top: stolb_2_3.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_2_4
            width: stolb_2_4.height
            height: fon.height * 0.12
            anchors.top: strelka_stolb_2_4.bottom
            anchors.topMargin: fon.height * 0.005
            anchors.horizontalCenter: stolb_2_1.horizontalCenter
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_2_5
            width: strelka_stolb_2_5.height
            height: fon.height * 0.07
            anchors.horizontalCenter: stolb_2_1.horizontalCenter
            anchors.top: stolb_2_4.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_2_5
            width: stolb_2_5.height
            height: fon.height * 0.12
            anchors.top: strelka_stolb_2_5.bottom
            anchors.topMargin: fon.height * 0.005
            anchors.horizontalCenter: stolb_2_1.horizontalCenter
            visible: false
            asynchronous: true
        }

        Image
        {
            id: stolb_1_1
            width: stolb_1_1.height
            height: fon.height * 0.12
            anchors.top: fon.top
            anchors.topMargin: fon.height * 0.02
            anchors.right: stolb_2_1.left
            anchors.rightMargin: fon.height * 0.15
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_1_2
            width: strelka_stolb_1_2.height
            height: fon.height * 0.07
            anchors.horizontalCenter: stolb_1_1.horizontalCenter
            anchors.top: stolb_1_1.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_1_2
            width: stolb_1_2.height
            height: fon.height * 0.12
            anchors.horizontalCenter: stolb_1_1.horizontalCenter
            anchors.top: strelka_stolb_1_2.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_1_3
            width: strelka_stolb_1_3.height
            height: fon.height * 0.07
            anchors.horizontalCenter: stolb_1_1.horizontalCenter
            anchors.top: stolb_1_2.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_1_3
            width: stolb_1_3.height
            height: fon.height * 0.12
            anchors.horizontalCenter: stolb_1_1.horizontalCenter
            anchors.top: strelka_stolb_1_3.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_1_4
            width: strelka_stolb_1_4.height
            height: fon.height * 0.07
            anchors.horizontalCenter: stolb_1_1.horizontalCenter
            anchors.top: stolb_1_3.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_1_4
            width: stolb_1_4.height
            height: fon.height * 0.12
            anchors.horizontalCenter: stolb_1_1.horizontalCenter
            anchors.top: strelka_stolb_1_4.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_1_5
            width: strelka_stolb_1_5.height
            height: fon.height * 0.07
            anchors.horizontalCenter: stolb_1_1.horizontalCenter
            anchors.top: stolb_1_4.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_1_5
            width: stolb_1_5.height
            height: fon.height * 0.12
            anchors.horizontalCenter: stolb_1_1.horizontalCenter
            anchors.top: strelka_stolb_1_5.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
            asynchronous: true
        }

        Image
        {
            id: stolb_4_1
            width: stolb_4_1.height
            height: fon.height * 0.12
            anchors.top: fon.top
            anchors.topMargin: fon.height * 0.02
            anchors.left: stolb_3_1.right
            anchors.leftMargin: fon.height * 0.15
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_4_2
            width: strelka_stolb_4_2.height
            height: fon.height * 0.07
            anchors.horizontalCenter: stolb_4_1.horizontalCenter
            anchors.top: stolb_4_1.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_4_2
            width: stolb_4_2.height
            height: fon.height * 0.12
            anchors.horizontalCenter: stolb_4_1.horizontalCenter
            anchors.top: strelka_stolb_4_2.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_4_3
            width: strelka_stolb_4_3.height
            height: fon.height * 0.07
            anchors.horizontalCenter: stolb_4_1.horizontalCenter
            anchors.top: stolb_4_2.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_4_3
            width: stolb_4_3.height
            height: fon.height * 0.12
            anchors.horizontalCenter: stolb_4_1.horizontalCenter
            anchors.top: strelka_stolb_4_3.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_4_4
            width: strelka_stolb_4_4.height
            height: fon.height * 0.07
            anchors.horizontalCenter: stolb_4_1.horizontalCenter
            anchors.top: stolb_4_3.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_4_4
            width: stolb_4_4.height
            height: fon.height * 0.12
            anchors.horizontalCenter: stolb_4_1.horizontalCenter
            anchors.top: strelka_stolb_4_4.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_4_5
            width: strelka_stolb_4_5.height
            height: fon.height * 0.07
            anchors.horizontalCenter: stolb_4_1.horizontalCenter
            anchors.top: stolb_4_4.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_4_5
            width: stolb_4_5.height
            height: fon.height * 0.12
            anchors.horizontalCenter: stolb_4_1.horizontalCenter
            anchors.top: strelka_stolb_4_5.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
            asynchronous: true
        }

        Image
        {
            id: stolb_5_1
            width: stolb_5_1.height
            height: fon.height * 0.12
            anchors.top: fon.top
            anchors.topMargin: fon.height * 0.02
            anchors.left: stolb_4_1.right
            anchors.leftMargin: fon.height * 0.15
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_5_2
            width: strelka_stolb_5_2.height
            height: fon.height * 0.07
            anchors.horizontalCenter: stolb_5_1.horizontalCenter
            anchors.top: stolb_5_1.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_5_2
            width: stolb_5_2.height
            height: fon.height * 0.12
            anchors.horizontalCenter: stolb_5_1.horizontalCenter
            anchors.top: strelka_stolb_5_2.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_5_3
            width: strelka_stolb_5_3.height
            height: fon.height * 0.07
            anchors.horizontalCenter: stolb_5_1.horizontalCenter
            anchors.top: stolb_5_2.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_5_3
            width: stolb_5_3.height
            height: fon.height * 0.12
            anchors.horizontalCenter: stolb_5_1.horizontalCenter
            anchors.top: strelka_stolb_5_3.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_5_4
            width: strelka_stolb_5_4.height
            height: fon.height * 0.07
            anchors.horizontalCenter: stolb_5_1.horizontalCenter
            anchors.top: stolb_5_3.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_5_4
            width: stolb_5_4.height
            height: fon.height * 0.12
            anchors.horizontalCenter: stolb_5_1.horizontalCenter
            anchors.top: strelka_stolb_5_4.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
            asynchronous: true
        }

        Image
        {
            id: strelka_stolb_5_5
            width: strelka_stolb_5_5.height
            height: fon.height * 0.07
            anchors.horizontalCenter: stolb_5_1.horizontalCenter
            anchors.top: stolb_5_4.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
            asynchronous: true
        }

        Image
        {
            id: stolb_5_5
            width: stolb_5_5.height
            height: fon.height * 0.12
            anchors.horizontalCenter: stolb_5_1.horizontalCenter
            anchors.top: strelka_stolb_5_5.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
            asynchronous: true
        }


        Image
        {
            id: ramka
            width: ramka.height
            height: fon.height * 0.12
            anchors.horizontalCenter: fon.horizontalCenter
            anchors.top:fon.top
            anchors.topMargin: fon.height * 0.02
            source: "file:///" + applicationDirPath + "/image/building/ramka_black.png"
            visible: false
            asynchronous: true
        }

        Image
        {
            id: ramka_blue
            width: ramka_blue.height
            height: fon.height * 0.12
            anchors.horizontalCenter: fon.horizontalCenter
            anchors.top:fon.top
            anchors.topMargin: fon.height * 0.02
            source: "file:///" + applicationDirPath + "/image/building/ramka_blue.png"
            visible: false
            asynchronous: true
        }

        Blend
        {
            id: stolb_3_1_ramka
            anchors.fill: stolb_3_1
            source: stolb_3_1
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_3_1_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_3_1_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(page === 2)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_3_1.source;
                        menu_main_text.text = "Позволяет нанять одного Ледяного человека в вашу армию.(Стоит: 200-золота и 2-руда.)\n Характеристики ледяного человека:";
                        button_visible("boez_cold_1");

                        parsing_string((applicationDirPath + "/XML/xml_cold.xml"),"cold",0);
                    }
                    else if(page === 3)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_3_1.source;
                        menu_main_text.text = "Позволяет нанять одного Мага огня в вашу армию.(Стоит: 200-золота и 2-руда.)\n Характеристики Мага огня:";
                        button_visible("fire_mag_1");

                        parsing_string((applicationDirPath + "/XML/xml_fire_mag.xml"),"fier_mag",0);
                    }
                    else if(page === 4)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_3_1.source;
                        menu_main_text.text = "Позволяет нанять одного Призрака в вашу армию.(Стоит: 200-золота и 2-руда.)\n Характеристики Призрака:";
                        button_visible("paralish_1");

                        parsing_string((applicationDirPath + "/XML/xml_paralish.xml"),"paralish",0);
                    }
                    else if(page === 5)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_3_1.source;
                        menu_main_text.text = "Позволяет нанять одного Голема в вашу армию.(Стоит: 200-золота и 2-руда.)\n Характеристики Голема:";
                        button_visible("golem_1");

                        parsing_string((applicationDirPath + "/XML/xml_golem.xml"),"golem",0);
                    }
                }
            }
        }

        Blend
        {
            id: stolb_3_2_ramka
            anchors.fill: stolb_3_2
            source: stolb_3_2
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_3_2_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_3_2_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(page === 2)
                    {
                        if(global_settings.get_building("boez_cold_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_3_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n Характеристики ледяного человека:";
                        button_visible("boez_cold_2");

                        parsing_string((applicationDirPath + "/XML/xml_cold.xml"),"cold",1);
                    }
                    else if(page === 3)
                    {
                        if(global_settings.get_building("fire_mag_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_3_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Мага огня:";
                        button_visible("fire_mag_2");

                        parsing_string((applicationDirPath + "/XML/xml_fire_mag.xml"),"fier_mag",1);
                    }
                    else if(page === 4)
                    {
                        if(global_settings.get_building("paralish_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_3_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Призрака:";
                        button_visible("paralish_2");

                        parsing_string((applicationDirPath + "/XML/xml_paralish.xml"),"paralish",1);
                    }
                    else if(page === 5)
                    {
                        if(global_settings.get_building("golem_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_3_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Голема:";
                        button_visible("golem_2");

                        parsing_string((applicationDirPath + "/XML/xml_golem.xml"),"golem",1);
                    }
                }
            }
        }

        Blend
        {
            id: stolb_3_3_ramka
            anchors.fill: stolb_3_3
            source: stolb_3_3
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_3_3_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_3_3_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    //menu_buy.visible = true;
                }
            }
        }

        Blend
        {
            id: stolb_3_4_ramka
            anchors.fill: stolb_3_4
            source: stolb_3_4
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_3_4_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_3_4_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    //menu_buy.visible = true;
                }
            }
        }

        Blend
        {
            id: stolb_3_5_ramka
            anchors.fill: stolb_3_5
            source: stolb_3_5
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_3_5_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_3_5_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    //menu_buy.visible = true;
                }
            }
        }

        Blend
        {
            id: stolb_2_1_ramka
            anchors.fill: stolb_2_1
            source: stolb_2_1
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_2_1_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_2_1_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(page === 2)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_2_1.source;
                        menu_main_text.text = "Позволяет нанять одного Огра в вашу армию.(Стоит: 200-золота и 2-руда.)\n характеристики Огра:";
                        button_visible("ogr_1");

                        parsing_string((applicationDirPath + "/XML/xml_ogr.xml"),"ogr",0);
                    }
                    else if(page === 3)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_2_1.source;
                        menu_main_text.text = "Позволяет нанять одного Мага тьмы в вашу армию.(Стоит: 200-золота и 2-руда.)\n характеристики Мага тьмы:";
                        button_visible("dark_mag_1");

                        parsing_string((applicationDirPath + "/XML/xml_dark_mag.xml"),"dark_mag",0);
                    }
                    else if(page === 4)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_2_1.source;
                        menu_main_text.text = "Позволяет нанять одного Целителя в вашу армию.(Стоит: 200-золота и 2-руда.)\n характеристики Целителя:";
                        button_visible("heal_1_6");

                        parsing_string((applicationDirPath + "/XML/xml_shelitel.xml"),"shelitel",0);
                    }
                    else if(page === 5)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_2_1.source;
                        menu_main_text.text = "Позволяет нанять одного Элементаля холода в вашу армию.(Стоит: 200-золота и 2-руда.)\n характеристики Элементаля холода:";
                        button_visible("elemental_cold_1");

                        parsing_string((applicationDirPath + "/XML/xml_elemental_cold.xml"),"elemental_cold",0);
                    }
                }
            }
        }

        Blend
        {
            id: stolb_2_2_ramka
            anchors.fill: stolb_2_2
            source: stolb_2_2
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_2_2_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_2_2_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(page === 2)
                    {
                        if(global_settings.get_building("ogr_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_2_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Огра:";
                        button_visible("ogr_2");

                        parsing_string((applicationDirPath + "/XML/xml_ogr.xml"),"ogr",1);
                    }
                    else if(page === 3)
                    {
                        if(global_settings.get_building("dark_mag_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_2_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Мага тьмы:";
                        button_visible("dark_mag_2");

                        parsing_string((applicationDirPath + "/XML/xml_dark_mag.xml"),"dark_mag",1);
                    }
                    else if(page === 4)
                    {
                        if(global_settings.get_building("heal_1_6") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_2_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Целителя:";
                        button_visible("heal_2_6");

                        parsing_string((applicationDirPath + "/XML/xml_shelitel.xml"),"shelitel",1);
                    }
                    else if(page === 5)
                    {
                        if(global_settings.get_building("elemental_cold_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_2_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Элементаля холода:";
                        button_visible("elemental_cold_2");

                        parsing_string((applicationDirPath + "/XML/xml_elemental_cold.xml"),"elemental_cold",1);
                    }
                }
            }
        }

        Blend
        {
            id: stolb_2_3_ramka
            anchors.fill: stolb_2_3
            source: stolb_2_3
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_2_3_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_2_3_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    //menu_buy.visible = true;
                }
            }
        }

        Blend
        {
            id: stolb_2_4_ramka
            anchors.fill: stolb_2_4
            source: stolb_2_4
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_2_4_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_2_4_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    //menu_buy.visible = true;
                }
            }
        }

        Blend
        {
            id: stolb_2_5_ramka
            anchors.fill: stolb_2_5
            source: stolb_2_5
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_2_5_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_2_5_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    //menu_buy.visible = true;
                }
            }
        }

        Blend
        {
            id: stolb_1_1_ramka
            anchors.fill: stolb_1_1
            source: stolb_1_1
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_1_1_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_1_1_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(page === 2)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_1_1.source;
                        menu_main_text.text = "Позволяет нанять одного скелета в вашу армию.(Стоит: 200-золота и 2-руда.)\n характеристики скелета:";
                        button_visible("skelet_1");

                        parsing_string((applicationDirPath + "/XML/xml_skelet.xml"),"skelet",0);
                    }
                    else if(page === 3)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_1_1.source;
                        menu_main_text.text = "Позволяет нанять одного Арбалетчика в вашу армию.(Стоит: 200-золота и 2-руда.)\n характеристики Арбалетчика:";
                        button_visible("arbaletshik_1");

                        parsing_string((applicationDirPath + "/XML/xml_arbaletshik.xml"),"arbaletshik",0);
                    }
                    else if(page === 4)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_1_1.source;
                        menu_main_text.text = "Позволяет нанять одного Лекаря в вашу армию.(Стоит: 200-золота и 2-руда.)\n характеристики Лекаря:";
                        button_visible("heal_1_1");

                        parsing_string((applicationDirPath + "/XML/xml_lekar.xml"),"lekar",0);
                    }
                    else if(page === 5)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_1_1.source;
                        menu_main_text.text = "Позволяет нанять одного Темного ангела в вашу армию.(Стоит: 200-золота и 2-руда.)\n характеристики Темного ангела:";
                        button_visible("angel_1");

                        parsing_string((applicationDirPath + "/XML/xml_angel.xml"),"angel",0);
                    }
                }
            }
        }

        Blend
        {
            id: stolb_1_2_ramka
            anchors.fill: stolb_1_2
            source: stolb_1_2
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_1_2_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_1_2_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(page === 2)
                    {
                        if(global_settings.get_building("skelet_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_1_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики скелета:";
                        button_visible("skelet_2");

                        parsing_string((applicationDirPath + "/XML/xml_skelet.xml"),"skelet",1);
                    }
                    else if(page === 3)
                    {
                        if(global_settings.get_building("arbaletshik_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_1_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Арбалетчика:";
                        button_visible("arbaletshik_2");

                        parsing_string((applicationDirPath + "/XML/xml_arbaletshik.xml"),"arbaletshik",1);
                    }
                    else if(page === 4)
                    {
                        if(global_settings.get_building("heal_1_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_1_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Лекаря:";
                        button_visible("heal_2_1");

                        parsing_string((applicationDirPath + "/XML/xml_lekar.xml"),"lekar",1);
                    }
                    else if(page === 5)
                    {
                        if(global_settings.get_building("angel_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_1_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Темного ангела:";
                        button_visible("angel_2");

                        parsing_string((applicationDirPath + "/XML/xml_angel.xml"),"angel",1);
                    }
                }
            }
        }

        Blend
        {
            id: stolb_1_3_ramka
            anchors.fill: stolb_1_3
            source: stolb_1_3
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_1_3_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_1_3_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    //menu_buy.visible = true;
                }
            }
        }

        Blend
        {
            id: stolb_1_4_ramka
            anchors.fill: stolb_1_4
            source: stolb_1_4
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_1_4_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_1_4_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    //menu_buy.visible = true;
                }
            }
        }

        Blend
        {
            id: stolb_1_5_ramka
            anchors.fill: stolb_1_5
            source: stolb_1_5
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_1_5_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_1_5_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    //menu_buy.visible = true;
                }
            }
        }

        Blend
        {
            id: stolb_4_1_ramka
            anchors.fill: stolb_4_1
            source: stolb_4_1
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_4_1_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_4_1_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(page === 2)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_4_1.source;
                        menu_main_text.text = "Позволяет нанять одного Владыку в вашу армию.(Стоит: 200-золота и 2-руда.)\n характеристики Владыки:";
                        button_visible("boez_fier_1");

                        parsing_string((applicationDirPath + "/XML/xml_fier.xml"),"fier",0);
                    }
                    else if(page === 3)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_4_1.source;
                        menu_main_text.text = "Позволяет нанять одного Лучника в вашу армию.(Стоит: 200-золота и 2-руда.)\n характеристики Лучника:";
                        button_visible("luchnik_1");

                        parsing_string((applicationDirPath + "/XML/xml_luchnik.xml"),"luchnik",0);
                    }
                    else if(page === 4)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_4_1.source;
                        menu_main_text.text = "Позволяет нанять одного Шамана в вашу армию.(Стоит: 200-золота и 2-руда.)\n характеристики Шамана:";
                        button_visible("proklynaet_1");

                        parsing_string((applicationDirPath + "/XML/xml_proklynaet.xml"),"proklynaet",0);
                    }
                    else if(page === 5)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_4_1.source;
                        menu_main_text.text = "Позволяет нанять одного Вампира в вашу армию.(Стоит: 200-золота и 2-руда.)\n характеристики Вампира:";
                        button_visible("vampir_1");

                        parsing_string((applicationDirPath + "/XML/xml_vampir.xml"),"vampir",0);
                    }
                }
            }
        }

        Blend
        {
            id: stolb_4_2_ramka
            anchors.fill: stolb_4_2
            source: stolb_4_2
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_4_2_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_4_2_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(page === 2)
                    {
                        if(global_settings.get_building("boez_fier_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_4_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Владыки:";
                        button_visible("boez_fier_2");

                        parsing_string((applicationDirPath + "/XML/xml_fier.xml"),"fier",1);
                    }
                    else if(page === 3)
                    {
                        if(global_settings.get_building("luchnik_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_4_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Лучника:";
                        button_visible("luchnik_2");

                        parsing_string((applicationDirPath + "/XML/xml_luchnik.xml"),"luchnik",1);
                    }
                    else if(page === 4)
                    {
                        if(global_settings.get_building("proklynaet_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_4_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Шамана:";
                        button_visible("proklynaet_2");

                        parsing_string((applicationDirPath + "/XML/xml_proklynaet.xml"),"proklynaet",1);
                    }
                    else if(page === 5)
                    {
                        if(global_settings.get_building("vampir_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_4_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Вампира:";
                        button_visible("vampir_2");

                        parsing_string((applicationDirPath + "/XML/xml_vampir.xml"),"vampir",1);
                    }
                }
            }
        }

        Blend
        {
            id: stolb_4_3_ramka
            anchors.fill: stolb_4_3
            source: stolb_4_3
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_4_3_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_4_3_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    //menu_buy.visible = true;
                }
            }
        }

        Blend
        {
            id: stolb_4_4_ramka
            anchors.fill: stolb_4_4
            source: stolb_4_4
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_4_4_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_4_4_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    //menu_buy.visible = true;
                }
            }
        }

        Blend
        {
            id: stolb_4_5_ramka
            anchors.fill: stolb_4_5
            source: stolb_4_5
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_4_5_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_4_5_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    //menu_buy.visible = true;
                }
            }
        }

        Blend
        {
            id: stolb_5_1_ramka
            anchors.fill: stolb_5_1
            source: stolb_5_1
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_5_1_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_5_1_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(page === 2)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_5_1.source;
                        menu_main_text.text = "Позволяет нанять одного всадника смерти в вашу армию.(Стоит: 200-золота и 2-руда.)\n характеристики всадника смерти:";
                        button_visible("boez_vsadnik_1");

                        parsing_string((applicationDirPath + "/XML/xml_vsadnik.xml"),"vsadnik",0);
                    }
                    else if(page === 3)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_5_1.source;
                        menu_main_text.text = "Позволяет нанять одного Мага молний в вашу армию.(Стоит: 200-золота и 2-руда.)\n характеристики Мага молний:";
                        button_visible("molniy_mag_1");

                        parsing_string((applicationDirPath + "/XML/xml_molniy_mag.xml"),"molniy_mag",0);
                    }
                    else if(page === 4)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_5_1.source;
                        menu_main_text.text = "Позволяет нанять одного Симбиота в вашу армию.(Стоит: 200-золота и 2-руда.)\n характеристики Симбиота:";
                        button_visible("simbiot_1");

                        parsing_string((applicationDirPath + "/XML/xml_simbiot.xml"),"simbiot",0);
                    }
                    else if(page === 5)
                    {
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_5_1.source;
                        menu_main_text.text = "Позволяет нанять одного Элементаля молний в вашу армию.(Стоит: 200-золота и 2-руда.)\n характеристики Элементаля молний:";
                        button_visible("elemental_elektrisiti_1");

                        parsing_string((applicationDirPath + "/XML/xml_elemental_elektrisiti.xml"),"elemental_elektrisiti",0);
                    }
                }
            }
        }

        Blend
        {
            id: stolb_5_2_ramka
            anchors.fill: stolb_5_2
            source: stolb_5_2
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_5_2_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_5_2_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(page === 2)
                    {
                        if(global_settings.get_building("boez_vsadnik_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_5_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики всадника смерти:";
                        button_visible("boez_vsadnik_2");

                        parsing_string((applicationDirPath + "/XML/xml_vsadnik.xml"),"vsadnik",1);
                    }
                    else if(page === 3)
                    {
                        if(global_settings.get_building("molniy_mag_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_5_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Мага молний:";
                        button_visible("molniy_mag_2");

                        parsing_string((applicationDirPath + "/XML/xml_molniy_mag.xml"),"molniy_mag",1);
                    }
                    else if(page === 4)
                    {
                        if(global_settings.get_building("simbiot_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_5_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Симбиота:";
                        button_visible("simbiot_2");

                        parsing_string((applicationDirPath + "/XML/xml_simbiot.xml"),"simbiot",1);
                    }
                    else if(page === 5)
                    {
                        if(global_settings.get_building("elemental_elektrisiti_1") === false)
                            return;
                        menu_buy.visible = true;
                        menu_buy_image.source = stolb_5_2.source;
                        menu_main_text.text = "Эволюция при достижении 5 уровня.(Стоит: 200-золота и 2-руда.)\n характеристики Элементаля молний:";
                        button_visible("elemental_elektrisiti_2");

                        parsing_string((applicationDirPath + "/XML/xml_elemental_elektrisiti.xml"),"elemental_elektrisiti",1);
                    }
                }
            }
        }

        Blend
        {
            id: stolb_5_3_ramka
            anchors.fill: stolb_5_3
            source: stolb_5_3
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_5_3_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_5_3_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    //menu_buy.visible = true;
                }
            }
        }

        Blend
        {
            id: stolb_5_4_ramka
            anchors.fill: stolb_5_4
            source: stolb_5_4
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_5_4_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_5_4_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    //menu_buy.visible = true;
                }
            }
        }

        Blend
        {
            id: stolb_5_5_ramka
            anchors.fill: stolb_5_5
            source: stolb_5_5
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    stolb_5_5_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    stolb_5_5_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    //menu_buy.visible = true;
                }
            }
        }

        Rectangle
        {
            id:menu_buy
            width: parent.width * 0.8
            height: parent.height * 0.8
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            gradient: Gradient {
                GradientStop { position: 0.0; color: "grey" }
                GradientStop { position: 1.0; color: "black" }
            }
            border.width: 5
            border.color: "white"
            radius: parent.height / 10
            visible: false

            Image
            {
                id: menu_buy_image
                width: menu_buy_image.height
                height: parent.height * 0.12
                anchors.horizontalCenter: menu_buy.horizontalCenter
                anchors.top: menu_buy.top
                anchors.topMargin: menu_buy.height * 0.03
                source: "file:///" + applicationDirPath + "/image/building/razvedka_black.jpg"
            }

            Image
            {
                id: close
                width: close.height
                height: parent.height * 0.1
                anchors.top: menu_buy.top
                anchors.topMargin: menu_buy.height * 0.03
                anchors.right: menu_buy.right
                anchors.rightMargin: menu_buy.width * 0.03
                source: "file:///" + applicationDirPath + "/image/building/close.png"

                MouseArea
                {
                    anchors.fill: parent
                    hoverEnabled: true

                    onHoveredChanged:
                    {
                        close.height = menu_buy.height * 0.11;
                        close.anchors.topMargin = menu_buy.height * 0.0275
                        close.anchors.rightMargin = menu_buy.width * 0.0275
                    }
                    onExited:
                    {
                        close.height = menu_buy.height * 0.1;
                        close.anchors.topMargin = menu_buy.height * 0.03
                        close.anchors.rightMargin = menu_buy.width * 0.03
                    }
                    onClicked:
                    {
                        menu_buy.visible = false;
                    }
                }
            }

            Label
            {
                id:menu_buy_text
                width: parent.width * 0.9
                height: parent.height * 0.05
                wrapMode: TextEdit.WordWrap
                color: "lightgreen"
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 17
                anchors.top: menu_buy_image.bottom
                anchors.topMargin: menu_buy.height * 0.01
                anchors.horizontalCenter: menu_buy.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
            }

            Label
            {
                id:menu_main_text
                width: parent.width * 0.9
                height: parent.height * 0.15
                wrapMode: TextEdit.WordWrap
                color: "yellow"
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 14
                anchors.top: menu_buy_text.bottom
                anchors.horizontalCenter: menu_buy.horizontalCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
            }

            ListModel
            {
                id: model_list
                ListElement{name_model:"Тип оружия:"; value_model: "xxxx"; value_color: "white"}
                ListElement{name_model:"Вероятность попадения:"; value_model: "xxxx"; value_color: "white"}
                ListElement{name_model:"Урон:"; value_model: "xxxx"; value_color: "white"}
                ListElement{name_model:"Жизнь:"; value_model: "xxxx"; value_color: "red"}
                ListElement{name_model:"Броня:"; value_model: "xxxx"; value_color: "white"}
                ListElement{name_model:"Инициатива:"; value_model: "xxxx"; value_color: "white"}
                ListElement{name_model:"Цель:"; value_model: "xxxx"; value_color: "white"}
                ListElement{name_model:"Защита:"; value_model: "xxxx"; value_color: "white"}
                ListElement{name_model:"Иммунитет:"; value_model: "xxxx"; value_color: "yellow"}
                ListElement{name_model:"Цель атак:"; value_model: "xxxx"; value_color: "white"}
                ListElement{name_model:"Описание:"; value_model: "xxxx"; value_color: "white"}
            }

            Component
            {
                id: object_delegate
                Delegate_building
                {
                    width: table.width
                    height: table.height / 11

                    name: model.name_model
                    value: model.value_model
                    color_type: model.value_color
                }
            }

            ListView
            {
                id: table
                model: model_list
                delegate: object_delegate
                width: menu_main_text.width * 0.5
                height: menu_buy.height * 0.5
                anchors.top: menu_main_text.bottom
                anchors.left: menu_buy.left
                anchors.leftMargin: menu_buy.width * 0.25

            }

            Label
            {
                id:menu_ok
                width: parent.width * 0.2
                height: parent.height * 0.1
                wrapMode: TextEdit.WordWrap
                color: "lightgreen"
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 14
                anchors.top: table.bottom
                anchors.topMargin: menu_buy.height * 0.02
                anchors.left: menu_buy.left
                anchors.leftMargin: parent.width * 0.2
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                text: "Купить"

                MouseArea
                {
                    anchors.fill: parent
                    hoverEnabled: true

                    onHoveredChanged:
                    {
                        if(level_building === 0)
                        {
                            if((global_settings.get_resurs("gold") < 200) || (global_settings.get_resurs("ruda") < 2))
                                return;
                        }
                        menu_ok.color = "green";
                    }
                    onExited: {menu_ok.color = "lightgreen";}
                    onClicked:
                    {
                        if((page < 2) || (page > 5))
                            return;

                        var gold = global_settings.get_resurs("gold");
                        var ruda = global_settings.get_resurs("ruda");
                        if(page === 2)
                        {
                            if(menu_buy_text.text === "Скелет"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("skelet_1",true);
                                    global_settings.add_can_buy_otrad("Скелет");
                                }
                            }
                            else if(menu_buy_text.text === "Лезвие льда"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("boez_cold_1",true);
                                    global_settings.add_can_buy_otrad("Лезвие льда");
                                }
                            }
                            else if(menu_buy_text.text === "Владыка"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("boez_fier_1",true);
                                    global_settings.add_can_buy_otrad("Владыка");
                                }
                            }
                            else if(menu_buy_text.text === "Огр"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("ogr_1",true);
                                    global_settings.add_can_buy_otrad("Огр");
                                }
                            }
                            else if(menu_buy_text.text === "Всадник смерти"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("boez_vsadnik_1",true);
                                    global_settings.add_can_buy_otrad("Всадник смерти");
                                }
                            }
                        }
                        else if(page === 3)
                        {
                            if(menu_buy_text.text === "Маг огня"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("fire_mag_1",true);
                                    global_settings.add_can_buy_otrad("Маг огня");
                                }
                            }
                            else if(menu_buy_text.text === "Маг тьмы"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("dark_mag_1",true);
                                    global_settings.add_can_buy_otrad("Маг тьмы");
                                }
                            }
                            else if(menu_buy_text.text === "Арбалетчик"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("arbaletshik_1",true);
                                    global_settings.add_can_buy_otrad("Арбалетчик");
                                }
                            }
                            else if(menu_buy_text.text === "Лучник"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("luchnik_1",true);
                                    global_settings.add_can_buy_otrad("Лучник");
                                }
                            }
                            else if(menu_buy_text.text === "Маг молний"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("molniy_mag_1",true);
                                    global_settings.add_can_buy_otrad("Маг молний");
                                }
                            }
                        }
                        else if(page === 4)
                        {
                            if(menu_buy_text.text === "Призрак"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("paralish_1",true);
                                    global_settings.add_can_buy_otrad("Призрак");
                                }
                            }
                            else if(menu_buy_text.text === "Целитель"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("heal_1_6",true);
                                    global_settings.add_can_buy_otrad("Целитель");
                                }
                            }
                            else if(menu_buy_text.text === "Лекарь"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("heal_1_1",true);
                                    global_settings.add_can_buy_otrad("Лекарь");
                                }
                            }
                            else if(menu_buy_text.text === "Шаман"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("proklynaet_1",true);
                                    global_settings.add_can_buy_otrad("Шаман");
                                }
                            }
                            else if(menu_buy_text.text === "Симбиот"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("simbiot_1",true);
                                    global_settings.add_can_buy_otrad("Симбиот");
                                }
                            }
                        }
                        else if(page === 5)
                        {
                            if(menu_buy_text.text === "Голем"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("golem_1",true);
                                    global_settings.add_can_buy_otrad("Голем");
                                }
                            }
                            if(menu_buy_text.text === "Элементаль холода"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("elemental_cold_1",true);
                                    global_settings.add_can_buy_otrad("Элементаль холода");
                                }
                            }
                            if(menu_buy_text.text === "Темный ангел"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("angel_1",true);
                                    global_settings.add_can_buy_otrad("Темный ангел");
                                }
                            }
                            if(menu_buy_text.text === "Вампир"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("vampir_1",true);
                                    global_settings.add_can_buy_otrad("Вампир");
                                }
                            }
                            if(menu_buy_text.text === "Элементаль молний"){
                                if((gold >= 200) && (ruda >= 2)){
                                    global_settings.set_resurs("gold",(gold - 200));
                                    global_settings.set_resurs("ruda",(ruda - 2));
                                    global_settings.set_building("elemental_elektrisiti_1",true);
                                    global_settings.add_can_buy_otrad("Элементаль молний");
                                }
                            }
                        }

                        update_resurs();
                        repaint(page);
                        menu_buy.visible = false;
                    }
                }
            }

            Label
            {
                id:menu_cansel
                width: parent.width * 0.2
                height: parent.height * 0.1
                wrapMode: TextEdit.WordWrap
                color: "violet"
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 14
                anchors.top: table.bottom
                anchors.topMargin: menu_buy.height * 0.02
                anchors.right: menu_buy.right
                anchors.rightMargin: parent.width * 0.2
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
                text: "Отмена"

                MouseArea
                {
                    anchors.fill: parent
                    hoverEnabled: true

                    onHoveredChanged: {menu_cansel.color = "red";}
                    onExited: {menu_cansel.color = "violet";}
                    onClicked: {menu_buy.visible = false;}
                }
            }
        }
    }
}
