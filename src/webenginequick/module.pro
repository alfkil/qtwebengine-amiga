include($$QTWEBENGINE_OUT_ROOT/src/webenginequick/qtwebenginequick-config.pri)
QT_FOR_CONFIG += webenginequick-private webenginecore-private

TARGET = QtWebEngineQuick
MODULE = webenginequick

# For our export macros
DEFINES += QT_BUILD_WEBENGINE_LIB

QT += qml quick webenginecore
QT_PRIVATE += quick-private gui-private core-private webenginecore-private

QMAKE_DOCS = $$PWD/doc/qtwebengine.qdocconf

INCLUDEPATH += $$PWD api ../core ../core/api

SOURCES = \
        api/qquickwebengineaction.cpp \
        api/qquickwebengineclientcertificateselection.cpp \
        api/qquickwebenginedialogrequests.cpp \
        api/qquickwebenginehistory.cpp \
        api/qquickwebenginefaviconprovider.cpp \
        api/qquickwebenginenavigationrequest.cpp \
        api/qquickwebenginenewviewrequest.cpp \
        api/qquickwebengineprofile.cpp \
        api/qquickwebenginesettings.cpp \
        api/qquickwebenginesingleton.cpp \
        api/qquickwebenginetouchhandleprovider.cpp \
        api/qquickwebengineview.cpp \
        api/qtwebengineglobal.cpp \
        api/qquickwebenginescriptcollection.cpp \
        render_widget_host_view_qt_delegate_quick.cpp \
        render_widget_host_view_qt_delegate_quickwindow.cpp \
        ui_delegates_manager.cpp

HEADERS = \
        api/qtwebengineglobal.h \
        api/qtwebengineglobal_p.h \
        api/qquickwebengineaction_p.h \
        api/qquickwebengineaction_p_p.h \
        api/qquickwebengineclientcertificateselection_p.h \
        api/qquickwebenginedialogrequests_p.h \
        api/qquickwebenginehistory_p.h \
        api/qquickwebenginefaviconprovider_p_p.h \
        api/qquickwebenginenavigationrequest_p.h \
        api/qquickwebenginenewviewrequest_p.h \
        api/qquickwebengineprofile.h \
        api/qquickwebengineprofile_p.h \
        api/qquickwebenginesettings_p.h \
        api/qquickwebenginesingleton_p.h \
        api/qquickwebenginetouchhandleprovider_p_p.h \
        api/qquickwebengineview_p.h \
        api/qquickwebengineview_p_p.h \
        api/qquickwebenginescriptcollection.h \
        render_widget_host_view_qt_delegate_quick.h \
        render_widget_host_view_qt_delegate_quickwindow.h \
        ui_delegates_manager.h

!build_pass {
    python = $$pythonPathForShell()
    chromium_attributions.commands = \
        cd $$shell_quote($$shell_path($$PWD/../3rdparty)) && \
        $$python chromium/tools/licenses.py \
        --file-template ../../tools/about_credits.tmpl \
        --entry-template ../../tools/about_credits_entry.tmpl credits \
        $$shell_quote($$shell_path($$OUT_PWD/chromium_attributions.qdoc))
    chromium_attributions.CONFIG += phony

    QMAKE_EXTRA_TARGETS += chromium_attributions

    prepare_docs {
        prepare_docs.depends += chromium_attributions
    } else {
        html_docs.depends += chromium_attributions
    }
}

load(qt_module)
