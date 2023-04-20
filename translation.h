#ifndef TRANSLATOR_H
#define TRANSLATOR_H

#include <QObject>
#include <QTranslator>
#include <QGuiApplication>

class Translator : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString language READ language NOTIFY languageChanged)

public:
    explicit Translator(QObject *parent = nullptr);

    Q_INVOKABLE void setLanguage(QString lang);

    QString language() const;

signals:
    void languageChanged();
private:
    QTranslator m_translator;
    QGuiApplication* m_App;
    QString m_language;
};

#endif // TRANSLATOR_H
