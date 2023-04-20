#include "translation.h"
#include <QtDebug>

Translator::Translator(QObject *parent) : QObject(parent)
{
    this->m_translator.load(":/translate/translate_us.qm");
    this->m_App->installTranslator(&m_translator );
}

void Translator::setLanguage(QString lang)
{
    qDebug() << lang;
    if (0 == lang.compare("Vietnamese")) {
        m_translator.load(":/translate/translate_vn.qm");
    }
    else
        m_translator.load(":/translate/translate_us.qm");
    this->m_App->installTranslator(&m_translator );
    emit languageChanged();
}

QString Translator::language() const {
    return "";
}
