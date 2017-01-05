TARGET   = virtualreality

TEMPLATE = lib

DEFINES += QT3DVR_LIBRARY

#MODULE   = virtualreality
QT      += qml quick \
           core core-private 3dcore 3dcore-private 3drender 3drender-private 3dinput 3dlogic 3dquick \
           qml qml-private 3dquick 3drender 3drender-private 3dlogic

# Qt3D is free of Q_FOREACH - make sure it stays that way:
DEFINES += QT_NO_FOREACH

#load(qt_module)

CONFIG += c++11

SOURCES += \
    backends/ovr/virtualrealityapiovr.cpp \
    backends/openvr/virtualrealityapiopenvr.cpp \
    qvirtualrealityapi.cpp \
    qheadmounteddisplay.cpp \
    qvrhmdview.cpp \
    qvrrendertarget.cpp \
    qvrcamera.cpp

HEADERS += \
    backends/ovr/virtualrealityapiovr.h \
    backends/openvr/virtualrealityapiopenvr.h \
    qvirtualrealityapi.h \
    qvirtualrealityapi_p.h \
    qvirtualrealityapibackend.h \
    qheadmounteddisplay.h \
    qvrhmdview.h \
    qt3dvr_global.h \
    qvrrendertarget.h \
    qvrcamera.h

target.path = $$[QT_INSTALL_EXAMPLES]/qt3d/$$TARGET
INSTALLS += target




###### OVR ######

#TODO: find_package(LibOVR)
LIBS += -L"C:/develop/OculusSDK/LibOVR/Lib/Windows/x64/Release/VS2015" -lLibOVR
LIBS += -L"E:/devel/OculusSDK/LibOVR/Lib/Windows/x64/Release/VS2015" -lLibOVR

#TODO: find_package(LibOpenVR)
LIBS += -L"C:/develop/openvr/lib/win64" -lopenvr_api
LIBS += -L"E:/devel/openvr/lib/win64" -lopenvr_api
LIBS += -L"C:/develop/openvr/bin/win64" -lopenvr_api
LIBS += -L"E:/devel/openvr/bin/win64" -lopenvr_api

#if windows
LIBS += -ldxgi
#endif

#TODO: find_package(LibOVR)
INCLUDEPATH += "C:/develop/OculusSDK/LibOVR/Include"
INCLUDEPATH += "E:/devel/OculusSDK/LibOVR/Include"

#TODO: find_package(LibOpenVR)
INCLUDEPATH += "C:/develop/openvr/headers"
INCLUDEPATH += "E:/devel/openvr/headers"