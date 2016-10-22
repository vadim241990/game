import QtQuick 2.4
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

Rectangle //поле боя
{
    id: main_windows
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    visible: true
    focus: true

    property int height_define_1: main_windows.height * 0.1
    property int height_define_2: main_windows.height * 0.08
    property int width_border: 2
    property int size_select_otrad: 1
    property int number_animation: 0
    property bool my_hod: false
    property bool init_battle: false
    property bool lock: false         //блокировка действий мыши пока идет расчет удара и его анимация
    property int x_hover: -1          //если не сходить с иконки игрока для удара будет некорректное отображение
    property int y_hover: -1
    property int mode: 1              //0 - обработка эффектов 1 - обработка удара
    property variant massiv_effect: [0,0] //0 - не обрабатывать 1 - обрабатывать
    ///1 элемент - Обрабатывать паралич(переход хода)
    property variant massiv_kill: [0,0,0,0,0,0,0,0,0,0,0,0] //0-элемент не обрабатывался //1-элемент надо обработать //2-прошол обработку
    ///pos_1_1 - pos_1_2 || pos_2_1 - pos_2_2  massiv_kill[0] - massiv_kill[1]  ||  massiv_kill[6] - massiv_kill[7]
    ///pos_1_3 - pos_1_4 || pos_2_3 - pos_2_4  massiv_kill[2] - massiv_kill[3]  ||  massiv_kill[8] - massiv_kill[9]
    ///pos_1_5 - pos_1_6 || pos_2_5 - pos_2_6  massiv_kill[4] - massiv_kill[5]  ||  massiv_kill[10] - massiv_kill[11]

    function job_effect()
    {
        var res = global_settings.use_effect();
        if(res === "")
            return;

        var start_index = 0;
        var end_index = 0;
        var start_index_2 = 0;
        var end_index_2 = 0;
        var element = "";
        var name = "";
        var image_eff = "";
        var x = 0;
        var y = 0;

        //очистим предварительно прошлые действия эффектов
        for(var i = 0; i < massiv_effect.length; i++)
        {
            massiv_effect[i] = 0;
        }

        while(1)
        {
            end_index = res.indexOf("#",start_index + 1);
            if(end_index === -1)
                break;

            element = res.slice(start_index,end_index);
            start_index = end_index + 1;

            end_index_2 = element.indexOf("$",start_index_2 + 1);
            if(end_index_2 === -1)
                continue;

            name = element.slice(start_index_2,end_index_2);
            start_index_2 = end_index_2 + 1;

            if(name === "PARALISH")
            {
                x = global_settings.get_first_in_osheredi_x();
                y = global_settings.get_first_in_osheredi_y();
                end_index_2 = element.indexOf("$",start_index_2);
                image_eff = element.slice(start_index_2,end_index_2);
                var text = "Паралич";

                if((x === 2) && (y === 0))
                {
                    pos_2_1_backgrounde.visible = true;
                    pos_2_1_backgrounde.source = image_eff;
                    pos_2_1_animation.start();
                    pos_2_1_backgrounde_text.visible = true;
                    pos_2_1_backgrounde_text.text = text;
                }
                else if((x === 3) && (y === 0))
                {
                    pos_2_2_backgrounde.visible = true;
                    pos_2_2_backgrounde.source = image_eff;
                    pos_2_2_animation.start();
                    pos_2_2_backgrounde_text.visible = true;
                    pos_2_2_backgrounde_text.text = text;
                }
                else if((x === 2) && (y === 1))
                {
                    pos_2_3_backgrounde.visible = true;
                    pos_2_3_backgrounde.source = image_eff;
                    pos_2_3_animation.start();
                    pos_2_3_backgrounde_text.visible = true;
                    pos_2_3_backgrounde_text.text = text;
                }
                else if((x === 3) && (y === 1))
                {
                    pos_2_4_backgrounde.visible = true;
                    pos_2_4_backgrounde.source = image_eff;
                    pos_2_4_animation.start();
                    pos_2_4_backgrounde_text.visible = true;
                    pos_2_4_backgrounde_text.text = text;
                }
                else if((x === 2) && (y === 2))
                {
                    pos_2_5_backgrounde.visible = true;
                    pos_2_5_backgrounde.source = image_eff;
                    pos_2_5_animation.start();
                    pos_2_5_backgrounde_text.visible = true;
                    pos_2_5_backgrounde_text.text = text;
                }
                else if((x === 3) && (y === 2))
                {
                    pos_2_6_backgrounde.visible = true;
                    pos_2_6_backgrounde.source = image_eff;
                    pos_2_6_animation.start();
                    pos_2_6_backgrounde_text.visible = true;
                    pos_2_6_backgrounde_text.text = text;
                }
                else if((x === 0) && (y === 0))
                {
                    pos_1_1_backgrounde.visible = true;
                    pos_1_1_backgrounde.source = image_eff;
                    pos_1_1_animation.start();
                    pos_1_1_backgrounde_text.visible = true;
                    pos_1_1_backgrounde_text.text = text;
                }
                else if((x === 1) && (y === 0))
                {
                    pos_1_2_backgrounde.visible = true;
                    pos_1_2_backgrounde.source = image_eff;
                    pos_1_2_animation.start();
                    pos_1_2_backgrounde_text.visible = true;
                    pos_1_2_backgrounde_text.text = text;
                }
                else if((x === 0) && (y === 1))
                {
                    pos_1_3_backgrounde.visible = true;
                    pos_1_3_backgrounde.source = image_eff;
                    pos_1_3_animation.start();
                    pos_1_3_backgrounde_text.visible = true;
                    pos_1_3_backgrounde_text.text = text;
                }
                else if((x === 1) && (y === 1))
                {
                    pos_1_4_backgrounde.visible = true;
                    pos_1_4_backgrounde.source = image_eff;
                    pos_1_4_animation.start();
                    pos_1_4_backgrounde_text.visible = true;
                    pos_1_4_backgrounde_text.text = text;
                }
                else if((x === 0) && (y === 2))
                {
                    pos_1_5_backgrounde.visible = true;
                    pos_1_5_backgrounde.source = image_eff;
                    pos_1_5_animation.start();
                    pos_1_5_backgrounde_text.visible = true;
                    pos_1_5_backgrounde_text.text = text;
                }
                else if((x === 1) && (y === 2))
                {
                    pos_1_6_backgrounde.visible = true;
                    pos_1_6_backgrounde.source = image_eff;
                    pos_1_6_animation.start();
                    pos_1_6_backgrounde_text.visible = true;
                    pos_1_6_backgrounde_text.text = text;
                }

                massiv_effect[0] = 1;
                number_animation++;
                return false;
            }
        }

    }

    function hod_pc()
    {
        var stroka = global_settings.hod_pc(); //обработка логической части

        pos_1_1_animation.duration = 2000;  //ставим большую паузу, что бы не упустить все из виду
        pos_1_2_animation.duration = 2000;
        pos_1_3_animation.duration = 2000;
        pos_1_4_animation.duration = 2000;
        pos_1_5_animation.duration = 2000;
        pos_1_6_animation.duration = 2000;
        pos_2_1_animation.duration = 2000;
        pos_2_2_animation.duration = 2000;
        pos_2_3_animation.duration = 2000;
        pos_2_4_animation.duration = 2000;
        pos_2_5_animation.duration = 2000;
        pos_2_6_animation.duration = 2000;

        attack(0,0,stroka); //0,0 - для пк   //отрисовка логической обработки

        pos_1_1_animation.duration = 1000;   //ставим обратно стандартную паузу
        pos_1_2_animation.duration = 1000;
        pos_1_3_animation.duration = 1000;
        pos_1_4_animation.duration = 1000;
        pos_1_5_animation.duration = 1000;
        pos_1_6_animation.duration = 1000;
        pos_2_1_animation.duration = 1000;
        pos_2_2_animation.duration = 1000;
        pos_2_3_animation.duration = 1000;
        pos_2_4_animation.duration = 1000;
        pos_2_5_animation.duration = 1000;
        pos_2_6_animation.duration = 1000;
    }

    function perehod_hoda()
    {
        number_animation--;
        if(number_animation < 0) //защита от первой инициализации при старте формы
        {
            number_animation = 0;
            return;
        }

        if(number_animation == 0)
        {
            global_settings.perehod_hoda();
            update_oshered_hodov();
            repaint_select_disable_mouse(0,0);
            repaint_select_disable_mouse(2,0);
            who_create_hod();
            if(job_effect() === false)
                return;

            if(my_hod === false)
            {
                disable_select_move();
                hod_pc();
            }
            else
            {
                lock = false;
                if(x_hover !== -1)
                {
                    repaint_select_mouse(x_hover,y_hover);
                    disable_select_move();
                    select_move(x_hover,y_hover);
                }
            }
        }
    }

    function attack(x,y,text) // для пк text - заполнен, иначе пустая строка
    {
        lock = true;
        var start_index = 0;
        var end_index = 0;
        var name_res = "";
        var stroka = "";

        var max;
        var res;

        var massiv = new Array(6);
        for(var z = 0; z < massiv.length; z++)
            massiv[z] = "";

        var massiv_one_player = new Array(7);
        for(z = 0; z < massiv.length; z++)
            massiv_one_player[z] = "";

        if(text === "")
            stroka = global_settings.damage(x,y);
        else
            stroka = text;

        start_index = stroka.indexOf("!",start_index + 1);  //забираем результат о ходе битвы
        if(start_index !== -1)
        {
            text = stroka.slice(start_index + 1,stroka.length);
            global_settings.set_result_battle(text);
        }

        start_index = 0;

        for(var i = 0; i < massiv.length;i++)
        {
            end_index = stroka.indexOf("#",start_index + 1);
            if(end_index === -1) // удар по одному отряду
                break;

            massiv[i] = stroka.slice(start_index,end_index);
            start_index = end_index + 1;
        }


        for(var j = 0; j < massiv.length; j++)
        {
            start_index = 0;
            end_index = 0;
            if(massiv[j] === "")
                break;
            else
            {
                for(var s = 0; s < massiv_one_player.length; s++)
                {
                    end_index = massiv[j].indexOf("$",start_index + 1);
                    if(end_index === -1) // удар по одному отряду
                        break;

                    massiv_one_player[s] = massiv[j].slice(start_index,end_index);
                    start_index = end_index + 1;
                }

                if((massiv_one_player[0] === "2") && (massiv_one_player[1] === "0"))
                {
                    text_real_life_pos_2_1.text = massiv_one_player[3] + "/" + massiv_one_player[2];
                    max = (life_pos_2_1.width - width_border) - (image_life_pos_2_1.width + width_border);
                    res = massiv_one_player[3] / massiv_one_player[2];
                    real_life_pos_2_1.width = max * res;
                    pos_2_1_backgrounde.visible = true;
                    pos_2_1_backgrounde.source = massiv_one_player[4];
                    pos_2_1_animation.start();
                    number_animation++;
                    if(massiv_one_player[5] === "true")
                        massiv_kill[6] = 1;
                }
                else if((massiv_one_player[0] === "3") && (massiv_one_player[1] === "0"))
                {
                    text_real_life_pos_2_2.text = massiv_one_player[3] + "/" + massiv_one_player[2];
                    max = (life_pos_2_2.width - width_border) - (image_life_pos_2_2.width + width_border);
                    res = massiv_one_player[3] / massiv_one_player[2];
                    real_life_pos_2_2.width = max * res;
                    pos_2_2_backgrounde.visible = true;
                    pos_2_2_backgrounde.source = massiv_one_player[4];
                    pos_2_2_animation.start();
                    number_animation++;
                    if(massiv_one_player[5] === "true")
                        massiv_kill[7] = 1;
                }
                else if((massiv_one_player[0] === "2") && (massiv_one_player[1] === "1"))
                {
                    text_real_life_pos_2_3.text = massiv_one_player[3] + "/" + massiv_one_player[2];
                    max = (life_pos_2_3.width - width_border) - (image_life_pos_2_3.width + width_border);
                    res = massiv_one_player[3] / massiv_one_player[2];
                    real_life_pos_2_3.width = max * res;
                    pos_2_3_backgrounde.visible = true;
                    pos_2_3_backgrounde.source = massiv_one_player[4];
                    pos_2_3_animation.start();
                    number_animation++;
                    if(massiv_one_player[5] === "true")
                        massiv_kill[8] = 1;
                }
                else if((massiv_one_player[0] === "3") && (massiv_one_player[1] === "1"))
                {
                    text_real_life_pos_2_4.text = massiv_one_player[3] + "/" + massiv_one_player[2];
                    max = (life_pos_2_4.width - width_border) - (image_life_pos_2_4.width + width_border);
                    res = massiv_one_player[3] / massiv_one_player[2];
                    real_life_pos_2_4.width = max * res;
                    pos_2_4_backgrounde.visible = true;
                    pos_2_4_backgrounde.source = massiv_one_player[4];
                    pos_2_4_animation.start();
                    number_animation++;
                    if(massiv_one_player[5] === "true")
                        massiv_kill[9] = 1;
                }
                else if((massiv_one_player[0] === "2") && (massiv_one_player[1] === "2"))
                {
                    text_real_life_pos_2_5.text = massiv_one_player[3] + "/" + massiv_one_player[2];
                    max = (life_pos_2_5.width - width_border) - (image_life_pos_2_5.width + width_border);
                    res = massiv_one_player[3] / massiv_one_player[2];
                    real_life_pos_2_5.width = max * res;
                    pos_2_5_backgrounde.visible = true;
                    pos_2_5_backgrounde.source = massiv_one_player[4];
                    pos_2_5_animation.start();
                    number_animation++;
                    if(massiv_one_player[5] === "true")
                        massiv_kill[10] = 1;
                }
                else if((massiv_one_player[0] === "3") && (massiv_one_player[1] === "2"))
                {
                    text_real_life_pos_2_6.text = massiv_one_player[3] + "/" + massiv_one_player[2];
                    max = (life_pos_2_6.width - width_border) - (image_life_pos_2_6.width + width_border);
                    res = massiv_one_player[3] / massiv_one_player[2];
                    real_life_pos_2_6.width = max * res;
                    pos_2_6_backgrounde.visible = true;
                    pos_2_6_backgrounde.source = massiv_one_player[4];
                    pos_2_6_animation.start();
                    number_animation++;
                    if(massiv_one_player[5] === "true")
                        massiv_kill[11] = 1;
                }
                else if((massiv_one_player[0] === "0") && (massiv_one_player[1] === "0"))
                {
                    text_real_life_pos_1_1.text = massiv_one_player[3] + "/" + massiv_one_player[2];
                    max = (life_pos_1_1.width - width_border) - (image_life_pos_1_1.width + width_border);
                    res = massiv_one_player[3] / massiv_one_player[2];
                    real_life_pos_1_1.width = max * res;
                    pos_1_1_backgrounde.visible = true;
                    pos_1_1_backgrounde.source = massiv_one_player[4];
                    pos_1_1_animation.start();
                    number_animation++;
                    if(massiv_one_player[5] === "true")
                        massiv_kill[0] = 1;
                }
                else if((massiv_one_player[0] === "1") && (massiv_one_player[1] === "0"))
                {
                    text_real_life_pos_1_2.text = massiv_one_player[3] + "/" + massiv_one_player[2];
                    max = (life_pos_1_2.width - width_border) - (image_life_pos_1_2.width + width_border);
                    res = massiv_one_player[3] / massiv_one_player[2];
                    real_life_pos_1_2.width = max * res;
                    pos_1_2_backgrounde.visible = true;
                    pos_1_2_backgrounde.source = massiv_one_player[4];
                    pos_1_2_animation.start();
                    number_animation++;
                    if(massiv_one_player[5] === "true")
                        massiv_kill[1] = 1;
                }
                else if((massiv_one_player[0] === "0") && (massiv_one_player[1] === "1"))
                {
                    text_real_life_pos_1_3.text = massiv_one_player[3] + "/" + massiv_one_player[2];
                    max = (life_pos_1_3.width - width_border) - (image_life_pos_1_3.width + width_border);
                    res = massiv_one_player[3] / massiv_one_player[2];
                    real_life_pos_1_3.width = max * res;
                    pos_1_3_backgrounde.visible = true;
                    pos_1_3_backgrounde.source = massiv_one_player[4];
                    pos_1_3_animation.start();
                    number_animation++;
                    if(massiv_one_player[5] === "true")
                        massiv_kill[2] = 1;
                }
                else if((massiv_one_player[0] === "1") && (massiv_one_player[1] === "1"))
                {
                    text_real_life_pos_1_4.text = massiv_one_player[3] + "/" + massiv_one_player[2];
                    max = (life_pos_1_4.width - width_border) - (image_life_pos_1_4.width + width_border);
                    res = massiv_one_player[3] / massiv_one_player[2];
                    real_life_pos_1_4.width = max * res;
                    pos_1_4_backgrounde.visible = true;
                    pos_1_4_backgrounde.source = massiv_one_player[4];
                    pos_1_4_animation.start();
                    number_animation++;
                    if(massiv_one_player[5] === "true")
                        massiv_kill[3] = 1;
                }
                else if((massiv_one_player[0] === "0") && (massiv_one_player[1] === "2"))
                {
                    text_real_life_pos_1_5.text = massiv_one_player[3] + "/" + massiv_one_player[2];
                    max = (life_pos_1_5.width - width_border) - (image_life_pos_1_5.width + width_border);
                    res = massiv_one_player[3] / massiv_one_player[2];
                    real_life_pos_1_5.width = max * res;
                    pos_1_5_backgrounde.visible = true;
                    pos_1_5_backgrounde.source = massiv_one_player[4];
                    pos_1_5_animation.start();
                    number_animation++;
                    if(massiv_one_player[5] === "true")
                        massiv_kill[4] = 1;
                }
                else if((massiv_one_player[0] === "1") && (massiv_one_player[1] === "2"))
                {
                    text_real_life_pos_1_6.text = massiv_one_player[3] + "/" + massiv_one_player[2];
                    max = (life_pos_1_6.width - width_border) - (image_life_pos_1_6.width + width_border);
                    res = massiv_one_player[3] / massiv_one_player[2];
                    real_life_pos_1_6.width = max * res;
                    pos_1_6_backgrounde.visible = true;
                    pos_1_6_backgrounde.source = massiv_one_player[4];
                    pos_1_6_animation.start();
                    number_animation++;
                    if(massiv_one_player[5] === "true")
                        massiv_kill[5] = 1;
                }

                help_damage(massiv_one_player[0],massiv_one_player[1],massiv_one_player[6],global_settings.get_first_in_osheredi_x());
            }
        }
    }

    function who_win()
    {
        var result_game = global_settings.get_result_battle();
        if(result_game === "void")
            return;
        else if((result_game === "win") || (result_game === "game_over"))
        {
            item_loader_windows.settings_select("/building_home/result.qml");
        }

        return;
    }

    function help_damage(x,y,uron,x_man_attack)
    {
        var text = "";
        if(uron === "Иммунитет")    text = uron;
        else if(uron === "Защита")  text = uron;
        else if(uron === "Промах")  text = uron;
        else
        {
            if((x_man_attack === 0) || (x_man_attack === 1)) //атакующий в синей команде
            {
                if((x === "0") || (x === "1"))
                    text = "+" + uron;    //атакует свой отряд значит накладывает положительные чары
                else
                    text = "-" + uron;
            }
            else    //действия для пк
            {
                if((x === "2") || (x === "3"))
                    text = "+" + uron;
                else
                    text = "-" + uron;
            }
        }

        if((x === "2") && (y === "0"))
        {
            pos_2_1_backgrounde_text.visible = true;
            pos_2_1_backgrounde_text.text = text;
        }
        else if((x === "3") && (y === "0"))
        {
            pos_2_2_backgrounde_text.visible = true;
            pos_2_2_backgrounde_text.text = text;
        }
        else if((x === "2") && (y === "1"))
        {
            pos_2_3_backgrounde_text.visible = true;
            pos_2_3_backgrounde_text.text = text;
        }
        else if((x === "3") && (y === "1"))
        {
            pos_2_4_backgrounde_text.visible = true;
            pos_2_4_backgrounde_text.text = text;
        }
        else if((x === "2") && (y === "2"))
        {
            pos_2_5_backgrounde_text.visible = true;
            pos_2_5_backgrounde_text.text = text;
        }
        else if((x === "3") && (y === "2"))
        {
            pos_2_6_backgrounde_text.visible = true;
            pos_2_6_backgrounde_text.text = text;
        }
        else if((x === "0") && (y === "0"))
        {
            pos_1_1_backgrounde_text.visible = true;
            pos_1_1_backgrounde_text.text = text;
        }
        else if((x === "1") && (y === "0"))
        {
            pos_1_2_backgrounde_text.visible = true;
            pos_1_2_backgrounde_text.text = text;
        }
        else if((x === "0") && (y === "1"))
        {
            pos_1_3_backgrounde_text.visible = true;
            pos_1_3_backgrounde_text.text = text;
        }
        else if((x === "1") && (y === "1"))
        {
            pos_1_4_backgrounde_text.visible = true;
            pos_1_4_backgrounde_text.text = text;
        }
        else if((x === "0") && (y === "2"))
        {
            pos_1_5_backgrounde_text.visible = true;
            pos_1_5_backgrounde_text.text = text;
        }
        else if((x === "1") && (y === "2"))
        {
            pos_1_6_backgrounde_text.visible = true;
            pos_1_6_backgrounde_text.text = text;
        }
    }

    function select_move(x,y)
    {
        var res = global_settings.select_oshered(x,y);

        if(res === -1)
            return;

        if(res === 0)        move_1.border.color = "orange";
        else if(res === 1)   move_2.border.color = "orange";
        else if(res === 2)   move_3.border.color = "orange";
        else if(res === 3)   move_4.border.color = "orange";
        else if(res === 4)   move_5.border.color = "orange";
        else if(res === 5)   move_6.border.color = "orange";
        else if(res === 6)   move_7.border.color = "orange";
        else if(res === 7)   move_8.border.color = "orange";
        else if(res === 8)   move_9.border.color = "orange";
        else if(res === 9)   move_10.border.color = "orange";
        else if(res === 10)  move_11.border.color = "orange";
        else if(res === 11)  move_12.border.color = "orange";
    }

    function disable_select_move()
    {
        move_1.border.color = "green";
        move_2.border.color = "blue";
        move_3.border.color = "blue";
        move_4.border.color = "blue";
        move_5.border.color = "blue";
        move_6.border.color = "blue";
        move_7.border.color = "blue";
        move_8.border.color = "blue";
        move_9.border.color = "blue";
        move_10.border.color = "blue";
        move_11.border.color = "blue";
        move_12.border.color = "blue";
    }

    function who_create_hod()
    {
        var x = global_settings.get_first_in_osheredi_x();

        if((x === 0) || (x === 1))
            my_hod = true;
        else
            my_hod = false;
    }

    function help_use_one_rad()  //true - если на первом ряде ктото есть иначе false
    {
        if(life_pos_1_2.visible === true)       return true;
        else if(life_pos_1_4.visible === true)  return true;
        else if(life_pos_1_6.visible === true)  return true;

        return false;
    }

    function help_nalishie_one_rady() //true - если в первом ряде имеются бойцы иначе false
    {
        if(life_pos_2_1.visible === true)       return true;
        else if(life_pos_2_3.visible === true)  return true;
        else if(life_pos_2_5.visible === true)  return true;

        return false;
    }

    function disable_life_pos_1_1()
    {
        life_pos_1_1.visible = false;
        image_life_pos_1_1.visible = false;
        real_life_pos_1_1.visible = false;
        text_real_life_pos_1_1.visible = false;
    }

    function disable_life_pos_1_2()
    {
        life_pos_1_2.visible = false;
        image_life_pos_1_2.visible = false;
        real_life_pos_1_2.visible = false;
        text_real_life_pos_1_2.visible = false;
    }

    function disable_life_pos_1_3()
    {
        life_pos_1_3.visible = false;
        image_life_pos_1_3.visible = false;
        real_life_pos_1_3.visible = false;
        text_real_life_pos_1_3.visible = false;
    }

    function disable_life_pos_1_4()
    {
        life_pos_1_4.visible = false;
        image_life_pos_1_4.visible = false;
        real_life_pos_1_4.visible = false;
        text_real_life_pos_1_4.visible = false;
    }

    function disable_life_pos_1_5()
    {
        life_pos_1_5.visible = false;
        image_life_pos_1_5.visible = false;
        real_life_pos_1_5.visible = false;
        text_real_life_pos_1_5.visible = false;
    }

    function disable_life_pos_1_6()
    {
        life_pos_1_6.visible = false;
        image_life_pos_1_6.visible = false;
        real_life_pos_1_6.visible = false;
        text_real_life_pos_1_6.visible = false;
    }

    function disable_life_pos_2_1()
    {
        life_pos_2_1.visible = false;
        image_life_pos_2_1.visible = false;
        real_life_pos_2_1.visible = false;
        text_real_life_pos_2_1.visible = false;
    }

    function disable_life_pos_2_2()
    {
        life_pos_2_2.visible = false;
        image_life_pos_2_2.visible = false;
        real_life_pos_2_2.visible = false;
        text_real_life_pos_2_2.visible = false;
    }

    function disable_life_pos_2_3()
    {
        life_pos_2_3.visible = false;
        image_life_pos_2_3.visible = false;
        real_life_pos_2_3.visible = false;
        text_real_life_pos_2_3.visible = false;
    }

    function disable_life_pos_2_4()
    {
        life_pos_2_4.visible = false;
        image_life_pos_2_4.visible = false;
        real_life_pos_2_4.visible = false;
        text_real_life_pos_2_4.visible = false;
    }

    function disable_life_pos_2_5()
    {
        life_pos_2_5.visible = false;
        image_life_pos_2_5.visible = false;
        real_life_pos_2_5.visible = false;
        text_real_life_pos_2_5.visible = false;
    }

    function disable_life_pos_2_6()
    {
        life_pos_2_6.visible = false;
        image_life_pos_2_6.visible = false;
        real_life_pos_2_6.visible = false;
        text_real_life_pos_2_6.visible = false;
    }

    function show_select_all_other_team()
    {
        if(life_pos_2_1.visible === true)
            effect_pos_2_1.color = "orange";
        if(life_pos_2_2.visible === true)
            effect_pos_2_2.color = "orange";
        if(life_pos_2_3.visible === true)
            effect_pos_2_3.color = "orange";
        if(life_pos_2_4.visible === true)
            effect_pos_2_4.color = "orange";
        if(life_pos_2_5.visible === true)
            effect_pos_2_5.color = "orange";
        if(life_pos_2_6.visible === true)
            effect_pos_2_6.color = "orange";
    }

    function repaint_select_disable_mouse(select_x,select_y)
    {
        if(select_x > 1)
        {
            if(life_pos_2_1.visible === true)
                effect_pos_2_1.color = "red";
            if(life_pos_2_2.visible === true)
                effect_pos_2_2.color = "red";
            if(life_pos_2_3.visible === true)
                effect_pos_2_3.color = "red";
            if(life_pos_2_4.visible === true)
                effect_pos_2_4.color = "red";
            if(life_pos_2_5.visible === true)
                effect_pos_2_5.color = "red";
            if(life_pos_2_6.visible === true)
                effect_pos_2_6.color = "red";
        }
        else
        {
            if(life_pos_1_1.visible === true)
                effect_pos_1_1.color = "blue";
            if(life_pos_1_2.visible === true)
                effect_pos_1_2.color = "blue";
            if(life_pos_1_3.visible === true)
                effect_pos_1_3.color = "blue";
            if(life_pos_1_4.visible === true)
                effect_pos_1_4.color = "blue";
            if(life_pos_1_5.visible === true)
                effect_pos_1_5.color = "blue";
            if(life_pos_1_6.visible === true)
                effect_pos_1_6.color = "blue";
        }

        repaint_select_first_otrad_in_oshered();
    }

    function repaint_select_mouse(select_x,select_y)
    {
        if(my_hod === false)
            return;

        var shel = global_settings.get_first_in_osheredi_shel();
        var shel_attack = global_settings.get_first_in_osheredi_shel_attack();

        if(shel_attack === "1-2-ряд")
        {
            if(shel === "6")
            {
                show_select_all_other_team();
            }
            else
            {
                if((select_x === 2) && (select_y === 0))
                    effect_pos_2_1.color = "orange";
                else if((select_x === 3) && (select_y === 0))
                    effect_pos_2_2.color = "orange";
                else if((select_x === 2) && (select_y === 1))
                    effect_pos_2_3.color = "orange";
                else if((select_x === 3) && (select_y === 1))
                    effect_pos_2_4.color = "orange";
                else if((select_x === 2) && (select_y === 2))
                    effect_pos_2_5.color = "orange";
                else if((select_x === 3) && (select_y === 2))
                    effect_pos_2_6.color = "orange";
            }
        }
        else if(shel_attack === "1-ряд")
        {
            if(shel === "6")
            {
                show_select_all_other_team();
            }
            else
            {
                var y = global_settings.get_first_in_osheredi_y();
                var x = global_settings.get_first_in_osheredi_x();

                if((x === 0) && (help_use_one_rad() === true))//если игрок стоит во втором ряду и в 1-м ряду есть отряд
                    return;

                if(help_nalishie_one_rady() === true) //первый ряд
                {
                    if(y === 0 && ((life_pos_2_1.visible === true) || (life_pos_2_3.visible === true)))
                    {
                        if((select_x === 2) && (select_y === 0))
                            effect_pos_2_1.color = "orange";
                        else if((select_x === 2) && (select_y === 1))
                            effect_pos_2_3.color = "orange";
                    }
                    else if(y === 2 && ((life_pos_2_3.visible === true) || (life_pos_2_5.visible === true)))
                    {
                        if((select_x === 2) && (select_y === 1))
                            effect_pos_2_3.color = "orange";
                        else if((select_x === 2) && (select_y === 2))
                            effect_pos_2_5.color = "orange";
                    }
                    else  // стоит в центре или прочие ситуации не используемые выше
                    {
                        if((select_x === 2) && (select_y === 0))
                            effect_pos_2_1.color = "orange";
                        else if((select_x === 2) && (select_y === 1))
                            effect_pos_2_3.color = "orange";
                        else if((select_x === 2) && (select_y === 2))
                            effect_pos_2_5.color = "orange";
                    }
                }
                else //второй ряд
                {
                    if(y === 0 && ((life_pos_2_2.visible === true) || (life_pos_2_4.visible === true)))
                    {
                        if((select_x === 3) && (select_y === 0))
                            effect_pos_2_2.color = "orange";
                        else if((select_x === 3) && (select_y === 1))
                            effect_pos_2_4.color = "orange";
                    }
                    else if(y === 2 && ((life_pos_2_4.visible === true) || (life_pos_2_6.visible === true)))
                    {
                        if((select_x === 3) && (select_y === 1))
                            effect_pos_2_4.color = "orange";
                        else if((select_x === 3) && (select_y === 2))
                            effect_pos_2_6.color = "orange";
                    }
                    else  // стоит в центре или прочие ситуации не используемые выше
                    {
                        if((select_x === 3) && (select_y === 0))
                            effect_pos_2_2.color = "orange";
                        else if((select_x === 3) && (select_y === 1))
                            effect_pos_2_4.color = "orange";
                        else if((select_x === 3) && (select_y === 2))
                            effect_pos_2_6.color = "orange";
                    }
                }
            }
        }
        else if(shel_attack === "Свой отряд")
        {
            if(shel === "6")
            {
                if(select_x > 1)
                    return;

                if(life_pos_1_1.visible === true)
                    effect_pos_1_1.color = "yellow";
                if(life_pos_1_2.visible === true)
                    effect_pos_1_2.color = "yellow";
                if(life_pos_1_3.visible === true)
                    effect_pos_1_3.color = "yellow";
                if(life_pos_1_4.visible === true)
                    effect_pos_1_4.color = "yellow";
                if(life_pos_1_5.visible === true)
                    effect_pos_1_5.color = "yellow";
                if(life_pos_1_6.visible === true)
                    effect_pos_1_6.color = "yellow";
            }
            else
            {
                if((select_x === 0) && (select_y === 0))
                    effect_pos_1_1.color = "yellow";
                else if((select_x === 1) && (select_y === 0))
                    effect_pos_1_2.color = "yellow";
                else if((select_x === 0) && (select_y === 1))
                    effect_pos_1_3.color = "yellow";
                else if((select_x === 1) && (select_y === 1))
                    effect_pos_1_4.color = "yellow";
                else if((select_x === 0) && (select_y === 2))
                    effect_pos_1_5.color = "yellow";
                else if((select_x === 1) && (select_y === 2))
                    effect_pos_1_6.color = "yellow";
            }
        }
    }

    function can_damage(select_x,select_y)
    {
        if(my_hod === false)
            return;

        var shel = global_settings.get_first_in_osheredi_shel();
        var shel_attack = global_settings.get_first_in_osheredi_shel_attack();

        if(shel_attack === "1-2-ряд")
        {
            if(select_x >= 2)
                return true;
        }
        else if(shel_attack === "1-ряд")
        {
            if(shel === "6")
            {
                return true;
            }
            else
            {
                var y = global_settings.get_first_in_osheredi_y();
                var x = global_settings.get_first_in_osheredi_x();

                if((x === 0) && (help_use_one_rad() === true))//если игрок стоит во втором ряду и в 1-м ряду есть отряд
                    return false;

                if(help_nalishie_one_rady() === true) //первый ряд
                {
                    if(y === 0 && ((life_pos_2_1.visible === true) || (life_pos_2_3.visible === true)))
                    {
                        if((select_x === 2) && (select_y === 0) && (life_pos_2_1.visible === true))
                            return true;
                        else if((select_x === 2) && (select_y === 1) && (life_pos_2_3.visible === true))
                            return true;
                    }
                    else if(y === 2 && ((life_pos_2_3.visible === true) || (life_pos_2_5.visible === true)))
                    {
                        if((select_x === 2) && (select_y === 1) && (life_pos_2_3.visible === true))
                            return true;
                        else if((select_x === 2) && (select_y === 2) && (life_pos_2_5.visible === true))
                            return true;
                    }
                    else  // стоит в центре(может ударить всех в 1 ряде)
                    {
                        if((select_x === 2) && (select_y === 0) && (life_pos_2_1.visible === true))
                            return true;
                        else if((select_x === 2) && (select_y === 1) && (life_pos_2_3.visible === true))
                            return true;
                        else if((select_x === 2) && (select_y === 2) && (life_pos_2_5.visible === true))
                            return true;
                    }
                }
                else
                {
                    if(y === 0 && ((life_pos_2_2.visible === true) || (life_pos_2_4.visible === true)))
                    {
                        if((select_x === 3) && (select_y === 0) && (life_pos_2_2.visible === true))
                            return true;
                        else if((select_x === 3) && (select_y === 1) && (life_pos_2_4.visible === true))
                            return true;
                    }
                    else if(y === 2 && ((life_pos_2_4.visible === true) || (life_pos_2_6.visible === true)))
                    {
                        if((select_x === 3) && (select_y === 1) && (life_pos_2_4.visible === true))
                            return true;
                        else if((select_x === 3) && (select_y === 2) && (life_pos_2_6.visible === true))
                            return true;
                    }
                    else  // стоит в центре(может ударить всех в 1 ряде)
                    {
                        if((select_x === 3) && (select_y === 0) && (life_pos_2_2.visible === true))
                            return true;
                        else if((select_x === 3) && (select_y === 1) && (life_pos_2_4.visible === true))
                            return true;
                        else if((select_x === 3) && (select_y === 2) && (life_pos_2_6.visible === true))
                            return true;
                    }
                }
            }
        }
        else if(shel_attack === "Свой отряд")
        {
                if(select_x <= 1)
                    return true;
        }
        return false;
    }

    function repaint_select_first_otrad_in_oshered()
    {
        var x = global_settings.get_first_in_osheredi_x();
        var y = global_settings.get_first_in_osheredi_y();

        if((x === 0) && (y === 0))
            effect_pos_1_1.color = "green";
        else if((x === 1) && (y === 0))
            effect_pos_1_2.color = "green";
        else if((x === 0) && (y === 1))
            effect_pos_1_3.color = "green";
        else if((x === 1) && (y === 1))
            effect_pos_1_4.color = "green";
        else if((x === 0) && (y === 2))
            effect_pos_1_5.color = "green";
        else if((x === 1) && (y === 2))
            effect_pos_1_6.color = "green";
        else if((x === 2) && (y === 0))
            effect_pos_2_1.color = "green";
        else if((x === 3) && (y === 0))
            effect_pos_2_2.color = "green";
        else if((x === 2) && (y === 1))
            effect_pos_2_3.color = "green";
        else if((x === 3) && (y === 1))
            effect_pos_2_4.color = "green";
        else if((x === 2) && (y === 2))
            effect_pos_2_5.color = "green";
        else if((x === 3) && (y === 2))
            effect_pos_2_6.color = "green";
    }

    function init_start_game()
    {
        var start_index = 0;
        var end_index = 0;
        var unit_start_index = 0;
        var unit_end_index = 0;
        var unit = "";
        var res = "";
        var massiv = new Array(4);

        var stroka = global_settings.get_stroka_start_game();
        if(stroka === "") //не пришел ли пустой ответ
            return;

        while(1)
        {
            unit_start_index = 0; //после первого бойца надо обнулить
            end_index = stroka.indexOf("#",start_index + 1);
            if(end_index === -1)
                break;

            unit = stroka.slice(start_index,end_index);
            start_index = end_index + 1;

            for(var i = 0; i < massiv.length; i++)
            {
                unit_end_index = unit.indexOf(":",unit_start_index + 1);
                if(unit_end_index === -1)
                    break;

                res = unit.slice(unit_start_index,unit_end_index);
                massiv[i] = res;
                unit_start_index = unit_end_index + 1;
            }

            if((massiv[1] === "0") && (massiv[2] === "0"))
            {
                pos_1_1.source = global_settings.get_sourse_otrad(massiv[0],global_settings.get_level_team());
                text_real_life_pos_1_1.text = massiv[3] + "/" + massiv[3];
            }
            else if((massiv[1] === "1") && (massiv[2] === "0"))
            {
                pos_1_2.source = global_settings.get_sourse_otrad(massiv[0],global_settings.get_level_team());
                text_real_life_pos_1_2.text = massiv[3] + "/" + massiv[3];
            }
            else if((massiv[1] === "0") && (massiv[2] === "1"))
            {
                pos_1_3.source = global_settings.get_sourse_otrad(massiv[0],global_settings.get_level_team());
                text_real_life_pos_1_3.text = massiv[3] + "/" + massiv[3];
            }
            else if((massiv[1] === "1") && (massiv[2] === "1"))
            {
                pos_1_4.source = global_settings.get_sourse_otrad(massiv[0],global_settings.get_level_team());
                text_real_life_pos_1_4.text = massiv[3] + "/" + massiv[3];
            }
            else if((massiv[1] === "0") && (massiv[2] === "2"))
            {
                pos_1_5.source = global_settings.get_sourse_otrad(massiv[0],global_settings.get_level_team());
                text_real_life_pos_1_5.text = massiv[3] + "/" + massiv[3];
            }
            else if((massiv[1] === "1") && (massiv[2] === "2"))
            {
                pos_1_6.source = global_settings.get_sourse_otrad(massiv[0],global_settings.get_level_team());
                text_real_life_pos_1_6.text = massiv[3] + "/" + massiv[3];
            }
            else if((massiv[1] === "2") && (massiv[2] === "0"))
            {
                pos_2_1.source = global_settings.get_sourse_otrad(massiv[0],global_settings.get_level_team());
                text_real_life_pos_2_1.text = massiv[3] + "/" + massiv[3];
            }
            else if((massiv[1] === "3") && (massiv[2] === "0"))
            {
                pos_2_2.source = global_settings.get_sourse_otrad(massiv[0],global_settings.get_level_team());
                text_real_life_pos_2_2.text = massiv[3] + "/" + massiv[3];
            }
            else if((massiv[1] === "2") && (massiv[2] === "1"))
            {
                pos_2_3.source = global_settings.get_sourse_otrad(massiv[0],global_settings.get_level_team());
                text_real_life_pos_2_3.text = massiv[3] + "/" + massiv[3];
            }
            else if((massiv[1] === "3") && (massiv[2] === "1"))
            {
                pos_2_4.source = global_settings.get_sourse_otrad(massiv[0],global_settings.get_level_team());
                text_real_life_pos_2_4.text = massiv[3] + "/" + massiv[3];
            }
            else if((massiv[1] === "2") && (massiv[2] === "2"))
            {
                pos_2_5.source = global_settings.get_sourse_otrad(massiv[0],global_settings.get_level_team());
                text_real_life_pos_2_5.text = massiv[3] + "/" + massiv[3];
            }
            else if((massiv[1] === "3") && (massiv[2] === "2"))
            {
                pos_2_6.source = global_settings.get_sourse_otrad(massiv[0],global_settings.get_level_team());
                text_real_life_pos_2_6.text = massiv[3] + "/" + massiv[3];
            }
        }

        if(text_real_life_pos_1_1.text === "")
            disable_life_pos_1_1();

        if(text_real_life_pos_1_2.text === "")
            disable_life_pos_1_2();

        if(text_real_life_pos_1_3.text === "")
            disable_life_pos_1_3();

        if(text_real_life_pos_1_4.text === "")
            disable_life_pos_1_4();

        if(text_real_life_pos_1_5.text === "")
            disable_life_pos_1_5();

        if(text_real_life_pos_1_6.text === "")
            disable_life_pos_1_6();

        if(text_real_life_pos_2_1.text === "")
            disable_life_pos_2_1();

        if(text_real_life_pos_2_2.text === "")
            disable_life_pos_2_2();

        if(text_real_life_pos_2_3.text === "")
            disable_life_pos_2_3();

        if(text_real_life_pos_2_4.text === "")
            disable_life_pos_2_4();

        if(text_real_life_pos_2_5.text === "")
            disable_life_pos_2_5();

        if(text_real_life_pos_2_6.text === "")
            disable_life_pos_2_6();
    }

    function update_oshered_hodov()
    {
        var start_index = 0;
        var end_index = 0;
        var name_res = "";
        var massiv = new Array(12);
        for(var z = 0; z < massiv.length; z++)
            massiv[z] = "";

        var stroka = global_settings.get_oshered_hodov();
        if(stroka === "") //не пришел ли пустой ответ
            return;

        for(var i = 0; i < massiv.length; i++)
        {
            end_index = stroka.indexOf("#",start_index + 1);
            if(end_index === -1)
                break;

            name_res = stroka.slice(start_index,end_index);
            massiv[i] = name_res;
            start_index = end_index + 1;
        }

        /////////////////////////////////////////////////
        if(massiv[0] !== "")
            move_1_image.source = global_settings.get_sourse_otrad(massiv[0],global_settings.get_level_team());
        else
        {
            move_1.visible = false;
            move_1_image.visible = false;
        }
        /////////////////////////////////////////////////
        if(massiv[1] !== "")
            move_2_image.source = global_settings.get_sourse_otrad(massiv[1],global_settings.get_level_team());
        else
        {
            move_2.visible = false;
            move_2_image.visible = false;
        }
        /////////////////////////////////////////////////
        if(massiv[2] !== "")
            move_3_image.source = global_settings.get_sourse_otrad(massiv[2],global_settings.get_level_team());
        else
        {
            move_3.visible = false;
            move_3_image.visible = false;
        }
        /////////////////////////////////////////////////
        if(massiv[3] !== "")
            move_4_image.source = global_settings.get_sourse_otrad(massiv[3],global_settings.get_level_team());
        else
        {
            move_4.visible = false;
            move_4_image.visible = false;
        }
        /////////////////////////////////////////////////
        if(massiv[4] !== "")
            move_5_image.source = global_settings.get_sourse_otrad(massiv[4],global_settings.get_level_team());
        else
        {
            move_5.visible = false;
            move_5_image.visible = false;
        }
        /////////////////////////////////////////////////
        if(massiv[5] !== "")
            move_6_image.source = global_settings.get_sourse_otrad(massiv[5],global_settings.get_level_team());
        else
        {
            move_6.visible = false;
            move_6_image.visible = false;
        }
        /////////////////////////////////////////////////
        if(massiv[6] !== "")
            move_7_image.source = global_settings.get_sourse_otrad(massiv[6],global_settings.get_level_team());
        else
        {
            move_7.visible = false;
            move_7_image.visible = false;
        }
        /////////////////////////////////////////////////
        if(massiv[7] !== "")
            move_8_image.source = global_settings.get_sourse_otrad(massiv[7],global_settings.get_level_team());
        else
        {
            move_8.visible = false;
            move_8_image.visible = false;
        }
        /////////////////////////////////////////////////
        if(massiv[8] !== "")
            move_9_image.source = global_settings.get_sourse_otrad(massiv[8],global_settings.get_level_team());
        else
        {
            move_9.visible = false;
            move_9_image.visible = false;
        }
        /////////////////////////////////////////////////
        if(massiv[9] !== "")
            move_10_image.source = global_settings.get_sourse_otrad(massiv[9],global_settings.get_level_team());
        else
        {
            move_10.visible = false;
            move_10_image.visible = false;
        }
        /////////////////////////////////////////////////
        if(massiv[10] !== "")
            move_11_image.source = global_settings.get_sourse_otrad(massiv[10],global_settings.get_level_team());
        else
        {
            move_11.visible = false;
            move_11_image.visible = false;
        }
        /////////////////////////////////////////////////
        if(massiv[11] !== "")
            move_12_image.source = global_settings.get_sourse_otrad(massiv[11],global_settings.get_level_team());
        else
        {
            move_12.visible = false;
            move_12_image.visible = false;
        }
        /////////////////////////////////////////////////
    }

    function init()
    {
        if(init_battle === false)
        {
            update_oshered_hodov();
            init_start_game();
            repaint_select_first_otrad_in_oshered();
            who_create_hod();
            init_battle = true;
        }

        if(global_settings.get_level_game() === 1)
            return "file:///" + applicationDirPath + "/image/battle/fon_battle_1.jpg";
    }

    Keys.onEscapePressed:
    {
        esc_esc.visible = true;
    }
    
    Image
    {
      id: fon
      width: parent.width
      height: parent.height
      source: init()
    }
    
    //модуль очередности хода
    Rectangle
    {
      id: move_1
      height: height_define_1
      width: move_1.height
      color: "white"
      border.width: 4
      border.color: "green"
      anchors.bottom: main_windows.bottom
      anchors.bottomMargin: main_windows.height * 0.02
      anchors.left: main_windows.left
      anchors.leftMargin: main_windows.height * 0.02
      visible: true

      Image
      {
        id: move_1_image
        height: move_1.height - 4
        width: move_1.width - 4
        anchors.centerIn: move_1
      }
    }

    Rectangle
    {
      id: move_2
      height: height_define_2
      width: move_2.height
      color: "white"
      border.width: 4
      border.color: "blue"
      anchors.bottom: main_windows.bottom
      anchors.bottomMargin: main_windows.height * 0.02
      anchors.left: move_1.right
      anchors.leftMargin: main_windows.height * 0.01
      visible: true

      Image
      {
        id: move_2_image
        height: move_2.height - 4
        width: move_2.width - 4
        anchors.centerIn: move_2
      }
    }

    Rectangle
    {
      id: move_3
      height: height_define_2
      width: move_3.height
      color: "white"
      border.width: 4
      border.color: "blue"
      anchors.bottom: main_windows.bottom
      anchors.bottomMargin: main_windows.height * 0.02
      anchors.left: move_2.right
      anchors.leftMargin: main_windows.height * 0.01
      visible: true

      Image
      {
        id: move_3_image
        height: move_3.height - 4
        width: move_3.width - 4
        anchors.centerIn: move_3
      }
    }

    Rectangle
    {
      id: move_4
      height: height_define_2
      width: move_4.height
      color: "white"
      border.width: 4
      border.color: "blue"
      anchors.bottom: main_windows.bottom
      anchors.bottomMargin: main_windows.height * 0.02
      anchors.left: move_3.right
      anchors.leftMargin: main_windows.height * 0.01
      visible: true

      Image
      {
        id: move_4_image
        height: move_4.height - 4
        width: move_4.width - 4
        anchors.centerIn: move_4
      }
    }

    Rectangle
    {
      id: move_5
      height: height_define_2
      width: move_5.height
      color: "white"
      border.width: 4
      border.color: "blue"
      anchors.bottom: main_windows.bottom
      anchors.bottomMargin: main_windows.height * 0.02
      anchors.left: move_4.right
      anchors.leftMargin: main_windows.height * 0.01
      visible: true

      Image
      {
        id: move_5_image
        height: move_5.height - 4
        width: move_5.width - 4
        anchors.centerIn: move_5
      }
    }

    Rectangle
    {
      id: move_6
      height: height_define_2
      width: move_6.height
      color: "white"
      border.width: 4
      border.color: "blue"
      anchors.bottom: main_windows.bottom
      anchors.bottomMargin: main_windows.height * 0.02
      anchors.left: move_5.right
      anchors.leftMargin: main_windows.height * 0.01
      visible: true

      Image
      {
        id: move_6_image
        height: move_6.height - 4
        width: move_6.width - 4
        anchors.centerIn: move_6
      }
    }

    Rectangle
    {
      id: move_7
      height: height_define_2
      width: move_7.height
      color: "white"
      border.width: 4
      border.color: "blue"
      anchors.bottom: main_windows.bottom
      anchors.bottomMargin: main_windows.height * 0.02
      anchors.left: move_6.right
      anchors.leftMargin: main_windows.height * 0.01
      visible: true

      Image
      {
        id: move_7_image
        height: move_7.height - 4
        width: move_7.width - 4
        anchors.centerIn: move_7
      }
    }

    Rectangle
    {
      id: move_8
      height: height_define_2
      width: move_8.height
      color: "white"
      border.width: 4
      border.color: "blue"
      anchors.bottom: main_windows.bottom
      anchors.bottomMargin: main_windows.height * 0.02
      anchors.left: move_7.right
      anchors.leftMargin: main_windows.height * 0.01
      visible: true

      Image
      {
        id: move_8_image
        height: move_8.height - 4
        width: move_8.width - 4
        anchors.centerIn: move_8
      }
    }

    Rectangle
    {
      id: move_9
      height: height_define_2
      width: move_9.height
      color: "white"
      border.width: 4
      border.color: "blue"
      anchors.bottom: main_windows.bottom
      anchors.bottomMargin: main_windows.height * 0.02
      anchors.left: move_8.right
      anchors.leftMargin: main_windows.height * 0.01
      visible: true

      Image
      {
        id: move_9_image
        height: move_9.height - 4
        width: move_9.width - 4
        anchors.centerIn: move_9
      }
    }

    Rectangle
    {
      id: move_10
      height: height_define_2
      width: move_10.height
      color: "white"
      border.width: 4
      border.color: "blue"
      anchors.bottom: main_windows.bottom
      anchors.bottomMargin: main_windows.height * 0.02
      anchors.left: move_9.right
      anchors.leftMargin: main_windows.height * 0.01
      visible: true

      Image
      {
        id: move_10_image
        height: move_10.height - 4
        width: move_10.width - 4
        anchors.centerIn: move_10
      }
    }

    Rectangle
    {
      id: move_11
      height: height_define_2
      width: move_11.height
      color: "white"
      border.width: 4
      border.color: "blue"
      anchors.bottom: main_windows.bottom
      anchors.bottomMargin: main_windows.height * 0.02
      anchors.left: move_10.right
      anchors.leftMargin: main_windows.height * 0.01
      visible: true

      Image
      {
        id: move_11_image
        height: move_11.height - 4
        width: move_11.width - 4
        anchors.centerIn: move_11
      }
    }

    Rectangle
    {
      id: move_12
      height: height_define_2
      width: move_12.height
      color: "white"
      border.width: 4
      border.color: "blue"
      anchors.bottom: main_windows.bottom
      anchors.bottomMargin: main_windows.height * 0.02
      anchors.left: move_11.right
      anchors.leftMargin: main_windows.height * 0.01
      visible: true

      Image
      {
        id: move_12_image
        height: move_12.height - 4
        width: move_12.width - 4
        anchors.centerIn: move_12
      }
    }
    ///end //модуль очередности хода
    
    ///главное меню с ходом и магией
    Image
    {
      id: main_menu
      height: main_windows.height * 0.2
      width: main_menu.height
      anchors.bottom: main_windows.bottom
      anchors.bottomMargin: main_windows.height * 0.01
      anchors.right: main_windows.right
      anchors.rightMargin: main_windows.height * 0.01
      source: "file:///" + applicationDirPath + "/image/battle/curcle.png";
      
      Image
      {
          id: taem
          height: main_menu.height * 0.5
          width: main_menu.width * 0.5
          anchors.centerIn: main_menu
          source: "file:///" + applicationDirPath + "/image/battle/blue_glossy.png";

          MouseArea
          {
              anchors.fill: parent
              hoverEnabled: true

              onHoveredChanged:
              {
                  taem.source = "file:///" + applicationDirPath + "/image/battle/blue_glossy_green.png";
              }
              onExited:
              {
                  taem.source = "file:///" + applicationDirPath + "/image/battle/blue_glossy.png";
              }
          }
      }

      Image
      {
        id: magic
        height: main_menu.height * 0.35
        width: magic.height
        anchors.left: main_menu.left
        anchors.top: main_menu.top
        source: "file:///" + applicationDirPath + "/image/battle/book.png";

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true

            onHoveredChanged:
            {
                magic.source = "file:///" + applicationDirPath + "/image/battle/book_green.png";
            }
            onExited:
            {
                magic.source = "file:///" + applicationDirPath + "/image/battle/book.png";
            }
        }
      }
    }
    ///end //главное меню с ходом и магией
    
    ///главное поле боя (составные элементы)
    ///
    ///pos_1_1 - pos_1_2 || pos_2_1 - pos_2_2
    ///pos_1_3 - pos_1_4 || pos_2_3 - pos_2_4
    ///pos_1_5 - pos_1_6 || pos_2_5 - pos_2_6

    Rectangle
    {
        id: rect_pos_1_2
        height: main_windows.height * 0.16
        width: rect_pos_1_2.height
        anchors.top: main_windows.top
        anchors.topMargin: main_windows.height * 0.1
        anchors.right: main_windows.horizontalCenter
        anchors.rightMargin: main_windows.width * 0.03
        color: "black"

        RectangularGlow
        {
            id: effect_pos_1_2
            anchors.fill: rect_pos_1_2
            glowRadius: 10
            spread: 0.2
            color: "blue"
        }

        Image
        {
            id: pos_1_2
            height: parent.height
            width: parent.width
            anchors.centerIn: rect_pos_1_2
            source: "file:///" + applicationDirPath + "/image/battle/black.jpg";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onHoveredChanged:
                {
                    if(life_pos_1_2.visible === false)
                        return;

                    repaint_select_mouse(1,0);
                    select_move(1,0);
                    x_hover = 1;
                    y_hover = 0;
                }
                onExited:
                {
                    repaint_select_disable_mouse(1,0);
                    disable_select_move();
                    x_hover = -1;
                    y_hover = -1;
                }
                onPressedChanged:
                {
                    if(pressed === true)
                    {
                        if(pressedButtons === Qt.LeftButton)
                        {
                            if(lock === true) return;
                            if(can_damage(1,0) === true)
                                attack(1,0,"");
                        }
                        else if(pressedButtons === Qt.RightButton)
                        {
                            if(pos_1_2.source != "file:///" + applicationDirPath + "/image/battle/black.jpg"){
                                image_otrad_right.source = pos_1_2.source;
                                property_right.parsing_full_version(1,0);
                                show_characteristic_right.visible = true;
                            }
                        }
                    }
                    else
                        show_characteristic_right.visible = false;
                }
            }//MouseArea
        }//Image

        Image
        {
            id: pos_1_2_backgrounde
            width: pos_1_2.width
            height: pos_1_2.height
            anchors.centerIn: pos_1_2
            visible: false

            NumberAnimation on opacity
            {
                id: pos_1_2_animation
                from:0.1
                to: 1
                duration: 1000

                onStopped:
                {
                    if(mode === 1)
                    {
                        if(massiv_kill[1] === 1) //юнит умер
                        {
                            pos_1_2_backgrounde_text.visible = false;
                            pos_1_2_backgrounde.source = "file:///" + applicationDirPath + "/image/battle/sherep.jpg";
                            massiv_kill[1] = 2;
                            disable_life_pos_1_2();
                            pos_1_2.source = "file:///" + applicationDirPath + "/image/battle/black.jpg";
                            effect_pos_1_2.color = "blue";
                            pos_1_2_animation.restart();
                            return;
                        }
                        else if(massiv_kill[1] === 2) //продолжение обработки смерти
                        {
                            update_oshered_hodov();
                            who_win();
                        }

                        pos_1_2_backgrounde_text.visible = false;
                        pos_1_2_backgrounde.visible = false;
                        perehod_hoda();
                    }
                    else if(mode === 0)
                    {
                        pos_1_2_backgrounde_text.visible = false;
                        pos_1_2_backgrounde.visible = false;
                        if(massiv_effect[0] === 1)
                            perehod_hoda();
                    }
                }//onStopped
            }
        }

        Text
        {
            id: pos_1_2_backgrounde_text
            width: pos_1_2_backgrounde.width
            height: pos_1_2_backgrounde.height
            anchors.centerIn: pos_1_2_backgrounde
            color:"white"
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
            fontSizeMode: Text.Fit
            minimumPointSize: 10
            visible: false
        }

        Rectangle
        {
            id: life_pos_1_2
            height: rect_pos_1_2.height * 0.225
            anchors.left: rect_pos_1_2.left
            anchors.right: rect_pos_1_2.right
            anchors.top: rect_pos_1_2.bottom
            anchors.topMargin: main_windows.height * 0.01
            color: "black"
            border.width: width_border
            border.color: "white"
        }

        Image
        {
            id: image_life_pos_1_2
            height: life_pos_1_2.height - (width_border * 2)
            width: image_life_pos_1_2.height
            anchors.left: rect_pos_1_2.left
            anchors.leftMargin: width_border
            anchors.top: life_pos_1_2.top
            anchors.topMargin: width_border
            source: "file:///" + applicationDirPath + "/image/battle/life.png";
        }

        Rectangle
        {
            id: real_life_pos_1_2
            width: life_pos_1_2.width - image_life_pos_1_2.width - (width_border * 2)
            height: life_pos_1_2.height - (width_border * 2)
            anchors.left: image_life_pos_1_2.right
            anchors.verticalCenter: life_pos_1_2.verticalCenter
            color: "green"

            Behavior on width
            {
                NumberAnimation { duration: 1000 }
            }
        }

        Text
        {
            id: text_real_life_pos_1_2
            width: life_pos_1_2.width - image_life_pos_1_2.width
            height: life_pos_1_2.height * 0.05
            anchors.left: image_life_pos_1_2.right
            anchors.right: life_pos_1_2.right
            anchors.verticalCenter: life_pos_1_2.verticalCenter
            color:"white"
            text:qsTr("")
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            fontSizeMode: Text.Fit
            minimumPointSize: 10
        }
    }

    Rectangle
    {
        id: rect_pos_1_1
        height: main_windows.height * 0.16
        width: rect_pos_1_1.height
        anchors.top: main_windows.top
        anchors.topMargin: main_windows.height * 0.1
        anchors.right: rect_pos_1_2.left
        anchors.rightMargin: main_windows.width * 0.05
        color: "black"

        RectangularGlow
        {
            id: effect_pos_1_1
            anchors.fill: rect_pos_1_1
            glowRadius: 10
            spread: 0.2
            color: "blue"
        }

        Image
        {
            id: pos_1_1
            height: parent.height
            width: parent.width
            anchors.centerIn: rect_pos_1_1
            source: "file:///" + applicationDirPath + "/image/battle/black.jpg";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onHoveredChanged:
                {
                    if(life_pos_1_1.visible === false)
                        return;

                    repaint_select_mouse(0,0);
                    select_move(0,0);
                    x_hover = 0;
                    y_hover = 0;
                }
                onExited:
                {
                    repaint_select_disable_mouse(0,0);
                    disable_select_move();
                    x_hover = -1;
                    y_hover = -1;
                }
                onPressedChanged:
                {
                    if(pressed === true)
                    {
                        if(pressedButtons === Qt.LeftButton)
                        {
                            if(lock === true) return;
                            if(can_damage(0,0) === true)
                                attack(0,0,"");
                        }
                        else if(pressedButtons === Qt.RightButton)
                        {
                            if(pos_1_1.source != "file:///" + applicationDirPath + "/image/battle/black.jpg"){
                                image_otrad_right.source = pos_1_1.source;
                                property_right.parsing_full_version(0,0);
                                show_characteristic_right.visible = true;
                            }
                        }
                    }
                    else
                        show_characteristic_right.visible = false;
                }
            }
        }

        Image
        {
            id: pos_1_1_backgrounde
            width: pos_1_1.width
            height: pos_1_1.height
            anchors.centerIn: pos_1_1
            visible: false

            NumberAnimation on opacity
            {
                id: pos_1_1_animation
                from:0.1
                to: 1
                duration: 1000

                onStopped:
                {
                    if(mode === 1)
                    {
                        if(massiv_kill[0] === 1)
                        {
                            pos_1_1_backgrounde_text.visible = false;
                            pos_1_1_backgrounde.source = "file:///" + applicationDirPath + "/image/battle/sherep.jpg";
                            massiv_kill[0] = 2;
                            disable_life_pos_1_1();
                            pos_1_1.source = "file:///" + applicationDirPath + "/image/battle/black.jpg";
                            effect_pos_1_1.color = "blue";
                            pos_1_1_animation.restart();
                            return;
                        }
                        else if(massiv_kill[0] === 2)
                        {
                            update_oshered_hodov();
                            who_win();
                        }

                        pos_1_1_backgrounde_text.visible = false;
                        pos_1_1_backgrounde.visible = false;
                        perehod_hoda();
                    }
                    else if(mode === 0)
                    {
                        pos_1_1_backgrounde_text.visible = false;
                        pos_1_1_backgrounde.visible = false;
                        if(massiv_effect[0] === 1)
                            perehod_hoda();
                    }
                }//onStopped
            }
        }

        Text
        {
            id: pos_1_1_backgrounde_text
            width: pos_1_1_backgrounde.width
            height: pos_1_1_backgrounde.height
            anchors.centerIn: pos_1_1_backgrounde
            color:"white"
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
            fontSizeMode: Text.Fit
            minimumPointSize: 10
            visible: false
        }

        Rectangle
        {
            id: life_pos_1_1
            height: rect_pos_1_1.height * 0.225
            anchors.left: rect_pos_1_1.left
            anchors.right: rect_pos_1_1.right
            anchors.top: rect_pos_1_1.bottom
            anchors.topMargin: main_windows.height * 0.01
            color: "black"
            border.width: width_border
            border.color: "white"
        }

        Image
        {
            id: image_life_pos_1_1
            height: life_pos_1_1.height - (width_border * 2)
            width: image_life_pos_1_1.height
            anchors.left: rect_pos_1_1.left
            anchors.leftMargin: width_border
            anchors.top: life_pos_1_1.top
            anchors.topMargin: width_border
            source: "file:///" + applicationDirPath + "/image/battle/life.png";
        }

        Rectangle
        {
            id: real_life_pos_1_1
            width: life_pos_1_1.width - image_life_pos_1_1.width - (width_border * 2)
            height: life_pos_1_1.height - (width_border * 2)
            anchors.left: image_life_pos_1_1.right
            anchors.verticalCenter: life_pos_1_1.verticalCenter
            color: "green"

            Behavior on width
            {
                NumberAnimation { duration: 1000 }
            }
        }

        Text
        {
            id: text_real_life_pos_1_1
            width: life_pos_1_1.width - image_life_pos_1_1.width
            height: life_pos_1_1.height * 0.05
            anchors.left: image_life_pos_1_1.right
            anchors.right: life_pos_1_1.right
            anchors.verticalCenter: life_pos_1_1.verticalCenter
            color:"white"
            text:qsTr("")
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            fontSizeMode: Text.Fit
            minimumPointSize: 10
        }
    }

    Rectangle
    {
        id: rect_pos_1_4
        height: main_windows.height * 0.16
        width: rect_pos_1_4.height
        anchors.top: rect_pos_1_2.bottom
        anchors.topMargin: main_windows.height * 0.1
        anchors.right: main_windows.horizontalCenter
        anchors.rightMargin: main_windows.width * 0.03

        RectangularGlow
        {
            id: effect_pos_1_4
            anchors.fill: rect_pos_1_4
            glowRadius: 10
            spread: 0.2
            color: "blue"
        }

        Image
        {
            id: pos_1_4
            height: parent.height
            width: parent.width
            anchors.centerIn: rect_pos_1_4
            source: "file:///" + applicationDirPath + "/image/battle/black.jpg";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onHoveredChanged:
                {
                    if(life_pos_1_4.visible === false)
                        return;

                    repaint_select_mouse(1,1);
                    select_move(1,1);
                    x_hover = 1;
                    y_hover = 1;
                }
                onExited:
                {
                    repaint_select_disable_mouse(1,1);
                    disable_select_move();
                    x_hover = -1;
                    y_hover = -1;
                }
                onPressedChanged:
                {
                    if(pressed === true)
                    {
                        if(pressedButtons === Qt.LeftButton)
                        {
                            if(lock === true) return;
                            if(can_damage(1,1) === true)
                                attack(1,1,"");
                        }
                        else if(pressedButtons === Qt.RightButton)
                        {
                            if(pos_1_4.source != "file:///" + applicationDirPath + "/image/battle/black.jpg"){
                                image_otrad_right.source = pos_1_4.source;
                                property_right.parsing_full_version(1,1);
                                show_characteristic_right.visible = true;
                            }
                        }
                    }
                    else
                        show_characteristic_right.visible = false;
                }
            }
        }

        Image
        {
            id: pos_1_4_backgrounde
            width: pos_1_4.width
            height: pos_1_4.height
            anchors.centerIn: pos_1_4
            visible: false

            NumberAnimation on opacity
            {
                id: pos_1_4_animation
                from:0.1
                to: 1
                duration: 1000

                onStopped:
                {
                    if(mode === 1)
                    {
                        if(massiv_kill[3] === 1)
                        {
                            pos_1_4_backgrounde_text.visible = false;
                            pos_1_4_backgrounde.source = "file:///" + applicationDirPath + "/image/battle/sherep.jpg";
                            massiv_kill[3] = 2;
                            disable_life_pos_1_4();
                            pos_1_4.source = "file:///" + applicationDirPath + "/image/battle/black.jpg";
                            effect_pos_1_4.color = "blue";
                            pos_1_4_animation.restart();
                            return;
                        }
                        else if(massiv_kill[3] === 2)
                        {
                            update_oshered_hodov();
                            who_win();
                        }

                        pos_1_4_backgrounde_text.visible = false;
                        pos_1_4_backgrounde.visible = false;
                        perehod_hoda();
                    }
                    else if(mode === 0)
                    {
                        pos_1_4_backgrounde_text.visible = false;
                        pos_1_4_backgrounde.visible = false;
                        if(massiv_effect[0] === 1)
                            perehod_hoda();
                    }
                }//onStopped
            }
        }

        Text
        {
            id: pos_1_4_backgrounde_text
            width: pos_1_4_backgrounde.width
            height: pos_1_4_backgrounde.height
            anchors.centerIn: pos_1_4_backgrounde
            color:"white"
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
            fontSizeMode: Text.Fit
            minimumPointSize: 10
            visible: false
        }

        Rectangle
        {
            id: life_pos_1_4
            height: rect_pos_1_4.height * 0.225
            anchors.left: rect_pos_1_4.left
            anchors.right: rect_pos_1_4.right
            anchors.top: rect_pos_1_4.bottom
            anchors.topMargin: main_windows.height * 0.01
            color: "black"
            border.width: width_border
            border.color: "white"
        }

        Image
        {
            id: image_life_pos_1_4
            height: life_pos_1_4.height - (width_border * 2)
            width: image_life_pos_1_4.height
            anchors.left: rect_pos_1_4.left
            anchors.leftMargin: width_border
            anchors.top: life_pos_1_4.top
            anchors.topMargin: width_border
            source: "file:///" + applicationDirPath + "/image/battle/life.png";
        }

        Rectangle
        {
            id: real_life_pos_1_4
            width: life_pos_1_4.width - image_life_pos_1_4.width - (width_border * 2)
            height: life_pos_1_4.height - (width_border * 2)
            anchors.left: image_life_pos_1_4.right
            anchors.verticalCenter: life_pos_1_4.verticalCenter
            color: "green"

            Behavior on width
            {
                NumberAnimation { duration: 1000 }
            }
        }

        Text
        {
            id: text_real_life_pos_1_4
            width: life_pos_1_4.width - image_life_pos_1_4.width
            height: life_pos_1_4.height * 0.05
            anchors.left: image_life_pos_1_4.right
            anchors.right: life_pos_1_4.right
            anchors.verticalCenter: life_pos_1_4.verticalCenter
            color:"white"
            text:qsTr("")
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            fontSizeMode: Text.Fit
            minimumPointSize: 10
        }
    }

    Rectangle
    {
        id: rect_pos_1_3
        height: main_windows.height * 0.16
        width: rect_pos_1_3.height
        anchors.top: rect_pos_1_1.bottom
        anchors.topMargin: main_windows.height * 0.1
        anchors.right: rect_pos_1_4.left
        anchors.rightMargin: main_windows.width * 0.05

        RectangularGlow
        {
            id: effect_pos_1_3
            anchors.fill: rect_pos_1_3
            glowRadius: 10
            spread: 0.2
            color: "blue"
        }

        Image
        {
            id: pos_1_3
            height: parent.height
            width: parent.width
            anchors.centerIn: rect_pos_1_3
            source: "file:///" + applicationDirPath + "/image/battle/black.jpg";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onHoveredChanged:
                {
                    if(life_pos_1_3.visible === false)
                        return;

                    repaint_select_mouse(0,1);
                    select_move(0,1);
                    x_hover = 0;
                    y_hover = 1;
                }
                onExited:
                {
                    repaint_select_disable_mouse(0,1);
                    disable_select_move();
                    x_hover = -1;
                    y_hover = -1;
                }
                onPressedChanged:
                {
                    if(pressed === true)
                    {
                        if(pressedButtons === Qt.LeftButton)
                        {
                            if(lock === true) return;
                            if(can_damage(0,1) === true)
                                attack(0,1,"");
                        }
                        else if(pressedButtons === Qt.RightButton)
                        {
                            if(pos_1_3.source != "file:///" + applicationDirPath + "/image/battle/black.jpg"){
                                image_otrad_right.source = pos_1_3.source;
                                property_right.parsing_full_version(0,1);
                                show_characteristic_right.visible = true;
                            }
                        }
                    }
                    else
                        show_characteristic_right.visible = false;
                }
            }
        }

        Image
        {
            id: pos_1_3_backgrounde
            width: pos_1_3.width
            height: pos_1_3.height
            anchors.centerIn: pos_1_3
            visible: false

            NumberAnimation on opacity
            {
                id: pos_1_3_animation
                from:0.1
                to: 1
                duration: 1000

                onStopped:
                {
                    if(mode === 1)
                    {
                        if(massiv_kill[2] === 1)
                        {
                            pos_1_3_backgrounde_text.visible = false;
                            pos_1_3_backgrounde.source = "file:///" + applicationDirPath + "/image/battle/sherep.jpg";
                            massiv_kill[2] = 2;
                            disable_life_pos_1_3();
                            pos_1_3.source = "file:///" + applicationDirPath + "/image/battle/black.jpg";
                            effect_pos_1_3.color = "blue";
                            pos_1_3_animation.restart();
                            return;
                        }
                        else if(massiv_kill[2] === 2)
                        {
                            update_oshered_hodov();
                            who_win();
                        }

                        pos_1_3_backgrounde_text.visible = false;
                        pos_1_3_backgrounde.visible = false;
                        perehod_hoda();
                    }
                    else if(mode === 0)
                    {
                        pos_1_3_backgrounde_text.visible = false;
                        pos_1_3_backgrounde.visible = false;
                        if(massiv_effect[0] === 1)
                            perehod_hoda();
                    }
                }//onStopped
            }
        }

        Text
        {
            id: pos_1_3_backgrounde_text
            width: pos_1_3_backgrounde.width
            height: pos_1_3_backgrounde.height
            anchors.centerIn: pos_1_3_backgrounde
            color:"white"
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
            fontSizeMode: Text.Fit
            minimumPointSize: 10
            visible: false
        }

        Rectangle
        {
            id: life_pos_1_3
            height: rect_pos_1_3.height * 0.225
            anchors.left: rect_pos_1_3.left
            anchors.right: rect_pos_1_3.right
            anchors.top: rect_pos_1_3.bottom
            anchors.topMargin: main_windows.height * 0.01
            color: "black"
            border.width: width_border
            border.color: "white"
        }

        Image
        {
            id: image_life_pos_1_3
            height: life_pos_1_3.height - (width_border * 2)
            width: image_life_pos_1_3.height
            anchors.left: rect_pos_1_3.left
            anchors.leftMargin: width_border
            anchors.top: life_pos_1_3.top
            anchors.topMargin: width_border
            source: "file:///" + applicationDirPath + "/image/battle/life.png";
        }

        Rectangle
        {
            id: real_life_pos_1_3
            width: life_pos_1_3.width - image_life_pos_1_3.width - (width_border * 2)
            height: life_pos_1_3.height - (width_border * 2)
            anchors.left: image_life_pos_1_3.right
            anchors.verticalCenter: life_pos_1_3.verticalCenter
            color: "green"

            Behavior on width
            {
                NumberAnimation { duration: 1000 }
            }
        }

        Text
        {
            id: text_real_life_pos_1_3
            width: life_pos_1_3.width - image_life_pos_1_3.width
            height: life_pos_1_3.height * 0.05
            anchors.left: image_life_pos_1_3.right
            anchors.right: life_pos_1_3.right
            anchors.verticalCenter: life_pos_1_3.verticalCenter
            color:"white"
            text:qsTr("")
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            fontSizeMode: Text.Fit
            minimumPointSize: 10
        }
    }

    Rectangle
    {
        id: rect_pos_1_6
        height: main_windows.height * 0.16
        width: rect_pos_1_6.height
        anchors.top: rect_pos_1_4.bottom
        anchors.topMargin: main_windows.height * 0.1
        anchors.right: main_windows.horizontalCenter
        anchors.rightMargin: main_windows.width * 0.03

        RectangularGlow
        {
            id: effect_pos_1_6
            anchors.fill: rect_pos_1_6
            glowRadius: 10
            spread: 0.2
            color: "blue"
        }

        Image
        {
            id: pos_1_6
            height: parent.height
            width: parent.width
            anchors.centerIn: rect_pos_1_6
            source: "file:///" + applicationDirPath + "/image/battle/black.jpg";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onHoveredChanged:
                {
                    if(life_pos_1_6.visible === false)
                        return;

                    repaint_select_mouse(1,2);
                    select_move(1,2);
                    x_hover = 1;
                    y_hover = 2;
                }
                onExited:
                {
                    repaint_select_disable_mouse(1,2);
                    disable_select_move();
                    x_hover = -1;
                    y_hover = -1;
                }
                onPressedChanged:
                {
                    if(pressed === true)
                    {
                        if(pressedButtons === Qt.LeftButton)
                        {
                            if(lock === true) return;
                            if(can_damage(1,2) === true)
                                attack(1,2,"");
                        }
                        else if(pressedButtons === Qt.RightButton)
                        {
                            if(pos_1_6.source != "file:///" + applicationDirPath + "/image/battle/black.jpg"){
                                image_otrad_right.source = pos_1_6.source;
                                property_right.parsing_full_version(1,2);
                                show_characteristic_right.visible = true;
                            }
                        }
                    }
                    else
                        show_characteristic_right.visible = false;
                }
            }
        }

        Image
        {
            id: pos_1_6_backgrounde
            width: pos_1_6.width
            height: pos_1_6.height
            anchors.centerIn: pos_1_6
            visible: false

            NumberAnimation on opacity
            {
                id: pos_1_6_animation
                from:0.1
                to: 1
                duration: 1000

                onStopped:
                {
                    if(mode === 1)
                    {
                        if(massiv_kill[5] === 1)
                        {
                            pos_1_6_backgrounde_text.visible = false;
                            pos_1_6_backgrounde.source = "file:///" + applicationDirPath + "/image/battle/sherep.jpg";
                            massiv_kill[5] = 2;
                            disable_life_pos_1_6();
                            pos_1_6.source = "file:///" + applicationDirPath + "/image/battle/black.jpg";
                            effect_pos_1_6.color = "blue";
                            pos_1_6_animation.restart();
                            return;
                        }
                        else if(massiv_kill[5] === 2)
                        {
                            update_oshered_hodov();
                            who_win();
                        }

                        pos_1_6_backgrounde_text.visible = false;
                        pos_1_6_backgrounde.visible = false;
                        perehod_hoda();
                    }
                    else if(mode === 0)
                    {
                        pos_1_6_backgrounde_text.visible = false;
                        pos_1_6_backgrounde.visible = false;
                        if(massiv_effect[0] === 1)
                            perehod_hoda();
                    }
                }//onStopped
            }
        }

        Text
        {
            id: pos_1_6_backgrounde_text
            width: pos_1_6_backgrounde.width
            height: pos_1_6_backgrounde.height
            anchors.centerIn: pos_1_6_backgrounde
            color:"white"
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
            fontSizeMode: Text.Fit
            minimumPointSize: 10
            visible: false
        }

        Rectangle
        {
            id: life_pos_1_6
            height: rect_pos_1_6.height * 0.225
            anchors.left: rect_pos_1_6.left
            anchors.right: rect_pos_1_6.right
            anchors.top: rect_pos_1_6.bottom
            anchors.topMargin: main_windows.height * 0.01
            color: "black"
            border.width: width_border
            border.color: "white"
        }

        Image
        {
            id: image_life_pos_1_6
            height: life_pos_1_6.height - (width_border * 2)
            width: image_life_pos_1_6.height
            anchors.left: rect_pos_1_6.left
            anchors.leftMargin: width_border
            anchors.top: life_pos_1_6.top
            anchors.topMargin: width_border
            source: "file:///" + applicationDirPath + "/image/battle/life.png";
        }

        Rectangle
        {
            id: real_life_pos_1_6
            width: life_pos_1_6.width - image_life_pos_1_6.width - (width_border * 2)
            height: life_pos_1_6.height - (width_border * 2)
            anchors.left: image_life_pos_1_6.right
            anchors.verticalCenter: life_pos_1_6.verticalCenter
            color: "green"

            Behavior on width
            {
                NumberAnimation { duration: 1000 }
            }
        }

        Text
        {
            id: text_real_life_pos_1_6
            width: life_pos_1_6.width - image_life_pos_1_6.width
            height: life_pos_1_6.height * 0.05
            anchors.left: image_life_pos_1_6.right
            anchors.right: life_pos_1_6.right
            anchors.verticalCenter: life_pos_1_6.verticalCenter
            color:"white"
            text:qsTr("")
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            fontSizeMode: Text.Fit
            minimumPointSize: 10
        }
    }
    
    Rectangle
    {
        id: rect_pos_1_5
        height: main_windows.height * 0.16
        width: rect_pos_1_5.height
        anchors.top: rect_pos_1_3.bottom
        anchors.topMargin: main_windows.height * 0.1
        anchors.right: rect_pos_1_6.left
        anchors.rightMargin: main_windows.width * 0.05

        RectangularGlow
        {
            id: effect_pos_1_5
            anchors.fill: rect_pos_1_5
            glowRadius: 10
            spread: 0.2
            color: "blue"
        }

        Image
        {
            id: pos_1_5
            height: parent.height
            width: parent.width
            anchors.centerIn: rect_pos_1_5
            source: "file:///" + applicationDirPath + "/image/battle/black.jpg";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onHoveredChanged:
                {
                    if(life_pos_1_5.visible === false)
                        return;

                    repaint_select_mouse(0,2);
                    select_move(0,2);
                    x_hover = 0;
                    y_hover = 2;
                }
                onExited:
                {
                    repaint_select_disable_mouse(0,2);
                    disable_select_move();
                    x_hover = -1;
                    y_hover = -1;
                }
                onPressedChanged:
                {
                    if(pressed === true)
                    {
                        if(pressedButtons === Qt.LeftButton)
                        {
                            if(lock === true) return;
                            if(can_damage(0,2) === true)
                                attack(0,2,"");
                        }
                        else if(pressedButtons === Qt.RightButton)
                        {
                            if(pos_1_5.source != "file:///" + applicationDirPath + "/image/battle/black.jpg"){
                                image_otrad_right.source = pos_1_5.source;
                                property_right.parsing_full_version(0,2);
                                show_characteristic_right.visible = true;
                            }
                        }
                    }
                    else
                        show_characteristic_right.visible = false;
                }
            }
        }

        Image
        {
            id: pos_1_5_backgrounde
            width: pos_1_5.width
            height: pos_1_5.height
            anchors.centerIn: pos_1_5
            visible: false

            NumberAnimation on opacity
            {
                id: pos_1_5_animation
                from:0.1
                to: 1
                duration: 1000

                onStopped:
                {
                    if(mode === 1)
                    {
                        if(massiv_kill[4] === 1)
                        {
                            pos_1_5_backgrounde_text.visible = false;
                            pos_1_5_backgrounde.source = "file:///" + applicationDirPath + "/image/battle/sherep.jpg";
                            massiv_kill[4] = 2;
                            disable_life_pos_1_5();
                            pos_1_5.source = "file:///" + applicationDirPath + "/image/battle/black.jpg";
                            effect_pos_1_5.color = "blue";
                            pos_1_5_animation.restart();
                            return;
                        }
                        else if(massiv_kill[4] === 2)
                        {
                            update_oshered_hodov();
                            who_win();
                        }

                        pos_1_5_backgrounde_text.visible = false;
                        pos_1_5_backgrounde.visible = false;
                        perehod_hoda();
                    }
                    else if(mode === 0)
                    {
                        pos_1_5_backgrounde_text.visible = false;
                        pos_1_5_backgrounde.visible = false;
                        if(massiv_effect[0] === 1)
                            perehod_hoda();
                    }
                }
            }
        }

        Text
        {
            id: pos_1_5_backgrounde_text
            width: pos_1_5_backgrounde.width
            height: pos_1_5_backgrounde.height
            anchors.centerIn: pos_1_5_backgrounde
            color:"white"
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
            fontSizeMode: Text.Fit
            minimumPointSize: 10
            visible: false
        }

        Rectangle
        {
            id: life_pos_1_5
            height: rect_pos_1_5.height * 0.225
            anchors.left: rect_pos_1_5.left
            anchors.right: rect_pos_1_5.right
            anchors.top: rect_pos_1_5.bottom
            anchors.topMargin: main_windows.height * 0.01
            color: "black"
            border.width: width_border
            border.color: "white"
        }

        Image
        {
            id: image_life_pos_1_5
            height: life_pos_1_5.height - (width_border * 2)
            width: image_life_pos_1_5.height
            anchors.left: rect_pos_1_5.left
            anchors.leftMargin: width_border
            anchors.top: life_pos_1_5.top
            anchors.topMargin: width_border
            source: "file:///" + applicationDirPath + "/image/battle/life.png";
        }

        Rectangle
        {
            id: real_life_pos_1_5
            width: life_pos_1_5.width - image_life_pos_1_5.width - (width_border * 2)
            height: life_pos_1_5.height - (width_border * 2)
            anchors.left: image_life_pos_1_5.right
            anchors.verticalCenter: life_pos_1_5.verticalCenter
            color: "green"

            Behavior on width
            {
                NumberAnimation { duration: 1000 }
            }
        }

        Text
        {
            id: text_real_life_pos_1_5
            width: life_pos_1_5.width - image_life_pos_1_5.width
            height: life_pos_1_5.height * 0.05
            anchors.left: image_life_pos_1_5.right
            anchors.right: life_pos_1_5.right
            anchors.verticalCenter: life_pos_1_5.verticalCenter
            color:"white"
            text:qsTr("")
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            fontSizeMode: Text.Fit
            minimumPointSize: 10
        }
    }

    Rectangle
    {
        id: rect_pos_2_1
        height: main_windows.height * 0.16
        width: rect_pos_2_1.height
        anchors.top: main_windows.top
        anchors.topMargin: main_windows.height * 0.1
        anchors.left: main_windows.horizontalCenter
        anchors.leftMargin: main_windows.width * 0.03

        RectangularGlow
        {
            id: effect_pos_2_1
            anchors.fill: rect_pos_2_1
            glowRadius: 10
            spread: 0.2
            color: "red"
        }

        Image
        {
            id: pos_2_1
            height: parent.height
            width: parent.width
            anchors.centerIn: rect_pos_2_1
            source: "file:///" + applicationDirPath + "/image/battle/black.jpg";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onHoveredChanged:
                {
                    if(life_pos_2_1.visible === false)
                        return;

                    repaint_select_mouse(2,0);
                    select_move(2,0);
                    x_hover = 2;
                    y_hover = 0;
                }
                onExited:
                {
                    repaint_select_disable_mouse(2,0);
                    disable_select_move();
                    x_hover = -1;
                    y_hover = -1;
                }
                onPressedChanged:
                {
                    if(pressed === true)
                    {
                        if(pressedButtons === Qt.LeftButton)
                        {
                            if(lock === true) return;
                            if(can_damage(2,0) === true)
                                attack(2,0,"");
                        }
                        else if(pressedButtons === Qt.RightButton)
                        {
                            if(pos_2_1.source != "file:///" + applicationDirPath + "/image/battle/black.jpg"){
                                image_otrad_left.source = pos_2_1.source;
                                property_left.parsing_full_version(2,0);
                                show_characteristic_left.visible = true;
                            }
                        }
                    }
                    else
                        show_characteristic_left.visible = false;
                }
            }
        }

        Image
        {
            id: pos_2_1_backgrounde
            width: pos_2_1.width
            height: pos_2_1.height
            anchors.centerIn: pos_2_1
            visible: false

            NumberAnimation on opacity
            {
                id: pos_2_1_animation
                from:0.1
                to: 1
                duration: 1000

                onStopped:
                {
                    if(mode === 1)
                    {
                        if(massiv_kill[6] === 1)
                        {
                            pos_2_1_backgrounde_text.visible = false;
                            pos_2_1_backgrounde.source = "file:///" + applicationDirPath + "/image/battle/sherep.jpg";
                            massiv_kill[6] = 2;
                            disable_life_pos_2_1();
                            pos_2_1.source = "file:///" + applicationDirPath + "/image/battle/black.jpg";
                            effect_pos_2_1.color = "red";
                            pos_2_1_animation.restart();
                            return;
                        }
                        else if(massiv_kill[6] === 2)
                        {
                            update_oshered_hodov();
                            who_win();
                        }

                        pos_2_1_backgrounde_text.visible = false;
                        pos_2_1_backgrounde.visible = false;
                        perehod_hoda();
                    }
                    else if(mode === 0)
                    {
                        pos_2_1_backgrounde_text.visible = false;
                        pos_2_1_backgrounde.visible = false;
                        if(massiv_effect[0] === 1)
                            perehod_hoda();
                    }
                }//onStopped
            }
        }

        Text
        {
            id: pos_2_1_backgrounde_text
            width: pos_2_1_backgrounde.width
            height: pos_2_1_backgrounde.height
            anchors.centerIn: pos_2_1_backgrounde
            color:"white"
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
            fontSizeMode: Text.Fit
            minimumPointSize: 10
            visible: false
        }

        Rectangle
        {
            id: life_pos_2_1
            height: rect_pos_2_1.height * 0.225
            anchors.left: rect_pos_2_1.left
            anchors.right: rect_pos_2_1.right
            anchors.top: rect_pos_2_1.bottom
            anchors.topMargin: main_windows.height * 0.01
            color: "black"
            border.width: width_border
            border.color: "white"
        }

        Image
        {
            id: image_life_pos_2_1
            height: life_pos_2_1.height - (width_border * 2)
            width: image_life_pos_2_1.height
            anchors.left: rect_pos_2_1.left
            anchors.leftMargin: width_border
            anchors.top: life_pos_2_1.top
            anchors.topMargin: width_border
            source: "file:///" + applicationDirPath + "/image/battle/life.png";
        }

        Rectangle
        {
            id: real_life_pos_2_1
            width: life_pos_2_1.width - image_life_pos_2_1.width - (width_border * 2)
            height: life_pos_2_1.height - (width_border * 2)
            anchors.left: image_life_pos_2_1.right
            anchors.verticalCenter: life_pos_2_1.verticalCenter
            color: "green"

            Behavior on width
            {
                NumberAnimation { duration: 1000 }
            }
        }

        Text
        {
            id: text_real_life_pos_2_1
            width: life_pos_2_1.width - image_life_pos_2_1.width
            height: life_pos_2_1.height * 0.05
            anchors.left: image_life_pos_2_1.right
            anchors.right: life_pos_2_1.right
            anchors.verticalCenter: life_pos_2_1.verticalCenter
            color:"white"
            text:qsTr("")
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            fontSizeMode: Text.Fit
            minimumPointSize: 10
        }
    }

    Rectangle
    {
        id: rect_pos_2_2
        height: main_windows.height * 0.16
        width: rect_pos_2_2.height
        anchors.top: main_windows.top
        anchors.topMargin: main_windows.height * 0.1
        anchors.left: rect_pos_2_1.right
        anchors.leftMargin: main_windows.width * 0.05

        RectangularGlow
        {
            id: effect_pos_2_2
            anchors.fill: rect_pos_2_2
            glowRadius: 10
            spread: 0.2
            color: "red"
        }

        Image
        {
            id: pos_2_2
            height: parent.height
            width: parent.width
            anchors.centerIn: rect_pos_2_2
            source: "file:///" + applicationDirPath + "/image/battle/black.jpg";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onHoveredChanged:
                {
                    if(life_pos_2_2.visible === false)
                        return;

                    repaint_select_mouse(3,0);
                    select_move(3,0);
                    x_hover = 3;
                    y_hover = 0;
                }
                onExited:
                {
                    repaint_select_disable_mouse(3,0);
                    disable_select_move();
                    x_hover = -1;
                    y_hover = -1;
                }
                onPressedChanged:
                {
                    if(pressed === true)
                    {
                        if(pressedButtons === Qt.LeftButton)
                        {
                            if(lock === true) return;
                            if(can_damage(3,0) === true)
                                attack(3,0,"");
                        }
                        else if(pressedButtons === Qt.RightButton)
                        {
                            if(pos_2_2.source != "file:///" + applicationDirPath + "/image/battle/black.jpg"){
                                image_otrad_left.source = pos_2_2.source;
                                property_left.parsing_full_version(3,0);
                                show_characteristic_left.visible = true;
                            }
                        }
                    }
                    else
                        show_characteristic_left.visible = false;
                }
            }
        }

        Image
        {
            id: pos_2_2_backgrounde
            width: pos_2_2.width
            height: pos_2_2.height
            anchors.centerIn: pos_2_2
            visible: false

            NumberAnimation on opacity
            {
                id: pos_2_2_animation
                from:0.1
                to: 1
                duration: 1000

                onStopped:
                {
                    if(mode === 1)
                    {
                        if(massiv_kill[7] === 1)
                        {
                            pos_2_2_backgrounde_text.visible = false;
                            pos_2_2_backgrounde.source = "file:///" + applicationDirPath + "/image/battle/sherep.jpg";
                            massiv_kill[7] = 2;
                            disable_life_pos_2_2();
                            pos_2_2.source = "file:///" + applicationDirPath + "/image/battle/black.jpg";
                            effect_pos_2_2.color = "red";
                            pos_2_2_animation.restart();
                            return;
                        }
                        else if(massiv_kill[7] === 2)
                        {
                            update_oshered_hodov();
                            who_win();
                        }

                        pos_2_2_backgrounde_text.visible = false;
                        pos_2_2_backgrounde.visible = false;
                        perehod_hoda();
                    }
                    else if(mode === 0)
                    {
                        pos_2_2_backgrounde_text.visible = false;
                        pos_2_2_backgrounde.visible = false;
                        if(massiv_effect[0] === 1)
                            perehod_hoda();
                    }
                }//onStopped
            }
        }

        Text
        {
            id: pos_2_2_backgrounde_text
            width: pos_2_2_backgrounde.width
            height: pos_2_2_backgrounde.height
            anchors.centerIn: pos_2_2_backgrounde
            color:"white"
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
            fontSizeMode: Text.Fit
            minimumPointSize: 10
            visible: false
        }

        Rectangle
        {
            id: life_pos_2_2
            height: rect_pos_2_2.height * 0.225
            anchors.left: rect_pos_2_2.left
            anchors.right: rect_pos_2_2.right
            anchors.top: rect_pos_2_2.bottom
            anchors.topMargin: main_windows.height * 0.01
            color: "black"
            border.width: width_border
            border.color: "white"
        }

        Image
        {
            id: image_life_pos_2_2
            height: life_pos_2_2.height - (width_border * 2)
            width: image_life_pos_2_2.height
            anchors.left: rect_pos_2_2.left
            anchors.leftMargin: width_border
            anchors.top: life_pos_2_2.top
            anchors.topMargin: width_border
            source: "file:///" + applicationDirPath + "/image/battle/life.png";
        }

        Rectangle
        {
            id: real_life_pos_2_2
            width: life_pos_2_2.width - image_life_pos_2_2.width - (width_border * 2)
            height: life_pos_2_2.height - (width_border * 2)
            anchors.left: image_life_pos_2_2.right
            anchors.verticalCenter: life_pos_2_2.verticalCenter
            color: "green"

            Behavior on width
            {
                NumberAnimation { duration: 1000 }
            }
        }

        Text
        {
            id: text_real_life_pos_2_2
            width: life_pos_2_2.width - image_life_pos_2_2.width
            height: life_pos_2_2.height * 0.05
            anchors.left: image_life_pos_2_2.right
            anchors.right: life_pos_2_2.right
            anchors.verticalCenter: life_pos_2_2.verticalCenter
            color:"white"
            text:qsTr("")
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            fontSizeMode: Text.Fit
            minimumPointSize: 10
        }
    }

    Rectangle
    {
        id: rect_pos_2_3
        height: main_windows.height * 0.16
        width: rect_pos_2_3.height
        anchors.top: rect_pos_2_1.bottom
        anchors.topMargin: main_windows.height * 0.1
        anchors.left: main_windows.horizontalCenter
        anchors.leftMargin: main_windows.width * 0.03

        RectangularGlow
        {
            id: effect_pos_2_3
            anchors.fill: rect_pos_2_3
            glowRadius: 10
            spread: 0.2
            color: "red"
        }

        Image
        {
            id: pos_2_3
            height: parent.height
            width: parent.width
            anchors.centerIn: rect_pos_2_3
            source: "file:///" + applicationDirPath + "/image/battle/black.jpg";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onHoveredChanged:
                {
                    if(life_pos_2_3.visible === false)
                        return;

                    repaint_select_mouse(2,1);
                    select_move(2,1);
                    x_hover = 2;
                    y_hover = 1;
                }
                onExited:
                {
                    repaint_select_disable_mouse(2,1);
                    disable_select_move();
                    x_hover = -1;
                    y_hover = -1;
                }
                onPressedChanged:
                {
                    if(pressed === true)
                    {
                        if(pressedButtons === Qt.LeftButton)
                        {
                            if(lock === true) return;
                            if(can_damage(2,1) === true)
                                attack(2,1,"");
                        }
                        else if(pressedButtons === Qt.RightButton)
                        {
                            if(pos_2_3.source != "file:///" + applicationDirPath + "/image/battle/black.jpg"){
                                image_otrad_left.source = pos_2_3.source;
                                property_left.parsing_full_version(2,1);
                                show_characteristic_left.visible = true;
                            }
                        }
                    }
                    else
                        show_characteristic_left.visible = false;
                }
            }
        }

        Image
        {
            id: pos_2_3_backgrounde
            width: pos_2_3.width
            height: pos_2_3.height
            anchors.centerIn: pos_2_3
            visible: false

            NumberAnimation on opacity
            {
                id: pos_2_3_animation
                from:0.1
                to: 1
                duration: 1000

                onStopped:
                {
                    if(mode === 1)
                    {
                        if(massiv_kill[8] === 1)
                        {
                            pos_2_3_backgrounde_text.visible = false;
                            pos_2_3_backgrounde.source = "file:///" + applicationDirPath + "/image/battle/sherep.jpg";
                            massiv_kill[8] = 2;
                            disable_life_pos_2_3();
                            pos_2_3.source = "file:///" + applicationDirPath + "/image/battle/black.jpg";
                            effect_pos_2_3.color = "red";
                            pos_2_3_animation.restart();
                            return;
                        }
                        else if(massiv_kill[8] === 2)
                        {
                            update_oshered_hodov();
                            who_win();
                        }

                        pos_2_3_backgrounde_text.visible = false;
                        pos_2_3_backgrounde.visible = false;
                        perehod_hoda();
                    }
                    else if(mode === 0)
                    {
                        pos_2_3_backgrounde_text.visible = false;
                        pos_2_3_backgrounde.visible = false;
                        if(massiv_effect[0] === 1)
                            perehod_hoda();
                    }
                }//onStopped
            }
        }

        Text
        {
            id: pos_2_3_backgrounde_text
            width: pos_2_3_backgrounde.width
            height: pos_2_3_backgrounde.height
            anchors.centerIn: pos_2_3_backgrounde
            color:"white"
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
            fontSizeMode: Text.Fit
            minimumPointSize: 10
            visible: false
        }

        Rectangle
        {
            id: life_pos_2_3
            height: rect_pos_2_3.height * 0.225
            anchors.left: rect_pos_2_3.left
            anchors.right: rect_pos_2_3.right
            anchors.top: rect_pos_2_3.bottom
            anchors.topMargin: main_windows.height * 0.01
            color: "black"
            border.width: width_border
            border.color: "white"
        }

        Image
        {
            id: image_life_pos_2_3
            height: life_pos_2_3.height - (width_border * 2)
            width: image_life_pos_2_3.height
            anchors.left: rect_pos_2_3.left
            anchors.leftMargin: width_border
            anchors.top: life_pos_2_3.top
            anchors.topMargin: width_border
            source: "file:///" + applicationDirPath + "/image/battle/life.png";
        }

        Rectangle
        {
            id: real_life_pos_2_3
            width: life_pos_2_3.width - image_life_pos_2_3.width - (width_border * 2)
            height: life_pos_2_3.height - (width_border * 2)
            anchors.left: image_life_pos_2_3.right
            anchors.verticalCenter: life_pos_2_3.verticalCenter
            color: "green"

            Behavior on width
            {
                NumberAnimation { duration: 1000 }
            }
        }

        Text
        {
            id: text_real_life_pos_2_3
            width: life_pos_2_3.width - image_life_pos_2_3.width
            height: life_pos_2_3.height * 0.05
            anchors.left: image_life_pos_2_3.right
            anchors.right: life_pos_2_3.right
            anchors.verticalCenter: life_pos_2_3.verticalCenter
            color:"white"
            text:qsTr("")
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            fontSizeMode: Text.Fit
            minimumPointSize: 10
        }
    }

    Rectangle
    {
        id: rect_pos_2_4
        height: main_windows.height * 0.16
        width: rect_pos_2_4.height
        anchors.top: rect_pos_2_2.bottom
        anchors.topMargin: main_windows.height * 0.1
        anchors.left: rect_pos_2_3.right
        anchors.leftMargin: main_windows.width * 0.05

        RectangularGlow
        {
            id: effect_pos_2_4
            anchors.fill: rect_pos_2_4
            glowRadius: 10
            spread: 0.2
            color: "red"
        }

        Image
        {
            id: pos_2_4
            height: parent.height
            width: parent.width
            anchors.centerIn: rect_pos_2_4
            source: "file:///" + applicationDirPath + "/image/battle/black.jpg";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onHoveredChanged:
                {
                    if(life_pos_2_4.visible === false)
                        return;

                    repaint_select_mouse(3,1);
                    select_move(3,1);
                    x_hover = 3;
                    y_hover = 1;
                }
                onExited:
                {
                    repaint_select_disable_mouse(3,1);
                    disable_select_move();
                    x_hover = -1;
                    y_hover = -1;
                }
                onPressedChanged:
                {
                    if(pressed === true)
                    {
                        if(pressedButtons === Qt.LeftButton)
                        {
                            if(lock === true) return;
                            if(can_damage(3,1) === true)
                                attack(3,1,"");
                        }
                        else if(pressedButtons === Qt.RightButton)
                        {
                            if(pos_2_4.source != "file:///" + applicationDirPath + "/image/battle/black.jpg"){
                                image_otrad_left.source = pos_2_4.source;
                                property_left.parsing_full_version(3,1);
                                show_characteristic_left.visible = true;
                            }
                        }
                    }
                    else
                        show_characteristic_left.visible = false;
                }
            }
        }

        Image
        {
            id: pos_2_4_backgrounde
            width: pos_2_4.width
            height: pos_2_4.height
            anchors.centerIn: pos_2_4
            visible: false

            NumberAnimation on opacity
            {
                id: pos_2_4_animation
                from:0.1
                to: 1
                duration: 1000

                onStopped:
                {
                    if(mode === 1)
                    {
                        if(massiv_kill[9] === 1)
                        {
                            pos_2_4_backgrounde_text.visible = false;
                            pos_2_4_backgrounde.source = "file:///" + applicationDirPath + "/image/battle/sherep.jpg";
                            massiv_kill[9] = 2;
                            disable_life_pos_2_4();
                            pos_2_4.source = "file:///" + applicationDirPath + "/image/battle/black.jpg";
                            effect_pos_2_4.color = "red";
                            pos_2_4_animation.restart();
                            return;
                        }
                        else if(massiv_kill[9] === 2)
                        {
                            update_oshered_hodov();
                            who_win();
                        }

                        pos_2_4_backgrounde_text.visible = false;
                        pos_2_4_backgrounde.visible = false;
                        perehod_hoda();
                    }
                    else if(mode === 0)
                    {
                        pos_2_4_backgrounde_text.visible = false;
                        pos_2_4_backgrounde.visible = false;
                        if(massiv_effect[0] === 1)
                            perehod_hoda();
                    }
                }//onStopped
            }
        }

        Text
        {
            id: pos_2_4_backgrounde_text
            width: pos_2_4_backgrounde.width
            height: pos_2_4_backgrounde.height
            anchors.centerIn: pos_2_4_backgrounde
            color:"white"
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
            fontSizeMode: Text.Fit
            minimumPointSize: 10
            visible: false
        }

        Rectangle
        {
            id: life_pos_2_4
            height: rect_pos_2_4.height * 0.225
            anchors.left: rect_pos_2_4.left
            anchors.right: rect_pos_2_4.right
            anchors.top: rect_pos_2_4.bottom
            anchors.topMargin: main_windows.height * 0.01
            color: "black"
            border.width: width_border
            border.color: "white"
        }

        Image
        {
            id: image_life_pos_2_4
            height: life_pos_2_4.height - (width_border * 2)
            width: image_life_pos_2_4.height
            anchors.left: rect_pos_2_4.left
            anchors.leftMargin: width_border
            anchors.top: life_pos_2_4.top
            anchors.topMargin: width_border
            source: "file:///" + applicationDirPath + "/image/battle/life.png";
        }

        Rectangle
        {
            id: real_life_pos_2_4
            width: life_pos_2_4.width - image_life_pos_2_4.width - (width_border * 2)
            height: life_pos_2_4.height - (width_border * 2)
            anchors.left: image_life_pos_2_4.right
            anchors.verticalCenter: life_pos_2_4.verticalCenter
            color: "green"

            Behavior on width
            {
                NumberAnimation { duration: 1000 }
            }
        }

        Text
        {
            id: text_real_life_pos_2_4
            width: life_pos_2_4.width - image_life_pos_2_4.width
            height: life_pos_2_4.height * 0.05
            anchors.left: image_life_pos_2_4.right
            anchors.right: life_pos_2_4.right
            anchors.verticalCenter: life_pos_2_4.verticalCenter
            color:"white"
            text:qsTr("")
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            fontSizeMode: Text.Fit
            minimumPointSize: 10
        }
    }

    Rectangle
    {
        id: rect_pos_2_5
        height: main_windows.height * 0.16
        width: rect_pos_2_5.height
        anchors.top: rect_pos_2_3.bottom
        anchors.topMargin: main_windows.height * 0.1
        anchors.left: main_windows.horizontalCenter
        anchors.leftMargin: main_windows.width * 0.03

        RectangularGlow
        {
            id: effect_pos_2_5
            anchors.fill: rect_pos_2_5
            glowRadius: 10
            spread: 0.2
            color: "red"
        }

        Image
        {
            id: pos_2_5
            height: parent.height
            width: parent.width
            anchors.centerIn: rect_pos_2_5
            source: "file:///" + applicationDirPath + "/image/battle/black.jpg";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onHoveredChanged:
                {
                    if(life_pos_2_5.visible === false)
                        return;

                    repaint_select_mouse(2,2);
                    select_move(2,2);
                    x_hover = 2;
                    y_hover = 2;
                }
                onExited:
                {
                    repaint_select_disable_mouse(2,2);
                    disable_select_move();
                    x_hover = -1;
                    y_hover = -1;
                }
                onPressedChanged:
                {
                    if(pressed === true)
                    {
                        if(pressedButtons === Qt.LeftButton)
                        {
                            if(lock === true) return;
                            if(can_damage(2,2) === true)
                                attack(2,2,"");
                        }
                        else if(pressedButtons === Qt.RightButton)
                        {
                            if(pos_2_5.source != "file:///" + applicationDirPath + "/image/battle/black.jpg"){
                                image_otrad_left.source = pos_2_5.source;
                                property_left.parsing_full_version(2,2);
                                show_characteristic_left.visible = true;
                            }
                        }
                    }
                    else
                        show_characteristic_left.visible = false;
                }
            }
        }

        Image
        {
            id: pos_2_5_backgrounde
            width: pos_2_5.width
            height: pos_2_5.height
            anchors.centerIn: pos_2_5
            visible: false

            NumberAnimation on opacity
            {
                id: pos_2_5_animation
                from:0.1
                to: 1
                duration: 1000

                onStopped:
                {
                    if(mode === 1)
                    {
                        if(massiv_kill[10] === 1)
                        {
                            pos_2_5_backgrounde_text.visible = false;
                            pos_2_5_backgrounde.source = "file:///" + applicationDirPath + "/image/battle/sherep.jpg";
                            massiv_kill[10] = 2;
                            disable_life_pos_2_5();
                            pos_2_5.source = "file:///" + applicationDirPath + "/image/battle/black.jpg";
                            effect_pos_2_5.color = "red";
                            pos_2_5_animation.restart();
                            return;
                        }
                        else if(massiv_kill[10] === 2)
                        {
                            update_oshered_hodov();
                            who_win();
                        }

                        pos_2_5_backgrounde_text.visible = false;
                        pos_2_5_backgrounde.visible = false;
                        perehod_hoda();
                    }
                    else if(mode === 0)
                    {
                        pos_2_5_backgrounde_text.visible = false;
                        pos_2_5_backgrounde.visible = false;
                        if(massiv_effect[0] === 1)
                            perehod_hoda();
                    }
                }//onStopped
            }
        }

        Text
        {
            id: pos_2_5_backgrounde_text
            width: pos_2_5_backgrounde.width
            height: pos_2_5_backgrounde.height
            anchors.centerIn: pos_2_5_backgrounde
            color:"white"
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
            fontSizeMode: Text.Fit
            minimumPointSize: 10
            visible: false
        }

        Rectangle
        {
            id: life_pos_2_5
            height: rect_pos_2_5.height * 0.225
            anchors.left: rect_pos_2_5.left
            anchors.right: rect_pos_2_5.right
            anchors.top: rect_pos_2_5.bottom
            anchors.topMargin: main_windows.height * 0.01
            color: "black"
            border.width: width_border
            border.color: "white"
        }

        Image
        {
            id: image_life_pos_2_5
            height: life_pos_2_5.height - (width_border * 2)
            width: image_life_pos_2_5.height
            anchors.left: rect_pos_2_5.left
            anchors.leftMargin: width_border
            anchors.top: life_pos_2_5.top
            anchors.topMargin: width_border
            source: "file:///" + applicationDirPath + "/image/battle/life.png";
        }

        Rectangle
        {
            id: real_life_pos_2_5
            width: life_pos_2_5.width - image_life_pos_2_5.width - (width_border * 2)
            height: life_pos_2_5.height - (width_border * 2)
            anchors.left: image_life_pos_2_5.right
            anchors.verticalCenter: life_pos_2_5.verticalCenter
            color: "green"

            Behavior on width
            {
                NumberAnimation { duration: 1000 }
            }
        }

        Text
        {
            id: text_real_life_pos_2_5
            width: life_pos_2_5.width - image_life_pos_2_5.width
            height: life_pos_2_5.height * 0.05
            anchors.left: image_life_pos_2_5.right
            anchors.right: life_pos_2_5.right
            anchors.verticalCenter: life_pos_2_5.verticalCenter
            color:"white"
            text:qsTr("")
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            fontSizeMode: Text.Fit
            minimumPointSize: 10
        }
    }

    Rectangle
    {
        id: rect_pos_2_6
        height: main_windows.height * 0.16
        width: rect_pos_2_6.height
        anchors.top: rect_pos_2_4.bottom
        anchors.topMargin: main_windows.height * 0.1
        anchors.left: rect_pos_2_5.right
        anchors.leftMargin: main_windows.width * 0.05

        RectangularGlow
        {
            id: effect_pos_2_6
            anchors.fill: rect_pos_2_6
            glowRadius: 10
            spread: 0.2
            color: "red"
        }

        Image
        {
            id: pos_2_6
            height: parent.height
            width: parent.width
            anchors.centerIn: rect_pos_2_6
            source: "file:///" + applicationDirPath + "/image/battle/black.jpg";

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onHoveredChanged:
                {
                    if(life_pos_2_6.visible === false)
                        return;

                    repaint_select_mouse(3,2);
                    select_move(3,2);
                    x_hover = 3;
                    y_hover = 2;
                }
                onExited:
                {
                    repaint_select_disable_mouse(3,2);
                    disable_select_move();
                    x_hover = -1;
                    y_hover = -1;
                }
                onPressedChanged:
                {
                    if(pressed === true)
                    {
                        if(pressedButtons === Qt.LeftButton)
                        {
                            if(lock === true) return;
                            if(can_damage(3,2) === true)
                                attack(3,2,"");
                        }
                        else if(pressedButtons === Qt.RightButton)
                        {
                            if(pos_2_6.source != "file:///" + applicationDirPath + "/image/battle/black.jpg"){
                                image_otrad_left.source = pos_2_6.source;
                                property_left.parsing_full_version(3,2);
                                show_characteristic_left.visible = true;
                            }
                        }
                    }
                    else
                        show_characteristic_left.visible = false;
                }
            }
        }

        Image
        {
            id: pos_2_6_backgrounde
            width: pos_2_6.width
            height: pos_2_6.height
            anchors.centerIn: pos_2_6
            visible: false

            NumberAnimation on opacity
            {
                id: pos_2_6_animation
                from:0.1
                to: 1
                duration: 1000

                onStopped:
                {
                    if(mode === 1)
                    {
                        if(massiv_kill[11] === 1)
                        {
                            pos_2_6_backgrounde_text.visible = false;
                            pos_2_6_backgrounde.source = "file:///" + applicationDirPath + "/image/battle/sherep.jpg";
                            massiv_kill[11] = 2;
                            disable_life_pos_2_6();
                            pos_2_6.source = "file:///" + applicationDirPath + "/image/battle/black.jpg";
                            effect_pos_2_6.color = "red";
                            pos_2_6_animation.restart();
                            return;
                        }
                        else if(massiv_kill[11] === 2)
                        {
                            update_oshered_hodov();
                            who_win();
                        }

                        pos_2_6_backgrounde_text.visible = false;
                        pos_2_6_backgrounde.visible = false;
                        perehod_hoda();
                    }
                    else if(mode === 0)
                    {
                        pos_2_6_backgrounde_text.visible = false;
                        pos_2_6_backgrounde.visible = false;
                        if(massiv_effect[0] === 1)
                            perehod_hoda();
                    }
                }//onStopped
            }
        }

        Text
        {
            id: pos_2_6_backgrounde_text
            width: pos_2_6_backgrounde.width
            height: pos_2_6_backgrounde.height
            anchors.centerIn: pos_2_6_backgrounde
            color:"white"
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 18
            fontSizeMode: Text.Fit
            minimumPointSize: 10
            visible: false
        }

        Rectangle
        {
            id: life_pos_2_6
            height: rect_pos_2_6.height * 0.225
            anchors.left: rect_pos_2_6.left
            anchors.right: rect_pos_2_6.right
            anchors.top: rect_pos_2_6.bottom
            anchors.topMargin: main_windows.height * 0.01
            color: "black"
            border.width: width_border
            border.color: "white"
        }

        Image
        {
            id: image_life_pos_2_6
            height: life_pos_2_6.height - (width_border * 2)
            width: image_life_pos_2_6.height
            anchors.left: rect_pos_2_6.left
            anchors.leftMargin: width_border
            anchors.top: life_pos_2_6.top
            anchors.topMargin: width_border
            source: "file:///" + applicationDirPath + "/image/battle/life.png";
        }

        Rectangle
        {
            id: real_life_pos_2_6
            width: life_pos_2_6.width - image_life_pos_2_6.width - (width_border * 2)
            height: life_pos_2_6.height - (width_border * 2)
            anchors.left: image_life_pos_2_6.right
            anchors.verticalCenter: life_pos_2_6.verticalCenter
            color: "green"

            Behavior on width
            {
                NumberAnimation { duration: 1000 }
            }
        }

        Text
        {
            id: text_real_life_pos_2_6
            width: life_pos_2_6.width - image_life_pos_2_6.width
            height: life_pos_2_6.height * 0.05
            anchors.left: image_life_pos_2_6.right
            anchors.right: life_pos_2_6.right
            anchors.verticalCenter: life_pos_2_6.verticalCenter
            color:"white"
            text:qsTr("")
            font.family: "Bauhaus 93"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            fontSizeMode: Text.Fit
            minimumPointSize: 10
        }
    }

    Rectangle
    {
        id: show_characteristic_left
        width: main_windows.width * 0.4
        height: main_windows.height * 0.8
        anchors.left: main_windows.left
        anchors.leftMargin: main_windows.width * 0.075
        anchors.top: main_windows.top
        anchors.topMargin: main_windows.height * 0.05
        visible: false

        RectangularGlow
        {
            id: effect_show_left
            anchors.fill: show_characteristic_left
            glowRadius: 10
            spread: 0.2
            color: "white"
        }

        Image
        {
            id: image_show_characteristic_left
            height: parent.height
            width: parent.width
            anchors.centerIn: show_characteristic_left
            source: "file:///" + applicationDirPath + "/image/battle/black.jpg";
        }

        Rectangle
        {
            id: rect_for_image_otrad_left
            width: parent.width * 0.2
            height: image_otrad_left.width
            anchors.top: parent.top
            anchors.topMargin: parent.width * 0.1
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.1

            RectangularGlow
            {
                id: effect_image_otrad_left
                anchors.fill: rect_for_image_otrad_left
                glowRadius: 10
                spread: 0.2
                color: "white"
            }

            Image
            {
                id: image_otrad_left
                width: parent.width
                height: parent.height
                anchors.centerIn: rect_for_image_otrad_left
            }
        }

        Table_property
        {
            id: property_left
            width: parent.width * 0.7
            height: parent.height * 0.5
            anchors.right: parent.right
            anchors.top: parent.top
            color: "#00000000"
        }
    }

    Rectangle
    {
        id: show_characteristic_right
        width: main_windows.width * 0.4
        height: main_windows.height * 0.8
        anchors.right: main_windows.right
        anchors.rightMargin: main_windows.width * 0.075
        anchors.top: main_windows.top
        anchors.topMargin: main_windows.height * 0.05
        visible: false

        RectangularGlow
        {
            id: effect_show_right
            anchors.fill: show_characteristic_right
            glowRadius: 10
            spread: 0.2
            color: "white"
        }

        Image
        {
            id: image_show_characteristic_right
            height: parent.height
            width: parent.width
            anchors.centerIn: show_characteristic_right
            source: "file:///" + applicationDirPath + "/image/battle/black.jpg";
        }

        Rectangle
        {
            id: rect_for_image_otrad_right
            width: parent.width * 0.2
            height: image_otrad_right.width
            anchors.top: parent.top
            anchors.topMargin: parent.width * 0.1
            anchors.right: parent.right
            anchors.rightMargin: parent.width * 0.1

            RectangularGlow
            {
                id: effect_image_otrad_right
                anchors.fill: rect_for_image_otrad_right
                glowRadius: 10
                spread: 0.2
                color: "white"
            }

            Image
            {
                id: image_otrad_right
                width: parent.width
                height: parent.height
                anchors.centerIn: rect_for_image_otrad_right
            }
        }

        Table_property
        {
            id: property_right
            width: parent.width * 0.7
            height: parent.height * 0.5
            anchors.left: parent.left
            anchors.top: parent.top
            color: "#00000000"
        }
    }

    ESC
    {
        id:esc_esc
    }
}

