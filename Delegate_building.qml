import QtQuick 2.0

Item
{
    id: delegate_item

    property string name: ""
    property string value: ""
    property string color_type: "black"

    Row
    {
        id: row
        anchors.right: parent.right
        anchors.left: parent.left
        spacing: 5

        Text
        {
            color: color_type
            width: delegate_item.parent.width / 2
            horizontalAlignment: Text.AlignHCenter
            text: name
        }

        Text
        {
            color: color_type
            width: delegate_item.parent.width / 2
            horizontalAlignment: Text.AlignHCenter
            wrapMode: TextEdit.WordWrap
            text: value
        }
    }
}

