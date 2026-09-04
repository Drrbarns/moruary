import assert from 'node:assert/strict'
import { describe, it } from 'node:test'
import { isProtectedPath, shouldRefreshSession } from './auth-paths'

describe('isProtectedPath', () => {
    it('treats staff areas as protected', () => {
        assert.equal(isProtectedPath('/dashboard'), true)
        assert.equal(isProtectedPath('/dashboard/asanteman'), true)
        assert.equal(isProtectedPath('/select-branch'), true)
        assert.equal(isProtectedPath('/admin'), true)
        assert.equal(isProtectedPath('/settings'), true)
    })

    it('does not treat the public site as protected', () => {
        assert.equal(isProtectedPath('/'), false)
        assert.equal(isProtectedPath('/auth/login'), false)
        assert.equal(isProtectedPath('/images/ampah-logo.png'), false)
    })
})

describe('shouldRefreshSession', () => {
    it('skips the marketing homepage', () => {
        assert.equal(shouldRefreshSession('/'), false)
    })

    it('runs on staff and auth routes only', () => {
        assert.equal(shouldRefreshSession('/dashboard/asuom'), true)
        assert.equal(shouldRefreshSession('/auth/login'), true)
        assert.equal(shouldRefreshSession('/select-branch'), true)
    })
})
