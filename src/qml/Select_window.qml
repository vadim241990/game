import QtQuick 2.4
import QtQuick.Controls 1.4
import QtQuick.Window 2.2

ApplicationWindow //форма для всех остальных форм(для пропадания эффекта мерцания)
{
    id:select_windows_main
    width: Screen.width
    height: Screen.height
    visible: true
    visibility: "FullScreen"
    color: "blue"

    Item
    {
        id: item_loader_windows

        function settings_select(msg)
        {
            loader_windows.source = msg;
        }
    }

    Loader
    {
        id:loader_windows
        width: select_windows_main.width
        height: select_windows_main.height
        source: "main.qml"
        focus: true
    }

    Connections
    {
        target: loader_windows.item
    }
}

