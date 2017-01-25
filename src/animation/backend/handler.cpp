/****************************************************************************
**
** Copyright (C) 2016 Klaralvdalens Datakonsult AB (KDAB).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt3D module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include "handler_p.h"
#include <Qt3DAnimation/private/managers_p.h>
#include <Qt3DAnimation/private/loadanimationclipjob_p.h>
#include <Qt3DAnimation/private/findrunningclipanimatorsjob_p.h>
#include <Qt3DAnimation/private/animationlogging_p.h>

QT_BEGIN_NAMESPACE

namespace Qt3DAnimation {
namespace Animation {

Handler::Handler()
    : m_animationClipManager(new AnimationClipManager)
    , m_clipAnimatorManager(new ClipAnimatorManager)
    , m_blendedClipAnimatorManager(new BlendedClipAnimatorManager)
    , m_conductedClipAnimatorManager(new ConductedClipAnimatorManager)
    , m_channelMappingManager(new ChannelMappingManager)
    , m_channelMapperManager(new ChannelMapperManager)
    , m_loadAnimationClipJob(new LoadAnimationClipJob)
    , m_findRunningClipAnimatorsJob(new FindRunningClipAnimatorsJob)
{
    m_loadAnimationClipJob->setHandler(this);
    m_findRunningClipAnimatorsJob->setHandler(this);
}

Handler::~Handler()
{
}

void Handler::setDirty(DirtyFlag flag, Qt3DCore::QNodeId nodeId)
{
    switch (flag) {
    case AnimationClipDirty: {
        const auto handle = m_animationClipManager->lookupHandle(nodeId);
        m_dirtyAnimationClips.push_back(handle);
        break;
    }

    case ChannelMappingsDirty: {
        const auto handle = m_channelMapperManager->lookupHandle(nodeId);
        m_dirtyChannelMappers.push_back(handle);
        break;
    }

    case ClipAnimatorDirty: {
        const auto handle = m_clipAnimatorManager->lookupHandle(nodeId);
        m_dirtyClipAnimators.push_back(handle);
        break;
    }
    }
}

void Handler::setClipAnimatorRunning(const HClipAnimator &handle, bool running)
{
    // Add clip to running set if not already present
    if (running && !m_runningClipAnimators.contains(handle))
        m_runningClipAnimators.push_back(handle);

    // If being marked as not running, remove from set of running clips
    if (!running) {
        const auto it = std::find_if(m_runningClipAnimators.begin(),
                                     m_runningClipAnimators.end(),
                                     [handle](const HClipAnimator &h) { return h == handle; });
        if (it != m_runningClipAnimators.end())
            m_runningClipAnimators.erase(it);
    }
}

QVector<Qt3DCore::QAspectJobPtr> Handler::jobsToExecute(qint64 time)
{
    Q_UNUSED(time);
    QVector<Qt3DCore::QAspectJobPtr> jobs;

    // If there are any dirty animation clips that need loading,
    // queue up a job for them
    if (!m_dirtyAnimationClips.isEmpty()) {
        qCDebug(HandlerLogic) << "Added LoadAnimationClipJob";
        m_loadAnimationClipJob->addDirtyAnimationClips(m_dirtyAnimationClips);
        jobs.push_back(m_loadAnimationClipJob);
        m_dirtyAnimationClips.clear();
    }

    // If there are dirty clip animators, find the set that are able to
    // run. I.e. are marked as running and have animation clips and
    // channel mappings
    if (!m_dirtyClipAnimators.isEmpty()) {
        qCDebug(HandlerLogic) << "Added FindRunningClipAnimatorsJob";
        m_findRunningClipAnimatorsJob->setDirtyClipAnimators(m_dirtyClipAnimators);
        jobs.push_back(m_findRunningClipAnimatorsJob);
        m_dirtyClipAnimators.clear();
    }

    // TODO: Queue up a job to update the channel mapping table

    return jobs;
}

} // namespace Animation
} // namespace Qt3DAnimation

QT_END_NAMESPACE
