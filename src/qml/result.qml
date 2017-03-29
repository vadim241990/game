import QtQuick 2.4
import QtQuick.Window 2.2

Rectangle
{
    id: main_windows
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    visible: true
    focus: true

    property bool var_init: false
    property int value_number: 0

    Behavior on value_number
    {
        id: anime
        enabled: true
        NumberAnimation {duration: 1000;}
    }

    function repaint_text()
    {
       value_number = global_settings.get_many_za_battle();
    }

    function text_input()
    {
        return "+ " + value_number;
    }

    function init()
    {
        if(var_init === false)
        {
            var res = global_settings.get_result_battle();
            if(res === "game_over")
                fon.source = "file:///" + applicationDirPath + "/image/result/Game_over.jpg";
            else
            {
                fon.source = "file:///" + applicationDirPath + "/image/result/fon_result.jpg";
                logo.visible = true;
                logo.source = "file:///" + applicationDirPath + "/image/result/win.png";
                pro_bar.visible = true;
                text_number_exp.visible = true;
                pro_bar.repaint();
            }

            var_init = true;
        }
    }

    Image
    {
        id: fon
        width: parent.width
        height: parent.height
        source: init()
    }

    Image
    {
        id: logo
        width: parent.width * 0.4
        height: parent.height * 0.3
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.1
        visible: false
    }

    Bar
    {
        id: pro_bar
        width: logo.width * 0.7
        height: logo.height * 0.1
        anchors.top: logo.bottom
        anchors.topMargin: parent.height * 0.1
        anchors.left: logo.left
        visible: false
    }

    Text
    {
        id: text_number_exp
        width: logo.width * 0.7
        height: logo.height * 0.1
        anchors.top: logo.bottom
        anchors.topMargin: parent.height * 0.1
        anchors.left: pro_bar.right
        anchors.leftMargin: logo.width * 0.05
        color: "white"
        font.bold: true
        font.pixelSize: 17
        font.family: "Segoe Print"
        minimumPointSize: 8
        verticalAlignment: Text.AlignVCenter
        text: text_input()
        visible: false
    }

    Image
    {
        id: new_level
        width: logo.height * 0.6
        height: new_level.width
        anchors.top: pro_bar.bottom
        anchors.topMargin: parent.height * 0.1
        anchors.horizontalCenter: parent.horizontalCenter
        source: "file:///" + applicationDirPath + "/image/result/zvezda.png"
        visible: false
    }

    Timer  //для конца игры показываем надпись проигрыша и выходим в гланое меню игры
    {      //если победа другой таймер делает отрисовку и выходим для продолжения игры
        id: timer
        interval: 3000
        running: true
        onTriggered:
        {
            if(global_settings.get_result_battle() === "game_over")
            {
                global_settings.remove_battle();
                global_settings.remove_clear_global_settings();
                item_loader_windows.settings_select("main.qml");
            }
            else
            {
                global_settings.job_ready();
                global_settings.remove_battle();
                item_loader_windows.settings_select("taktic_game.qml");
            }
        }
    }

    Timer  //полученный опыт
    {
        id: timer_2
        interval: 500
        running: true
        onTriggered:
        {
            var exp_plus = global_settings.get_exp();           //добавляем опыт
            exp_plus += global_settings.get_many_za_battle();   //
            global_settings.set_exp(exp_plus);                  //

            pro_bar.repaint();
            repaint_text();

            var level = global_settings.get_level_team();
            var need_exp_for_new_level = global_settings.get_exp_level(level);
            if(need_exp_for_new_level < exp_plus)               //получил новый уровень
            {
                global_settings.set_level_team(level + 1);
                new_level.visible = true;

                global_settings.set_point_1(global_settings.get_point_1() + 5); //добавляем очки от получения нового уровня
                global_settings.add_point_2();
                global_settings.add_point_3();
            }

            timer_2.running = false;
        }
    }
}
