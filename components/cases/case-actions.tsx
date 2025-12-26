'use client'

import Link from 'next/link'
import { MoreHorizontal, Eye, Edit, LogOut } from 'lucide-react'
import { Button } from '@/components/ui/button'
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuTrigger,
    DropdownMenuSeparator,
} from '@/components/ui/dropdown-menu'
import { DeceasedCase } from '@/lib/types'

interface CaseActionsProps {
    caseItem: DeceasedCase
    branchCode: string
    branchId: string
}

export function CaseActions({ caseItem, branchCode, branchId }: CaseActionsProps) {
    return (
        <DropdownMenu>
            <DropdownMenuTrigger asChild>
                <Button variant="ghost" size="icon" className="h-8 w-8">
                    <MoreHorizontal className="h-4 w-4" />
                </Button>
            </DropdownMenuTrigger>
            <DropdownMenuContent align="end">
                <DropdownMenuItem asChild>
                    <Link href={`/dashboard/${branchCode}/cases/${caseItem.id}`}>
                        <Eye className="mr-2 h-4 w-4" />
                        View Details
                    </Link>
                </DropdownMenuItem>
                <DropdownMenuItem asChild>
                    <Link href={`/dashboard/${branchCode}/cases/${caseItem.id}/edit`}>
                        <Edit className="mr-2 h-4 w-4" />
                        Edit Case
                    </Link>
                </DropdownMenuItem>

                {caseItem.status === 'IN_CUSTODY' && (
                    <>
                        <DropdownMenuSeparator />
                        <DropdownMenuItem asChild>
                            <Link href={`/dashboard/${branchCode}/cases/${caseItem.id}/discharge`}>
                                <LogOut className="mr-2 h-4 w-4 text-orange-600" />
                                <span className="text-orange-600">Discharge Case</span>
                            </Link>
                        </DropdownMenuItem>
                    </>
                )}
            </DropdownMenuContent>
        </DropdownMenu>
    )
}
