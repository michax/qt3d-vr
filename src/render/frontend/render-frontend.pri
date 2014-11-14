INCLUDEPATH += $$PWD

include(framegraph-components/framegraph-components.pri)

HEADERS += \
    $$PWD/qmaterial.h \
    $$PWD/qmesh.h \
    $$PWD/qrenderpass.h \
    $$PWD/qshaderprogram.h \
    $$PWD/qshaderprogram_p.h \
    $$PWD/qtechnique.h \
    $$PWD/qitemmodelbuffer.h \
    $$PWD/qtexture.h \
    $$PWD/sphere.h \
    $$PWD/qabstractsceneloader.h \
    $$PWD/qeffect.h \
    $$PWD/qsceneloader.h \
    $$PWD/qparameter.h \
    $$PWD/qparameter_p.h \
    $$PWD/qcylindermesh.h \
    $$PWD/qtorusmesh.h \
    $$PWD/qspheremesh.h \
    $$PWD/qmesh_p.h \
    $$PWD/qabstractlight.h \
    $$PWD/qpointlight.h \
    $$PWD/qspotlight.h \
    $$PWD/qdirectionallight.h \
    $$PWD/qabstractlight_p.h \
    $$PWD/qspotlight_p.h \
    $$PWD/qdirectionallight_p.h \
    $$PWD/qpointlight_p.h \
    $$PWD/qmaterial_p.h \
    $$PWD/qeffect_p.h \
    $$PWD/qtechnique_p.h \
    $$PWD/qabstractsceneloader_p.h \
    $$PWD/qrenderpass_p.h \
    $$PWD/qlayer.h \
    $$PWD/qlayer_p.h \
    $$PWD/qopenglfilter.h \
    $$PWD/qplanemesh.h \
    $$PWD/qplanemesh_p.h \
    $$PWD/qcuboidmesh.h \
    $$PWD/qcuboidmesh_p.h \
    $$PWD/qblendstate.h \
    $$PWD/qblendequation.h \
    $$PWD/qalphatest.h \
    $$PWD/qdepthtest.h \
    $$PWD/qdepthmask.h \
    $$PWD/qcullface.h \
    $$PWD/qfrontface.h \
    $$PWD/qstenciltest.h \
    $$PWD/qscissortest.h \
    $$PWD/qdithering.h \
    $$PWD/qrenderstate.h \
    $$PWD/qrenderattachment.h \
    $$PWD/qrenderattachment_p.h \
    $$PWD/qrendertarget.h \
    $$PWD/qrendertarget_p.h \
    $$PWD/qrenderstate_p.h \
    $$PWD/qalphacoverage.h \
    $$PWD/qannotation.h \
    $$PWD/qannotation_p.h \
    $$PWD/qabstractmesh_p.h \
    $$PWD/qabstractmesh.h \
    $$PWD/qparametermapping_p.h \
    $$PWD/qparametermapping.h \
    $$PWD/qshaderdata.h \
    $$PWD/qshaderdata_p.h

SOURCES += \
    $$PWD/qmaterial.cpp \
    $$PWD/qmesh.cpp \
    $$PWD/qrenderpass.cpp \
    $$PWD/qshaderprogram.cpp \
    $$PWD/qtechnique.cpp \
    $$PWD/qitemmodelbuffer.cpp \
    $$PWD/qtexture.cpp \
    $$PWD/sphere.cpp \
    $$PWD/qabstractsceneloader.cpp \
    $$PWD/qeffect.cpp \
    $$PWD/qsceneloader.cpp \
    $$PWD/qparameter.cpp \
    $$PWD/qcylindermesh.cpp \
    $$PWD/qtorusmesh.cpp \
    $$PWD/qspheremesh.cpp \
    $$PWD/qabstractlight.cpp \
    $$PWD/qpointlight.cpp \
    $$PWD/qspotlight.cpp \
    $$PWD/qdirectionallight.cpp \
    $$PWD/qlayer.cpp \
    $$PWD/qopenglfilter.cpp \
    $$PWD/qplanemesh.cpp \
    $$PWD/qcuboidmesh.cpp \
    $$PWD/qblendstate.cpp \
    $$PWD/qblendequation.cpp \
    $$PWD/qalphatest.cpp \
    $$PWD/qdepthtest.cpp \
    $$PWD/qdepthmask.cpp \
    $$PWD/qcullface.cpp \
    $$PWD/qfrontface.cpp \
    $$PWD/qstenciltest.cpp \
    $$PWD/qscissortest.cpp \
    $$PWD/qdithering.cpp \
    $$PWD/qrenderstate.cpp \
    $$PWD/qrenderattachment.cpp \
    $$PWD/qrendertarget.cpp \
    $$PWD/qalphacoverage.cpp \
    $$PWD/qannotation.cpp \
    $$PWD/qabstractmesh.cpp \
    $$PWD/qparametermapping.cpp \
    $$PWD/qshaderdata.cpp
