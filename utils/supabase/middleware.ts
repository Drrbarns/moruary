import { createServerClient } from '@supabase/ssr'
import { NextResponse, type NextRequest } from 'next/server'
import { isProtectedPath, shouldRefreshSession } from '@/lib/auth-paths'

const AUTH_TIMEOUT_MS = 4000

function isSupabaseConfigured(): boolean {
    const url = process.env.NEXT_PUBLIC_SUPABASE_URL
    const key = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
    return Boolean(
        url &&
        key &&
        !url.includes('placeholder.supabase.co') &&
        key !== 'placeholder-key'
    )
}

async function getUserWithTimeout(
    getUser: () => Promise<{ data: { user: unknown } }>
) {
    return Promise.race([
        getUser(),
        new Promise<never>((_, reject) => {
            setTimeout(() => reject(new Error('Auth timeout')), AUTH_TIMEOUT_MS)
        }),
    ])
}

export async function updateSession(request: NextRequest) {
    const { pathname } = request.nextUrl

    if (!shouldRefreshSession(pathname)) {
        return NextResponse.next({
            request: {
                headers: request.headers,
            },
        })
    }

    if (!isSupabaseConfigured()) {
        if (isProtectedPath(pathname)) {
            const url = request.nextUrl.clone()
            url.pathname = '/auth/login'
            return NextResponse.redirect(url)
        }
        return NextResponse.next({
            request: {
                headers: request.headers,
            },
        })
    }

    let response = NextResponse.next({
        request: {
            headers: request.headers,
        },
    })

    const supabase = createServerClient(
        process.env.NEXT_PUBLIC_SUPABASE_URL!,
        process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
        {
            cookies: {
                getAll() {
                    return request.cookies.getAll()
                },
                setAll(cookiesToSet) {
                    cookiesToSet.forEach(({ name, value }) =>
                        request.cookies.set(name, value)
                    )
                    response = NextResponse.next({
                        request: {
                            headers: request.headers,
                        },
                    })
                    cookiesToSet.forEach(({ name, value, options }) =>
                        response.cookies.set(name, value, options)
                    )
                },
            },
        }
    )

    let user: { id?: string } | null = null
    try {
        const result = await getUserWithTimeout(() => supabase.auth.getUser())
        user = result.data.user as { id?: string } | null
    } catch {
        user = null
    }

    if (!user && isProtectedPath(pathname)) {
        const url = request.nextUrl.clone()
        url.pathname = '/auth/login'
        return NextResponse.redirect(url)
    }

    return response
}
