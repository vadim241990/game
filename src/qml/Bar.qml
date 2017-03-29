import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle
{
    id: prog_bar
    radius: prog_bar.height * 0.5
    color: "#28332E"

    property int minimum_number: global_settings.get_exp_level(global_settings.get_level_team() - 1)
    property int maximum_number: global_settings.get_exp_level(global_settings.get_level_team())
    property int value_number: global_settings.get_exp()

    Behavior on value_number
    {
        id: anime
        enabled: true
        NumberAnimation {duration: 1000;}
    }

    function repaint()
    {
        value_number = global_settings.get_exp();
    }

    function add_value_number(number) //функция для тестирования
    {
        global_settings.set_exp(global_settings.get_exp() + number);
    }

    function min_max()
    {
        for(var i = 0; i < global_settings.get_exp_level_size() - 2; i++)
        {
            if(minimum_number ===  global_settings.get_exp_level(i))
            {
                minimum_number = global_settings.get_exp_level(i + 1);
                maximum_number = global_settings.get_exp_level(i + 2);
                return;
            }
        }
    }

    function progress_go()
    {
        var total_value = maximum_number - minimum_number;
        var exp = value_number - minimum_number;
        var res = total_value / 100;
        var sum = exp / res;
        if(sum >= 100)
        {
            timer.running = true;
            sum = 100;
        }

        if((sum <= 5) && (sum != 0))
            sum = 5;
        return prog_bar.width * (sum * 0.01);
    }

    function text_input()
    {
        return value_number + "/" + maximum_number;
    }

    Image
    {
        id: img
        property int size_width: prog_bar.width

        width: prog_bar.width
        height: prog_bar.height
        anchors.left: prog_bar.left

        source: "../other/image/other/fiolet.jpg"
        fillMode: Image.Stretch
        layer.enabled: true
        layer.effect: OpacityMask
        {
            maskSource: Item
            {
                width: img.width
                height: img.height
                Rectangle
                {
                    anchors.left: parent.left
                    width: prog_bar.progress_go()
                    height: img.height
                    radius: Math.min(width, height)
                }
            }
         }
     }

     Text
     {
         id: prog_bar_text
         anchors.centerIn: prog_bar
         height: prog_bar.height
         color: "white"
         font.bold: true
         font.pixelSize: 17
         font.family: "Segoe Print"
         minimumPointSize: 8
         verticalAlignment: Text.AlignVCenter
         text: prog_bar.text_input()
     }

     Timer
     {
         id: timer
         interval: 500
         running: false
         onTriggered:{
             if(prog_bar.value_number >= prog_bar.maximum_number)
             {
                 anime.enabled = false;
                 min_max();
                 anime.enabled = true;
                 timer.running = false;
             }
         }
     }
}
