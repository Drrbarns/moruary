const PROTECTED_PREFIXES = ['/dashboard', '/admin', '/settings', '/select-branch'] as const

export function isProtectedPath(pathname: string): boolean {
    return PROTECTED_PREFIXES.some(
        (prefix) => pathname === prefix || pathname.startsWith(`${prefix}/`)
    )
}

export function shouldRefreshSession(pathname: string): boolean {
    return (
        isProtectedPath(pathname) ||
        pathname === '/auth' ||
        pathname.startsWith('/auth/')
    )
}
