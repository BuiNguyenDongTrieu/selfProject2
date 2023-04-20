#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "player.h"
#include <QQmlContext>
#include "playlistmodel.h"
#include "translation.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    qRegisterMetaType<QMediaPlaylist*>("QMediaPlaylist*");
    qmlRegisterType<Player>("myPlayer.Media", 1, 0, "MyPlayer");

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Translator translator(&app);
    Player player(&app);
    engine.rootContext()->setContextProperty("myModel",player.m_playlistModel);
    engine.rootContext()->setContextProperty("player",player.m_player);
    engine.rootContext()->setContextProperty("myPlayerApp",&player);
    engine.rootContext()->setContextProperty("Translator",&translator);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
