'use client'

import { useState } from 'react'
import { Sidebar } from '@/components/dashboard/sidebar'
import type { Branch } from '@/lib/types'
import { Menu, X } from 'lucide-react'
import { Button } from '@/components/ui/button'

export function DashboardLayoutClient({
    children,
    branch,
    userRole
}: {
    children: React.ReactNode
    branch: Branch
    userRole: string
}) {
    const [isSidebarOpen, setIsSidebarOpen] = useState(false)

    return (
        <div className="flex min-h-screen bg-gray-50 dark:bg-gray-900">
            {/* Desktop Sidebar */}
            <div className="hidden md:flex flex-col w-64 fixed inset-y-0 z-50">
                <Sidebar branch={branch} userRole={userRole} />
            </div>

            {/* Mobile Sidebar Overlay */}
            {isSidebarOpen && (
                <div
                    className="fixed inset-0 z-50 bg-black/50 md:hidden"
                    onClick={() => setIsSidebarOpen(false)}
                >
                    <div
                        className="fixed inset-y-0 left-0 w-64 bg-slate-900 shadow-lg transition-transform duration-300 transform translate-x-0"
                        onClick={(e) => e.stopPropagation()}
                    >
                        <div className="absolute top-4 right-4 z-50">
                            <Button
                                variant="ghost"
                                size="icon"
                                className="text-slate-400 hover:text-white"
                                onClick={() => setIsSidebarOpen(false)}
                            >
                                <X className="h-6 w-6" />
                            </Button>
                        </div>
                        <Sidebar
                            branch={branch}
                            userRole={userRole}
                            onNavigate={() => setIsSidebarOpen(false)}
                        />
                    </div>
                </div>
            )}

            <div className="flex-1 md:pl-64 transition-all duration-300 flex flex-col">
                {/* Mobile Header */}
                <header className="md:hidden flex items-center p-4 bg-slate-900 text-white border-b border-slate-800 sticky top-0 z-40">
                    <Button
                        variant="ghost"
                        size="icon"
                        className="text-slate-300 hover:text-white hover:bg-slate-800 mr-2"
                        onClick={() => setIsSidebarOpen(true)}
                    >
                        <Menu className="h-6 w-6" />
                    </Button>
                    <span className="font-bold text-lg">MORTUARY<span className="text-blue-500">SYS</span></span>
                </header>

                <main className="flex-1 h-full">
                    {children}
                </main>
            </div>
        </div>
    )
}
