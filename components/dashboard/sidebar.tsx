'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { cn } from '@/lib/utils'
import type { Branch } from '@/lib/types'
import {
    LayoutDashboard,
    FileText,
    Wallet,
    FileBarChart,
    Users,
    History,
    Settings,
    Building2,
    LogOut
} from 'lucide-react'
import { Button } from '@/components/ui/button'
import { createClient } from '@/utils/supabase/client'
import { useRouter } from 'next/navigation'

const navItems = [
    { href: '', icon: LayoutDashboard, label: 'Dashboard' },
    { href: '/cases', icon: FileText, label: 'Cases' },
    { href: '/finance', icon: Wallet, label: 'Finance' },
    { href: '/reports', icon: FileBarChart, label: 'Reports' },
    { href: '/hr', icon: Users, label: 'HR' },
    { href: '/audit', icon: History, label: 'Audit' },
    { href: '/settings', icon: Settings, label: 'Settings' },
]

export function Sidebar({ branch, className }: { branch: Branch, className?: string }) {
    const pathname = usePathname()
    const router = useRouter()
    const supabase = createClient()

    // Helper to check active (exact or subpath)
    const isActive = (path: string) => {
        const fullPath = `/dashboard/${branch.code}${path}`
        if (path === '') return pathname === fullPath
        return pathname.startsWith(fullPath)
    }

    const handleSignOut = async () => {
        await supabase.auth.signOut()
        router.push('/auth/login')
    }

    return (
        <div className={cn("flex flex-col h-screen border-r bg-slate-900 text-slate-300", className)}>
            <div className="p-6 border-b border-slate-800">
                <h1 className="font-bold text-xl text-white tracking-wider">MORTUARY<span className="text-blue-500">SYS</span></h1>
            </div>

            <div className="flex-1 py-6 flex flex-col gap-1 overflow-y-auto">
                {navItems.map((item) => {
                    const active = isActive(item.href)
                    return (
                        <Link
                            key={item.href}
                            href={`/dashboard/${branch.code}${item.href}`}
                            className={cn(
                                "flex items-center gap-3 px-6 py-3 text-sm font-medium transition-colors hover:bg-slate-800 hover:text-white",
                                active && "bg-blue-600/10 text-blue-400 border-r-4 border-blue-500"
                            )}
                        >
                            <item.icon className={cn("h-4 w-4", active ? "text-blue-500" : "text-slate-400")} />
                            {item.label}
                        </Link>
                    )
                })}
            </div>

            <div className="p-4 border-t border-slate-800 space-y-2">
                <Link href="/select-branch?switch=true">
                    <Button variant="ghost" className="w-full justify-start text-slate-400 hover:text-white hover:bg-slate-800">
                        <Building2 className="mr-2 h-4 w-4" />
                        Switch Branch
                    </Button>
                </Link>
                <Button
                    variant="ghost"
                    className="w-full justify-start text-red-400 hover:text-red-300 hover:bg-red-950/30"
                    onClick={handleSignOut}
                >
                    <LogOut className="mr-2 h-4 w-4" />
                    Sign Out
                </Button>
            </div>
        </div>
    )
}
