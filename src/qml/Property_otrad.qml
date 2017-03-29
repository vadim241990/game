import QtQuick 2.4

Rectangle
{
    id: property_otrad
    width: parent.width
    height: parent.height
    color: "black"
    visible: false

    property string name_otrad: "";
    property string name_otrad_name: "";
    property bool battle: false;

    function parse_heroes_name_back(text)
    {
        var start_index = text.indexOf(":");
        start_index++; //не включая ":"
        var name = text.slice(start_index,text.length);
        return name;
    }

    function parse_heroes_name_first(text)
    {
        var end_index = text.indexOf(":");
        return text.slice(0,end_index);
    }

    function repaint()
    {
        property_image.source = name_otrad;
        var res = 0;
        var level = global_settings.get_level_team();
        if(level >= 25)         res = 4;
        else if(level >= 17)    res = 3;
        else if(level >= 10)    res = 2;
        else if(level >= 5)     res = 1;
        else                    res = 0;

        if(name_otrad_name === "Скелет")
            table_view.parsing_string((applicationDirPath + "/XML/xml_skelet.xml"),"skelet",res);
        else if(name_otrad_name === "Огр")
            table_view.parsing_string((applicationDirPath + "/XML/xml_ogr.xml"),"ogr",res);
        else if(name_otrad_name === "Лезвие льда")
            table_view.parsing_string((applicationDirPath + "/XML/xml_cold.xml"),"cold",res);
        else if(name_otrad_name === "Арбалетчик")
            table_view.parsing_string((applicationDirPath + "/XML/xml_arbaletshik.xml"),"arbaletshik",res);
        else if(name_otrad_name === "Владыка")
            table_view.parsing_string((applicationDirPath + "/XML/xml_fier.xml"),"fier",res);
        else if(name_otrad_name === "Темный ангел")
            table_view.parsing_string((applicationDirPath + "/XML/xml_angel.xml"),"angel",res);
        else if(name_otrad_name === "Маг тьмы")
            table_view.parsing_string((applicationDirPath + "/XML/xml_dark_mag.xml"),"dark_mag",res);
        else if(name_otrad_name === "Элементаль холода")
            table_view.parsing_string((applicationDirPath + "/XML/xml_elemental_cold.xml"),"elemental_cold",res);
        else if(name_otrad_name === "Элементаль молний")
            table_view.parsing_string((applicationDirPath + "/XML/xml_elemental_elektrisiti.xml"),"elemental_elektrisiti",res);
        else if(name_otrad_name === "Маг огня")
            table_view.parsing_string((applicationDirPath + "/XML/xml_fire_mag.xml"),"fier_mag",res);
        else if(name_otrad_name === "Голем")
            table_view.parsing_string((applicationDirPath + "/XML/xml_golem.xml"),"golem",res);
        else if(name_otrad_name === "Лекарь")
            table_view.parsing_string((applicationDirPath + "/XML/xml_lekar.xml"),"lekar",res);
        else if(name_otrad_name === "Лучник")
            table_view.parsing_string((applicationDirPath + "/XML/xml_luchnik.xml"),"luchnik",res);
        else if(name_otrad_name === "Маг молний")
            table_view.parsing_string((applicationDirPath + "/XML/xml_molniy_mag.xml"),"molniy_mag",res);
        else if(name_otrad_name === "Призрак")
            table_view.parsing_string((applicationDirPath + "/XML/xml_paralish.xml"),"paralish",res);
        else if(name_otrad_name === "Шаман")
            table_view.parsing_string((applicationDirPath + "/XML/xml_proklynaet.xml"),"proklynaet",res);
        else if(name_otrad_name === "Целитель")
            table_view.parsing_string((applicationDirPath + "/XML/xml_shelitel.xml"),"shelitel",res);
        else if(name_otrad_name === "Симбиот")
            table_view.parsing_string((applicationDirPath + "/XML/xml_simbiot.xml"),"simbiot",res);
        else if(name_otrad_name === "Вампир")
            table_view.parsing_string((applicationDirPath + "/XML/xml_vampir.xml"),"vampir",res);
        else if(name_otrad_name === "Всадник смерти")
            table_view.parsing_string((applicationDirPath + "/XML/xml_vsadnik.xml"),"vsadnik",res);
        else    //иначе герой
        {
            var res_1 = parse_heroes_name_first(name_otrad_name);
            var res_2 = parse_heroes_name_back(name_otrad_name);

            if(res_1 === "Воин")
                table_view.parsing_string((applicationDirPath + "/XML/heroes/xml_heroes_voin.xml"),"voin",0);
            else if(res_1 === "Маг")
                table_view.parsing_string((applicationDirPath + "/XML/heroes/xml_heroes_mag.xml"),"mag",0);
            else if(res_1 === "Лучник")
                table_view.parsing_string((applicationDirPath + "/XML/heroes/xml_heroes_luchnik.xml"),"luchnik",0);

            table_view.set_name(res_2);
        }
    }

    Image
    {
        id: fon
        width: parent.width
        height: parent.height
        source: "file:///" + applicationDirPath + "/image/army/fon_property.jpg"
    }

    Rectangle
    {
        id: border_property_image
        height: parent.height * 0.25
        width: border_property_image.height
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.025
        anchors.horizontalCenter: parent.horizontalCenter
        border.color: "white"
        border.width: 6
    }

    Image
    {
        id: property_image
        height: border_property_image.height - 6
        width: border_property_image.width - 6
        anchors.centerIn: border_property_image
    }

    Table_property
    {
        id: table_view
        width: parent.width * 0.5
        height: parent.height * 0.5
        anchors.top: property_image.bottom
        anchors.topMargin: parent.height * 0.025
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#00000000"
    }

    Image
    {
        id: close
        height: parent.height * 0.08
        width: close.height
        anchors.bottom: property_otrad.bottom
        anchors.bottomMargin: property_otrad.height * 0.03
        anchors.horizontalCenter: property_otrad.horizontalCenter
        source: "file:///" + applicationDirPath + "/image/army/close.png"

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true

            onHoveredChanged:
            {
                close.height = property_otrad.height * 0.1;
                close.anchors.bottomMargin = property_otrad.height * 0.02;
            }

            onExited:
            {
                close.height = property_otrad.height * 0.08;
                close.anchors.bottomMargin = property_otrad.height * 0.03;
            }

            onClicked:
            {
                property_otrad.visible = false;
            }
        }
    }

//    Text
//    {
//        id: name_otrad_text
//        color:"white"
//        text: name_otrad_name
//        font.family: "Segoe Print"
//        font.bold: true
//        font.pointSize: 24
//        anchors.top: parent.top
//        anchors.topMargin: parent.height * 0.01
//        anchors.left: parent.left
//        anchors.leftMargin: parent.width * 0.1
//        horizontalAlignment: Text.AlignHCenter
//        verticalAlignment: Text.AlignVCenter
//        fontSizeMode: Text.Fit
//        minimumPointSize: 8
//        height: parent.height * 0.1
//        width: parent.height * 0.3
//    }
}
