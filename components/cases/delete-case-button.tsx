'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import { Trash2, Loader2 } from 'lucide-react'
import { Button } from '@/components/ui/button'
import {
    AlertDialog,
    AlertDialogAction,
    AlertDialogCancel,
    AlertDialogContent,
    AlertDialogDescription,
    AlertDialogFooter,
    AlertDialogHeader,
    AlertDialogTitle,
    AlertDialogTrigger,
} from '@/components/ui/alert-dialog'
import { deleteCase } from '@/app/actions/delete-case'
import { toast } from 'sonner'

interface DeleteCaseButtonProps {
    caseId: string
    branchCode: string // Need code for redirect
    caseName: string
    className?: string
    variant?: 'default' | 'destructive' | 'outline' | 'ghost' | 'link'
    size?: 'default' | 'sm' | 'lg' | 'icon'
    iconOnly?: boolean
}

export function DeleteCaseButton({
    caseId,
    branchCode,
    caseName,
    className,
    variant = 'destructive',
    size = 'default',
    iconOnly = false
}: DeleteCaseButtonProps) {
    const [open, setOpen] = useState(false)
    const [isDeleting, setIsDeleting] = useState(false)
    const router = useRouter()

    const handleDelete = async () => {
        setIsDeleting(true)
        try {
            const result = await deleteCase(caseId, branchCode)
            if (result.error) {
                toast.error(result.error)
            } else {
                toast.success('Case deleted successfully')
                setOpen(false)
                // Redirect to cases list
                router.push(`/dashboard/${branchCode}/cases`)
                router.refresh()
            }
        } catch (error) {
            toast.error('An unexpected error occurred')
        } finally {
            setIsDeleting(false)
        }
    }

    return (
        <AlertDialog open={open} onOpenChange={setOpen}>
            <AlertDialogTrigger asChild>
                <Button variant={variant} size={size} className={className}>
                    <Trash2 className={`h-4 w-4 ${iconOnly ? '' : 'mr-2'}`} />
                    {!iconOnly && "Delete Case"}
                </Button>
            </AlertDialogTrigger>
            <AlertDialogContent>
                <AlertDialogHeader>
                    <AlertDialogTitle>Are you sure?</AlertDialogTitle>
                    <AlertDialogDescription>
                        This will permanently delete the case for <span className="font-semibold text-foreground">{caseName}</span>.
                        This action cannot be undone and will remove all associated data including payments and records.
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
    )
}
