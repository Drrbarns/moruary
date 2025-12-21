'use client'

import { useState } from 'react'
import { Button } from '@/components/ui/button'
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
} from '@/components/ui/dialog'
import { Textarea } from '@/components/ui/textarea'
import { Label } from '@/components/ui/label'
import { createClient } from '@/utils/supabase/client'
import { useRouter } from 'next/navigation'
import { Check, X, Loader2 } from 'lucide-react'
import { toast } from 'sonner'

interface LeaveActionButtonsProps {
    requestId: string
    employeeName?: string
}

export default function LeaveActionButtons({ requestId, employeeName }: LeaveActionButtonsProps) {
    const [loading, setLoading] = useState<'approve' | 'reject' | null>(null)
    const [rejectDialogOpen, setRejectDialogOpen] = useState(false)
    const [rejectionReason, setRejectionReason] = useState('')
    const router = useRouter()
    const supabase = createClient()

    const handleApprove = async () => {
        setLoading('approve')
        try {
            const { data: { user } } = await supabase.auth.getUser()

            const { error } = await supabase
                .from('leave_requests')
                .update({
                    status: 'APPROVED',
                    approved_by: user?.id,
                    approved_at: new Date().toISOString(),
                    updated_at: new Date().toISOString()
                })
                .eq('id', requestId)

            if (error) throw error

            toast.success('Leave request approved')
            router.refresh()
        } catch (error) {
            console.error('Error approving leave:', error)
            toast.error('Failed to approve leave request')
        } finally {
            setLoading(null)
        }
    }

    const handleReject = async () => {
        setLoading('reject')
        try {
            const { data: { user } } = await supabase.auth.getUser()

            const { error } = await supabase
                .from('leave_requests')
                .update({
                    status: 'REJECTED',
                    approved_by: user?.id,
                    approved_at: new Date().toISOString(),
                    rejection_reason: rejectionReason,
                    updated_at: new Date().toISOString()
                })
                .eq('id', requestId)

            if (error) throw error

            toast.success('Leave request rejected')
            setRejectDialogOpen(false)
            router.refresh()
        } catch (error) {
            console.error('Error rejecting leave:', error)
            toast.error('Failed to reject leave request')
        } finally {
            setLoading(null)
        }
    }

    return (
        <>
            <div className="flex gap-1">
                <Button
                    size="sm"
                    variant="outline"
                    className="h-8 px-2 text-green-600 hover:bg-green-50 hover:text-green-700"
                    onClick={handleApprove}
                    disabled={loading !== null}
                >
                    {loading === 'approve' ? (
                        <Loader2 className="h-4 w-4 animate-spin" />
                    ) : (
                        <Check className="h-4 w-4" />
                    )}
                </Button>
                <Button
                    size="sm"
                    variant="outline"
                    className="h-8 px-2 text-red-600 hover:bg-red-50 hover:text-red-700"
                    onClick={() => setRejectDialogOpen(true)}
                    disabled={loading !== null}
                >
                    <X className="h-4 w-4" />
                </Button>
            </div>

            <Dialog open={rejectDialogOpen} onOpenChange={setRejectDialogOpen}>
                <DialogContent className="sm:max-w-md">
                    <DialogHeader>
                        <DialogTitle>Reject Leave Request</DialogTitle>
                        <DialogDescription>
                            Are you sure you want to reject this leave request from {employeeName}?
                        </DialogDescription>
                    </DialogHeader>
                    <div className="grid gap-2 py-4">
                        <Label htmlFor="reason">Reason for rejection (optional)</Label>
                        <Textarea
                            id="reason"
                            placeholder="Enter reason..."
                            value={rejectionReason}
                            onChange={(e) => setRejectionReason(e.target.value)}
                            rows={3}
                        />
                    </div>
                    <DialogFooter>
                        <Button variant="outline" onClick={() => setRejectDialogOpen(false)}>
                            Cancel
                        </Button>
                        <Button
                            onClick={handleReject}
                            disabled={loading === 'reject'}
                            variant="destructive"
                        >
                            {loading === 'reject' && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                            Reject Request
                        </Button>
                    </DialogFooter>
                </DialogContent>
            </Dialog>
        </>
    )
}
