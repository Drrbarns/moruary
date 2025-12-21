'use client'

import { useState } from 'react'
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { cn } from '@/lib/utils'
import {
    Users,
    CalendarCheck,
    Wallet,
    ClipboardList,
    Clock,
    TrendingUp
} from 'lucide-react'

const hrNavItems = [
    { href: '', icon: Users, label: 'Staff Directory', description: 'Manage employees' },
    { href: '/attendance', icon: CalendarCheck, label: 'Attendance', description: 'Daily attendance tracking' },
    { href: '/payroll', icon: Wallet, label: 'Payroll', description: 'Salary & payments' },
    { href: '/leaves', icon: ClipboardList, label: 'Leave Management', description: 'Leave requests & balances' },
]

export default function HRLayout({
    children,
    branchId
}: {
    children: React.ReactNode
    branchId: string
}) {
    const pathname = usePathname()
    const basePath = `/dashboard/${branchId}/hr`

    const isActive = (href: string) => {
        const fullPath = `${basePath}${href}`
        if (href === '') return pathname === basePath || pathname === basePath + '/'
        return pathname.startsWith(fullPath)
    }

    return (
        <div className="min-h-screen bg-gray-50 dark:bg-gray-900">
            {/* HR Header */}
            <div className="bg-white dark:bg-gray-800 border-b">
                <div className="px-8 py-6">
                    <h1 className="text-3xl font-bold tracking-tight text-gray-900 dark:text-white">
                        HR & Staff Management
                    </h1>
                    <p className="text-muted-foreground mt-1">
                        Manage employees, attendance, payroll, and leave requests
                    </p>
                </div>

                {/* HR Navigation Tabs */}
                <div className="px-8">
                    <nav className="flex gap-1 overflow-x-auto pb-px">
                        {hrNavItems.map((item) => {
                            const active = isActive(item.href)
                            return (
                                <Link
                                    key={item.href}
                                    href={`${basePath}${item.href}`}
                                    className={cn(
                                        "flex items-center gap-2 px-4 py-3 text-sm font-medium border-b-2 transition-colors whitespace-nowrap",
                                        active
                                            ? "border-blue-600 text-blue-600"
                                            : "border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300"
                                    )}
                                >
                                    <item.icon className={cn("h-4 w-4", active ? "text-blue-600" : "text-gray-400")} />
                                    {item.label}
                                </Link>
                            )
                        })}
                    </nav>
                </div>
            </div>

            {/* Content */}
            <div className="p-8">
                {children}
            </div>
        </div>
    )
}
