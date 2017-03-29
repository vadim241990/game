import QtQuick 2.0
import QtQuick.Controls.Styles 1.3
import QtQuick.Controls 1.3


    Button
    {
        Component
        {
            id:button_hover_disabled
            ButtonStyle
            {
                background:Rectangle
                {
                    border.width: 4
                    border.color: "white"
                    radius: start_game.height * 0.5
                    gradient: Gradient
                    {
                        GradientStop { position: 0.0 ; color: "#000" }
                        GradientStop { position: 0.1 ; color: "#111" }
                        GradientStop { position: 0.2 ; color: "#222" }
                        GradientStop { position: 0.3 ; color: "#333" }
                        GradientStop { position: 0.4 ; color: "#444" }
                        GradientStop { position: 0.5 ; color: "#444" }
                        GradientStop { position: 0.6 ; color: "#444" }
                        GradientStop { position: 0.7 ; color: "#333" }
                        GradientStop { position: 0.8 ; color: "#222" }
                        GradientStop { position: 0.9 ; color: "#111" }
                        GradientStop { position: 1.0 ; color: "#000" }
                    }
                }
            }
        }

        Component
        {
            id:button_hover_enable
            ButtonStyle
            {
                background:Rectangle
                {
                    border.width: 4
                    border.color: "white"
                    radius: start_game.height * 0.5
                    gradient: Gradient
                    {
                        GradientStop { position: 0.0 ; color: "#000" }
                        GradientStop { position: 0.1 ; color: "#111" }
                        GradientStop { position: 0.2 ; color: "#222" }
                        GradientStop { position: 0.3 ; color: "#333" }
                        GradientStop { position: 0.4 ; color: "#090" }
                        GradientStop { position: 0.5 ; color: "#0c0" }
                        GradientStop { position: 0.6 ; color: "#090" }
                        GradientStop { position: 0.7 ; color: "#333" }
                        GradientStop { position: 0.8 ; color: "#222" }
                        GradientStop { position: 0.9 ; color: "#111" }
                        GradientStop { position: 1.0 ; color: "#000" }
                    }
                }
            }
        }

        Component
        {
            id:button_clicked
            ButtonStyle
            {
                background:Rectangle
                {
                    border.width: 4
                    border.color: "white"
                    radius: start_game.height * 0.5
                    gradient: Gradient
                    {
                        GradientStop { position: 0.0 ; color: "#006" }
                        GradientStop { position: 0.1 ; color: "#006" }
                        GradientStop { position: 0.2 ; color: "#007" }
                        GradientStop { position: 0.3 ; color: "#009" }
                        GradientStop { position: 0.4 ; color: "#00a" }
                        GradientStop { position: 0.5 ; color: "#00f" }
                        GradientStop { position: 0.6 ; color: "#00a" }
                        GradientStop { position: 0.7 ; color: "#009" }
                        GradientStop { position: 0.8 ; color: "#007" }
                        GradientStop { position: 0.9 ; color: "#006" }
                        GradientStop { position: 1.0 ; color: "#006" }
                    }
                }
            }
        }
        id:start_game
        style: button_hover_disabled

        onPressedChanged:
        {
            start_game.style = button_clicked
        }
        onHoveredChanged:
        {
            if(start_game.hovered == true)  {start_game.style = button_hover_enable}
            else                            {start_game.style = button_hover_disabled}
        }
    }
