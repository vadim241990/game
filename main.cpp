#include "./src/include/global_settings.h"
#include <QQuickWindow>
#include <QApplication>
#include <QQmlEngine>
#include <QQmlContext>
#include <QQmlComponent>
#include <QPixmap>
#include <QBitmap>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QPixmap PIX(":/other/image/other/er");     //курсор
    QBitmap PIX_2(":/other/image/other/mask"); //
    PIX.setMask(PIX_2);                        //
    QCursor T(PIX, 5 ,0);                      //
    app.setOverrideCursor(T);                  //

    //регистрация enums
    qmlRegisterUncreatableMetaObject( NameForSkill::staticMetaObject, "NameForSkill", 1, 0, "NameForSkill", "Cannot create namespace NameForSkill in QML" );
    qRegisterMetaType<NameForSkill::Skill>( "NameForSkillEnum" );

    global_settings * window = global_settings::global_settings_public(&app);

    QQmlEngine engine;
    engine.rootContext()->setContextProperty("applicationDirPath", QApplication::applicationDirPath());
    engine.rootContext()->setContextProperty("global_settings", window);
    QQmlComponent * component = new QQmlComponent(&engine);
    component->loadUrl(QUrl("qrc:/Select_window.qml"));
    component->create();

    return app.exec();
}
