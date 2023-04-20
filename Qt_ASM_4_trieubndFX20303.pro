QT += quick core multimedia

CONFIG += c++11
CONFIG += resources_big

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

LIBS += -ltag

SOURCES += \
        main.cpp \
        player.cpp \
        playlistmodel.cpp \
        translation.cpp

RESOURCES += qml.qrc \
    resource.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

TRANSLATIONS +=  translate/translate_vn.ts\
                 translate/translate_us.ts

HEADERS += \
    player.h \
    playlistmodel.h \
    translation.h

DISTFILES += \
    translate/translate_us.qm \
    translate/translate_vn.qm
