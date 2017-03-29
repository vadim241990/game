import QtQuick 2.4
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.3

Rectangle
{
    id:main_rect

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

    function repaint(number)
    {
        if(number === 1)
        {
            if(global_settings.get_building("razvedka") === false)
            {
                gold_1.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                gold_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                gold_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                gold_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                gold_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else if(global_settings.get_building("gold_1") === false)
            {
                gold_1.source = "file:///" + applicationDirPath + "/image/building/gold_1_black.jpg";
                gold_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                gold_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                gold_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                gold_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                gold_1.source = "file:///" + applicationDirPath + "/image/building/gold_1.jpg";
                if(global_settings.get_building("gold_2") === false)
                {
                    gold_2.source = "file:///" + applicationDirPath + "/image/building/gold_2_black.jpg";
                    gold_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    gold_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    gold_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    gold_2.source = "file:///" + applicationDirPath + "/image/building/gold_2.jpg";
                    if(global_settings.get_building("gold_3") === false)
                    {
                        gold_3.source = "file:///" + applicationDirPath + "/image/building/gold_3_black.jpg";
                        gold_4.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        gold_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                    }
                    else
                    {
                        gold_3.source = "file:///" + applicationDirPath + "/image/building/gold_3.jpg";
                        if(global_settings.get_building("gold_4") === false)
                        {
                            gold_4.source = "file:///" + applicationDirPath + "/image/building/gold_4_black.jpg";
                            gold_5.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                        }
                        else
                        {
                            gold_4.source = "file:///" + applicationDirPath + "/image/building/gold_4.jpg";
                            if(global_settings.get_building("gold_5") === false)
                                gold_5.source = "file:///" + applicationDirPath + "/image/building/gold_5_black.jpg";
                            else
                                gold_5.source = "file:///" + applicationDirPath + "/image/building/gold_5.jpg";
                        }
                    }
                }
            }//конец проверки gold

            if(global_settings.get_building("razvedka") === false)
            {
                ruda_1.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                ruda_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                ruda_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else if(global_settings.get_building("ruda_1") === false)
            {
                ruda_1.source = "file:///" + applicationDirPath + "/image/building/ruda_1_black.jpg";
                ruda_2.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                ruda_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
            }
            else
            {
                ruda_1.source = "file:///" + applicationDirPath + "/image/building/ruda_1.jpg";
                if(global_settings.get_building("ruda_2") === false)
                {
                    ruda_2.source = "file:///" + applicationDirPath + "/image/building/ruda_2_black.jpg";
                    ruda_3.source = "file:///" + applicationDirPath + "/image/building/zamok_lock.jpg";
                }
                else
                {
                    ruda_2.source = "file:///" + applicationDirPath + "/image/building/ruda_2.jpg";
                    if(global_settings.get_building("ruda_3") === false)
                        ruda_3.source = "file:///" + applicationDirPath + "/image/building/ruda_3_black.jpg";
                    else
                        ruda_3.source = "file:///" + applicationDirPath + "/image/building/ruda_3.jpg";
                }
            }//конец проверки ruda

            if(global_settings.get_building("razvedka") === false)
                razvedka.source = "file:///" + applicationDirPath + "/image/building/razvedka_black.jpg";
            else
                razvedka.source = "file:///" + applicationDirPath + "/image/building/razvedka.jpg";
        }
    }

    Image
    {
        id: fon
        width: parent.width
        height: parent.height
        source: "file:///" + applicationDirPath + "/image/building/zamok_fon_home.jpg";

        Image
        {
            id: ruda_1
            width: ruda_1.height
            height: fon.height * 0.12
            anchors.horizontalCenter: fon.horizontalCenter
            anchors.top: fon.top
            anchors.topMargin: fon.height * 0.02
            visible: false
        }

        Image
        {
            id: strelka_ruda_2
            width: strelka_ruda_2.height
            height: fon.height * 0.07
            anchors.horizontalCenter: fon.horizontalCenter
            anchors.top: ruda_1.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
        }

        Image
        {
            id: ruda_2
            width: ruda_2.height
            height: fon.height * 0.12
            anchors.horizontalCenter: fon.horizontalCenter
            anchors.top: strelka_ruda_2.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
        }

        Image
        {
            id: strelka_ruda_3
            width: strelka_ruda_3.height
            height: fon.height * 0.07
            anchors.horizontalCenter: fon.horizontalCenter
            anchors.top: ruda_2.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
        }

        Image
        {
            id: ruda_3
            width: ruda_3.height
            height: fon.height * 0.12
            anchors.horizontalCenter: fon.horizontalCenter
            anchors.top: strelka_ruda_3.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
        }

        Image
        {
            id: gold_1
            width: gold_1.height
            height: fon.height * 0.12
            anchors.top: fon.top
            anchors.topMargin: fon.height * 0.02
            anchors.right: ruda_1.left
            anchors.rightMargin: fon.height * 0.15
            visible: false
        }

        Image
        {
            id: strelka_gold_2
            width: strelka_gold_2.height
            height: fon.height * 0.07
            anchors.horizontalCenter: gold_1.horizontalCenter
            anchors.top: gold_1.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
        }

        Image
        {
            id: gold_2
            width: gold_2.height
            height: fon.height * 0.12
            anchors.top: strelka_gold_2.bottom
            anchors.topMargin: fon.height * 0.005
            anchors.right: ruda_2.left
            anchors.rightMargin: fon.height * 0.15
            visible: false
        }

        Image
        {
            id: strelka_gold_3
            width: strelka_gold_3.height
            height: fon.height * 0.07
            anchors.horizontalCenter: gold_2.horizontalCenter
            anchors.top: gold_2.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
        }

        Image
        {
            id: gold_3
            width: gold_3.height
            height: fon.height * 0.12
            anchors.top: strelka_gold_3.bottom
            anchors.topMargin: fon.height * 0.005
            anchors.right: ruda_3.left
            anchors.rightMargin: fon.height * 0.15
            visible: false
        }

        Image
        {
            id: strelka_gold_4
            width: strelka_gold_4.height
            height: fon.height * 0.07
            anchors.horizontalCenter: gold_3.horizontalCenter
            anchors.top: gold_3.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
        }

        Image
        {
            id: gold_4
            width: gold_4.height
            height: fon.height * 0.12
            anchors.horizontalCenter: gold_3.horizontalCenter
            anchors.top: strelka_gold_4.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
        }

        Image
        {
            id: strelka_gold_5
            width: strelka_gold_5.height
            height: fon.height * 0.07
            anchors.horizontalCenter: gold_4.horizontalCenter
            anchors.top: gold_4.bottom
            anchors.topMargin: fon.height * 0.005
            source: "file:///" + applicationDirPath + "/image/building/strelka.png"
        }

        Image
        {
            id: gold_5
            width: gold_5.height
            height: fon.height * 0.12
            anchors.horizontalCenter: gold_4.horizontalCenter
            anchors.top: strelka_gold_5.bottom
            anchors.topMargin: fon.height * 0.005
            visible: false
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
        }

        Image
        {
            id: razvedka
            width: razvedka.height
            height: fon.height * 0.12
            anchors.top: fon.top
            anchors.topMargin: fon.height * 0.02
            anchors.left: ruda_1.right
            anchors.leftMargin: fon.height * 0.15
            visible: false
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
        }

        Blend
        {
            id: gold_1_ramka
            anchors.fill: gold_1
            source: gold_1
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    gold_1_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    gold_1_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(global_settings.get_building("razvedka") === false)
                      return;
                    menu_buy.visible = true;
                    menu_buy_image.source = gold_1.source;
                    menu_buy_text.text = "Начальная обработка золота";
                    menu_main_text.text = "Первичная добыча золота, которая позволяет получать 150 золотых в день.\n(Стоит: 250-золота и 2-руда.)";
                    button_visible("gold_1");
                }
            }
        }

        Blend
        {
            id: gold_2_ramka
            anchors.fill: gold_2
            source: gold_2
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    gold_2_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    gold_2_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(global_settings.get_building("gold_1") === false)
                      return;
                    menu_buy.visible = true;
                    menu_buy_image.source = gold_2.source;
                    menu_buy_text.text = "Полировка золота";
                    menu_main_text.text = "Обработка позволяет повысить качество золота,что повышает его стоимость. Прибыль от продажи увеличивается до 200 золотых в день.\n(Стоит: 400-золота и 3-руда.)";
                    button_visible("gold_2");
                }
            }
        }

        Blend
        {
            id: gold_3_ramka
            anchors.fill: gold_3
            source: gold_3
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    gold_3_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    gold_3_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(global_settings.get_building("gold_2") === false)
                      return;
                    menu_buy.visible = true;
                    menu_buy_image.source = gold_3.source;
                    menu_buy_text.text = "Чеканка монет";
                    menu_main_text.text = "Постройка позволяет выпускать монеты, четко фиксируя номинал изделия. Прибыль возростает до 250 золотых в день.\n(Стоит: 600-золота и 8-руда.)";
                    button_visible("gold_3");
                }
            }
        }

        Blend
        {
            id: gold_4_ramka
            anchors.fill: gold_4
            source: gold_4
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    gold_4_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    gold_4_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(global_settings.get_building("gold_3") === false)
                      return;
                    menu_buy.visible = true;
                    menu_buy_image.source = gold_4.source;
                    menu_buy_text.text = "Малые слитки золота";
                }
            }
        }

        Blend
        {
            id: gold_5_ramka
            anchors.fill: gold_5
            source: gold_5
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    gold_5_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    gold_5_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(global_settings.get_building("gold_4") === false)
                      return;
                    menu_buy.visible = true;
                    menu_buy_image.source = gold_5.source;
                    menu_buy_text.text = "Большие слитки золота";
                }
            }
        }

        Blend
        {
            id: ruda_1_ramka
            anchors.fill: ruda_1
            source: ruda_1
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    ruda_1_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    ruda_1_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(global_settings.get_building("razvedka") === false)
                      return;
                    menu_buy.visible = true;
                    menu_buy_image.source = ruda_1.source;
                    menu_buy_text.text = "Малый рудник";
                    menu_main_text.text = "Небольшая добыча руды позволит построить основные сооружения преисподни. Добыча рудного материала увеличится\
 до 2-х в день.\n(Стоит: 200-золота и 2-руда.)";
                    button_visible("ruda_1");
                }
            }
        }

        Blend
        {
            id: ruda_2_ramka
            anchors.fill: ruda_2
            source: ruda_2
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    ruda_2_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    ruda_2_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(global_settings.get_building("ruda_1") === false)
                      return;
                    menu_buy.visible = true;
                    menu_buy_image.source = ruda_2.source;
                    menu_buy_text.text = "Рудные залежи";
                    menu_main_text.text = "Расширяем рудное производство. Добыча рудного материала увеличится до 3-х в день.\n(Стоит: 450-золота и 3-руда.)";
                    button_visible("ruda_2");
                }
            }
        }

        Blend
        {
            id: ruda_3_ramka
            anchors.fill: ruda_3
            source: ruda_3
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    ruda_3_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    ruda_3_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    if(global_settings.get_building("ruda_2") === false)
                      return;
                    menu_buy.visible = true;
                    menu_buy_image.source = ruda_3.source;
                    menu_buy_text.text = "Большой рудник";
                }
            }
        }

        Blend
        {
            id: razvedka_ramka
            anchors.fill: razvedka
            source: razvedka
            foregroundSource: ramka
            mode: "normal"

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true

                onHoveredChanged:
                {
                    razvedka_ramka.foregroundSource = ramka_blue;
                }
                onExited:
                {
                    razvedka_ramka.foregroundSource = ramka;
                }
                onClicked:
                {
                    menu_buy.visible = true;
                    menu_buy_image.source = razvedka.source;
                    menu_buy_text.text = "Институт";
                    menu_main_text.text = "Обучает рабочих для добычи золота и руды и поиска их месторождений, \
а так же обучает персонал для разведки.\n(Стоит: 200-золота и 1-руда.)";
                    button_visible("razvedka");
                }
            }
        }

        Rectangle
        {
            id: menu_buy
            width: parent.width / 2
            height: parent.height / 2
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
                height: parent.height * 0.2
                anchors.horizontalCenter: menu_buy.horizontalCenter
                anchors.top: menu_buy.top
                anchors.topMargin: menu_buy.height * 0.03
                source: "file:///" + applicationDirPath + "/image/building/razvedka_black.jpg"
            }

            Image
            {
                id: close
                width: close.height
                height: parent.height * 0.15
                anchors.top: menu_buy.top
                anchors.topMargin: menu_buy.height * 0.055
                anchors.right: menu_buy.right
                anchors.rightMargin: menu_buy.width * 0.05
                source: "file:///" + applicationDirPath + "/image/building/close.png"

                MouseArea
                {
                    anchors.fill: parent
                    hoverEnabled: true

                    onHoveredChanged:
                    {
                        close.height = menu_buy.height * 0.17;
                        close.anchors.topMargin = menu_buy.height * 0.05
                        close.anchors.rightMargin = menu_buy.width * 0.045
                    }
                    onExited:
                    {
                        close.height = menu_buy.height * 0.15;
                        close.anchors.topMargin = menu_buy.height * 0.055
                        close.anchors.rightMargin = menu_buy.width * 0.05
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
                height: parent.height * 0.1
                wrapMode: TextEdit.WordWrap
                color: "lightgreen"
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 17
                anchors.top: menu_buy_image.bottom
                anchors.topMargin: menu_buy.height * 0.02
                anchors.horizontalCenter: menu_buy.horizontalCenter
                horizontalAlignment: Text.AlignHCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
            }

            Label
            {
                id:menu_main_text
                width: parent.width * 0.9
                height: parent.height * 0.4
                wrapMode: TextEdit.WordWrap
                color: "yellow"
                font.family: "Segoe Print"
                font.bold: true
                font.pointSize: 14
                anchors.top: menu_buy_text.bottom
                anchors.topMargin: menu_buy.height * 0.02
                anchors.horizontalCenter: menu_buy.horizontalCenter
                fontSizeMode: Text.Fit
                minimumPointSize: 8
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
                anchors.top: menu_main_text.bottom
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
                        if(menu_buy_text.text === "Начальная обработка золота"){
                            if((global_settings.get_resurs("gold") < 250) || (global_settings.get_resurs("ruda") < 2))
                                return;
                        }
                        if(menu_buy_text.text === "Полировка золота"){
                            if((global_settings.get_resurs("gold") < 400) || (global_settings.get_resurs("ruda") < 3))
                                return;
                        }
                        if(menu_buy_text.text === "Чеканка монет"){
                            if((global_settings.get_resurs("gold") < 600) || (global_settings.get_resurs("ruda") < 8))
                                return;
                        }
                        if(menu_buy_text.text === "Институт"){
                            if((global_settings.get_resurs("gold") < 200) || (global_settings.get_resurs("ruda") < 1))
                                return;
                        }
                        if(menu_buy_text.text === "Малый рудник"){
                            if((global_settings.get_resurs("gold") < 200) || (global_settings.get_resurs("ruda") < 2))
                                return;
                        }
                        if(menu_buy_text.text === "Рудные залежи"){
                            if((global_settings.get_resurs("gold") < 450) || (global_settings.get_resurs("ruda") < 3))
                                return;
                        }
                        menu_ok.color = "green";
                    }
                    onExited: {menu_ok.color = "lightgreen";}
                    onClicked:
                    {
                        var gold = global_settings.get_resurs("gold");
                        var ruda = global_settings.get_resurs("ruda");
                        if(menu_buy_text.text === "Начальная обработка золота"){
                            if((gold >= 250) && (ruda >= 2)){
                                global_settings.set_resurs("gold",(gold - 250));
                                global_settings.set_resurs("ruda",(ruda - 2));
                                global_settings.set_building("gold_1",true);
                                update_resurs();
                                repaint(1);
                                menu_buy.visible = false;
                            }
                            return;
                        }
                        if(menu_buy_text.text === "Полировка золота"){
                            if((gold >= 400) && (ruda >= 3)){
                                global_settings.set_resurs("gold",(gold - 400));
                                global_settings.set_resurs("ruda",(ruda - 3));
                                global_settings.set_building("gold_2",true);
                                update_resurs();
                                repaint(1);
                                menu_buy.visible = false;
                            }
                            return;
                        }
                        if(menu_buy_text.text === "Чеканка монет"){
                            if((gold >= 600) && (ruda >= 8)){
                                global_settings.set_resurs("gold",(gold - 600));
                                global_settings.set_resurs("ruda",(ruda - 8));
                                global_settings.set_building("gold_3",true);
                                update_resurs();
                                repaint(1);
                                menu_buy.visible = false;
                            }
                            return;
                        }

                        if(menu_buy_text.text === "Институт"){
                            if((gold >= 200) && (ruda >= 1)){
                                global_settings.set_resurs("gold",(gold - 200));
                                global_settings.set_resurs("ruda",(ruda - 1));
                                global_settings.set_building("razvedka",true);
                                update_resurs();
                                repaint(1);
                                menu_buy.visible = false;
                            }
                            return;
                        }
                        if(menu_buy_text.text === "Малый рудник"){
                            if((gold >= 200) && (ruda >= 2)){
                                global_settings.set_resurs("gold",(gold - 200));
                                global_settings.set_resurs("ruda",(ruda - 2));
                                global_settings.set_building("ruda_1",true);
                                update_resurs();
                                repaint(1);
                                menu_buy.visible = false;
                            }
                            return;
                        }
                        if(menu_buy_text.text === "Рудные залежи"){
                            if((gold >= 450) && (ruda >= 3)){
                                global_settings.set_resurs("gold",(gold - 450));
                                global_settings.set_resurs("ruda",(ruda - 3));
                                global_settings.set_building("ruda_2",true);
                                update_resurs();
                                repaint(1);
                                menu_buy.visible = false;
                            }
                            return;
                        }

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
                anchors.top: menu_main_text.bottom
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

