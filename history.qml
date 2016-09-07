import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0

Rectangle //вступительная заставка к новому уровню
{
    id: main_windows
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    visible: true

    Item
    {
        id: settings

        function select_image_and_text()
        {
            var res = global_settings.get_level_game();
            if(res === 1)
            {
                main_image.source = "file:///" + applicationDirPath + "/image/history_form/history_fon_1.jpg";
                label_text.text = "<h2>Пробуждение</h2><p>От жажды наживы странник капал могилу все быстрее. По найденным им письменам тут закопано \
необычайное богатство. Стук лопаты о металл, заставил его глаза сиять. Очистив вещь от грязи и открыв коробку, он нашел там черный камень.\
 Резкая вспышка ослепила его и уже через секунду части тела странника можно было найти на ближайших деревьях. Проснувшийся демон почувствовал прилив \
сил и ненависти ко всему живому. Пора возрождать армию тьмы и уничтожить жалких людишек подумал он... </p>";
            }
        }
    }

    Rectangle
    {
        id:main_rect
        width: parent.width
        height: parent.height

        Image
        {
            id:main_image
            width: parent.width
            height: parent.height
            source:{settings.select_image_and_text()}
        }

        Text
        {
            id:label_text
            width: parent.width * 0.3
            height: parent.height * 0.3
            wrapMode: TextEdit.WordWrap
            color: "white"
            font.family: "Segoe Print"
            font.bold: true
            font.pointSize: 14
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.05
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.05
            fontSizeMode: Text.Fit
            minimumPointSize: 8
        }

        Style_files
        {
            id:button_next
            height: 50
            width: label_text.width * 0.5
            anchors.bottom: main_rect.bottom
            anchors.bottomMargin: main_rect.height * 0.1
            anchors.right: main_rect.right
            anchors.rightMargin: main_rect.width * 0.1

            onClicked:
            {
                item_loader_windows.settings_select("taktic_game.qml");
            }
        }

        Text
        {
            id:text_next
            anchors.centerIn: button_next
            color:"white"
            text:qsTr("Далее")
            font.family: "Segoe Print"
            font.pointSize: 17
            fontSizeMode: Text.Fit
            minimumPointSize: 8
        }
    }
}

