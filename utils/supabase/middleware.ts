import { createServerClient } from '@supabase/ssr'
import { NextResponse, type NextRequest } from 'next/server'

export async function updateSession(request: NextRequest) {
    let response = NextResponse.next({
        request: {
            headers: request.headers,
        },
    })

    const supabase = createServerClient(
        process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://placeholder.supabase.co',
        process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || 'placeholder-key',
        {
            cookies: {
                getAll() {
                    return request.cookies.getAll()
                },
                setAll(cookiesToSet) {
                    cookiesToSet.forEach(({ name, value, options }) =>
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

    const {
        data: { user },
    } = await supabase.auth.getUser()

    // Protected routes regex (starts with /dashboard, /admin, etc)
    const protectedPaths = [/^\/dashboard/, /^\/admin/, /^\/settings/]
    const isProtected = protectedPaths.some(rx => rx.test(request.nextUrl.pathname))

    if (!user && isProtected) {
        const url = request.nextUrl.clone()
        url.pathname = '/auth/login'
        return NextResponse.redirect(url)
    }

    // Redirect authenticated users trying to access login/register
    if (user && request.nextUrl.pathname.startsWith('/auth')) {
        // You might want to skip this or redirect to dashboard
        // const url = request.nextUrl.clone()
        // url.pathname = '/dashboard'
        // return NextResponse.redirect(url)
    }

    return response
}
