'use client'

import { useState } from 'react'
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
import { DischargeDialog } from './discharge-dialog'
import { DeceasedCase } from '@/lib/types'

interface CaseActionsProps {
    caseItem: DeceasedCase
    branchCode: string
    branchId: string
}

export function CaseActions({ caseItem, branchCode, branchId }: CaseActionsProps) {
    const [dischargeOpen, setDischargeOpen] = useState(false)

    // Calculate base total (Reg + Emb) for discharge dialog
    // Fallback to defaults if not set, but they should be set
    const regFee = caseItem.registration_fee || 350
    const embFee = caseItem.embalming_fee || 50
    const baseTotal = regFee + embFee

    return (
        <>
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
                            <DropdownMenuItem onSelect={(e) => {
                                e.preventDefault()
                                setDischargeOpen(true)
                            }}>
                                <LogOut className="mr-2 h-4 w-4 text-orange-600" />
                                <span className="text-orange-600">Discharge Case</span>
                            </DropdownMenuItem>
                        </>
                    )}
                </DropdownMenuContent>
            </DropdownMenu>

            {/* Render Dialog outside of Dropdown to avoid focus issues */}
            {dischargeOpen && (
                <DischargeDialog
                    caseId={caseItem.id}
                    admissionDate={caseItem.admission_date || caseItem.created_at}
                    caseType={caseItem.type || 'Normal'}
                    currentTotalBill={baseTotal}
                    totalPaid={caseItem.total_paid || 0}
                    branchId={branchId}
                    tagNo={caseItem.tag_no}
                    name={caseItem.name_of_deceased}
                />
            )}
        </>
    )
}
