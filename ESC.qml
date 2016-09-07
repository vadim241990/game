import QtQuick 2.4
import QtQuick.Controls.Styles 1.3

Rectangle
{
    id: esc_menu
    width: parent.width
    height: parent.height
    visible: false

    Image
    {
        id: fon
        source: "file:///" + applicationDirPath + "/image/esc/fon_esc.jpg";
    }

    MouseArea //заглушка от случайного нажатия на другую форму
    {
        anchors.fill: parent
        onClicked: {}
    }

    Rectangle
    {
        id: back
        width: esc_menu.width * 0.3
        height: esc_menu.height * 0.1
        anchors.bottom: save.top
        anchors.bottomMargin: esc_menu.height * 0.05
        anchors.horizontalCenter: esc_menu.horizontalCenter
        border.color: "white"
        border.width: 5
        radius: back.height * 0.3
        gradient:Gradient
        {
            GradientStop { position: 0.0; color: "black" }
            GradientStop { position: 0.5; color: "blue" }
            GradientStop { position: 1.0; color: "black" }
        }

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true

            onClicked:         esc_menu.visible = false;
            onHoveredChanged:
            {
                back_text.color = "lime";
                back.border.color = "lime";
            }
            onExited:
            {
                back_text.color = "white";
                back.border.color = "white";
            }
        }
    }

    Rectangle
    {
        id: save
        width: esc_menu.width * 0.3
        height: esc_menu.height * 0.1
        anchors.bottom: load.top
        anchors.bottomMargin: esc_menu.height * 0.05
        anchors.horizontalCenter: esc_menu.horizontalCenter
        border.color: "white"
        border.width: 5
        radius: back.height * 0.3
        gradient:Gradient
        {
            GradientStop { position: 0.0; color: "black" }
            GradientStop { position: 0.5; color: "blue" }
            GradientStop { position: 1.0; color: "black" }
        }

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true

            onHoveredChanged:
            {
                save_text.color = "lime";
                save.border.color = "lime";
            }
            onExited:
            {
                save_text.color = "white";
                save.border.color = "white";
            }
        }
    }

    Rectangle
    {
        id: load
        width: esc_menu.width * 0.3
        height: esc_menu.height * 0.1
        anchors.horizontalCenter: esc_menu.horizontalCenter
        anchors.verticalCenter: esc_menu.verticalCenter
        border.color: "white"
        border.width: 5
        radius: back.height * 0.3
        gradient:Gradient
        {
            GradientStop { position: 0.0; color: "black" }
            GradientStop { position: 0.5; color: "blue" }
            GradientStop { position: 1.0; color: "black" }
        }

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true

            onHoveredChanged:
            {
                load_text.color = "lime";
                load.border.color = "lime";
            }
            onExited:
            {
                load_text.color = "white";
                load.border.color = "white";
            }
        }
    }

    Rectangle
    {
        id: settings
        width: esc_menu.width * 0.3
        height: esc_menu.height * 0.1
        anchors.top: load.bottom
        anchors.topMargin: esc_menu.height * 0.05
        anchors.horizontalCenter: esc_menu.horizontalCenter
        border.color: "white"
        border.width: 5
        radius: back.height * 0.3
        gradient:Gradient
        {
            GradientStop { position: 0.0; color: "black" }
            GradientStop { position: 0.5; color: "blue" }
            GradientStop { position: 1.0; color: "black" }
        }

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true

            onHoveredChanged:
            {
                settings_text.color = "lime";
                settings.border.color = "lime";
            }
            onExited:
            {
                settings_text.color = "white";
                settings.border.color = "white";
            }
        }
    }

    Rectangle
    {
        id: exit
        width: esc_menu.width * 0.3
        height: esc_menu.height * 0.1
        anchors.top: settings.bottom
        anchors.topMargin: esc_menu.height * 0.05
        anchors.horizontalCenter: esc_menu.horizontalCenter
        border.color: "white"
        border.width: 5
        radius: back.height * 0.3
        gradient:Gradient
        {
            GradientStop { position: 0.0; color: "black" }
            GradientStop { position: 0.5; color: "blue" }
            GradientStop { position: 1.0; color: "black" }
        }

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true

            onClicked: global_settings.quit();
            onHoveredChanged:
            {
                exit_text.color = "lime";
                exit.border.color = "lime";
            }
            onExited:
            {
                exit_text.color = "white";
                exit.border.color = "white";
            }
        }
    }

    Text
    {
        id: back_text
        anchors.centerIn: back
        color:"white"
        text:qsTr("Вернуться назад")
        font.family: "Segoe Print"
        font.pointSize: 17
        font.bold: true
        fontSizeMode: Text.Fit
        minimumPointSize: 8
        width: back.width
        height: back.height
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Text
    {
        id: save_text
        anchors.centerIn: save
        color:"white"
        text:qsTr("Сохранить игру")
        font.family: "Segoe Print"
        font.pointSize: 17
        font.bold: true
        fontSizeMode: Text.Fit
        minimumPointSize: 8
        width: save.width
        height: save.height
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Text
    {
        id: load_text
        anchors.centerIn: load
        color:"white"
        text:qsTr("Загрузить игру")
        font.family: "Segoe Print"
        font.pointSize: 17
        font.bold: true
        fontSizeMode: Text.Fit
        minimumPointSize: 8
        width: load.width
        height: load.height
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Text
    {
        id: settings_text
        anchors.centerIn: settings
        color:"white"
        text:qsTr("Настройки")
        font.family: "Segoe Print"
        font.pointSize: 17
        font.bold: true
        fontSizeMode: Text.Fit
        minimumPointSize: 8
        width: settings.width
        height: settings.height
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Text
    {
        id: exit_text
        anchors.centerIn: exit
        color:"white"
        text:qsTr("Выйти из игры")
        font.family: "Segoe Print"
        font.pointSize: 17
        font.bold: true
        fontSizeMode: Text.Fit
        minimumPointSize: 8
        width: exit.width
        height: exit.height
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}

