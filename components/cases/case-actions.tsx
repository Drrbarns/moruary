'use client'

import { useState } from 'react'
import Link from 'next/link'
import { MoreHorizontal, Eye, Edit, LogOut, Trash2, Loader2 } from 'lucide-react'
import { Button } from '@/components/ui/button'
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuTrigger,
    DropdownMenuSeparator,
} from '@/components/ui/dropdown-menu'
import {
    AlertDialog,
    AlertDialogAction,
    AlertDialogCancel,
    AlertDialogContent,
    AlertDialogDescription,
    AlertDialogFooter,
    AlertDialogHeader,
    AlertDialogTitle,
} from '@/components/ui/alert-dialog'
import { DeceasedCase } from '@/lib/types'
import { deleteCase } from '@/app/actions/delete-case'
import { toast } from 'sonner'
import { useRouter } from 'next/navigation'

interface CaseActionsProps {
    caseItem: DeceasedCase
    branchCode: string
    branchId: string
    isAdmin?: boolean
}

export function CaseActions({ caseItem, branchCode, branchId, isAdmin }: CaseActionsProps) {
    const [showDeleteAlert, setShowDeleteAlert] = useState(false)
    const [isDeleting, setIsDeleting] = useState(false)
    const router = useRouter()

    const handleDelete = async () => {
        setIsDeleting(true)
        try {
            const result = await deleteCase(caseItem.id, branchCode)
            if (result.error) {
                toast.error(result.error)
            } else {
                toast.success('Case deleted successfully')
                setShowDeleteAlert(false)
                router.refresh()
            }
        } catch (error) {
            toast.error('An unexpected error occurred')
        } finally {
            setIsDeleting(false)
        }
    }

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
                            <DropdownMenuItem asChild>
                                <Link href={`/dashboard/${branchCode}/cases/${caseItem.id}`}>
                                    <LogOut className="mr-2 h-4 w-4 text-orange-600" />
                                    <span className="text-orange-600">Discharge Case</span>
                                </Link>
                            </DropdownMenuItem>
                        </>
                    )}

                    {isAdmin && (
                        <>
                            <DropdownMenuSeparator />
                            <DropdownMenuItem
                                onSelect={(e) => {
                                    e.preventDefault()
                                    setShowDeleteAlert(true)
                                }}
                                className="text-red-600 focus:text-red-600"
                            >
                                <Trash2 className="mr-2 h-4 w-4" />
                                Delete Case
                            </DropdownMenuItem>
                        </>
                    )}
                </DropdownMenuContent>
            </DropdownMenu>

            <AlertDialog open={showDeleteAlert} onOpenChange={setShowDeleteAlert}>
                <AlertDialogContent>
                    <AlertDialogHeader>
                        <AlertDialogTitle>Are you absolutely sure?</AlertDialogTitle>
                        <AlertDialogDescription>
                            This will permanently delete the case for <span className="font-semibold text-foreground">{caseItem.name_of_deceased}</span>.
                            This action cannot be undone.
                        </AlertDialogDescription>
                    </AlertDialogHeader>
                    <AlertDialogFooter>
                        <AlertDialogCancel disabled={isDeleting}>Cancel</AlertDialogCancel>
                        <AlertDialogAction
                            onClick={(e) => {
                                e.preventDefault()
                                handleDelete()
                            }}
                            className="bg-red-600 hover:bg-red-700"
                            disabled={isDeleting}
                        >
                            {isDeleting ? (
                                <>
                                    <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                                    Deleting...
                                </>
                            ) : (
                                'Delete Case'
                            )}
                        </AlertDialogAction>
                    </AlertDialogFooter>
                </AlertDialogContent>
            </AlertDialog>
        </>
    )
}
