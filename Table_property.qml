import QtQuick 2.4

Rectangle
{
    id: main_rect
    width: parent.width
    height: parent.height
    visible: true

    property string name_geroy: ""   // Воин Лучник или Маг
    property string base_life: ""
    property string base_damage: ""
    
    function set_name(name)
    {
        name_otrad_text.text = name;
    }

    function update_life_for_geroy()
    {
        var life = (parseInt(base_life) + global_settings.get_add_life_for_geroy(name_geroy)).toString();
        model_list.setProperty(3,"value_model",life);
    }

    function update_damage_for_geroy()
    {
        var damage = (parseInt(base_damage) + global_settings.get_add_damage_for_geroy(name_geroy)).toString();
        model_list.setProperty(2,"value_model",damage);
    }

    function parsing_full_version(x,y)
    {
        var stroka = global_settings.get_full_info_otrad(x,y);
        help_parsing(stroka,"");
    }

    function parsing_string(adress,name,level)
    {
        var stroka = global_settings.read_XML(adress,name,level);
        help_parsing(stroka,name);
    }

    function help_parsing(stroka,name)
    {
        var start_index = 0;
        var massiv = new Array(11);
        var end_index = stroka.indexOf("#");
        var name_res = stroka.slice(start_index,end_index);

        for(var i = 0; i < massiv.length; i++) //парсинг строки
        {
            start_index = end_index;
            end_index = stroka.indexOf("#",start_index + 1);
            massiv[i] = stroka.slice(start_index + 1,end_index);
        }

        if((name_res === "Воин") || (name_res === "Маг") || (name_res === "Лучник"))
        {
            name_otrad_text.text = global_settings.get_real_name_geroy();
            base_life = massiv[3];
            base_damage = massiv[2];
            massiv[3] = (parseInt(massiv[3]) + global_settings.get_add_life_for_geroy(name_res)).toString();
            massiv[2] = (parseInt(massiv[2]) + global_settings.get_add_damage_for_geroy(name_res)).toString();
            name_geroy = name_res;
        }
        else
            name_otrad_text.text = name_res;

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
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	Text
    {
        id: name_otrad_text
        color:"white"
        font.family: "Segoe Print"
        font.bold: true
        font.pointSize: 24
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.01
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.Fit
        minimumPointSize: 8
        height: main_rect.height * 0.1
        width: main_rect.width
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
        width: main_rect.width
        height: main_rect.height * 0.85
        anchors.bottom: main_rect.bottom
    }
}
