import { createClient } from '@/utils/supabase/server'
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import {
    Table,
    TableBody,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table'
import { Input } from '@/components/ui/input'
import { History, Search, User, FileText, CreditCard, Settings, LogIn } from 'lucide-react'
import type { AuditLog } from '@/lib/types'
import { resolveBranch } from '@/lib/branch-resolver'
import { notFound } from 'next/navigation'

const actionColors: Record<string, string> = {
    CREATE: 'bg-green-100 text-green-800',
    UPDATE: 'bg-blue-100 text-blue-800',
    DELETE: 'bg-red-100 text-red-800',
    LOGIN: 'bg-purple-100 text-purple-800',
    LOGOUT: 'bg-gray-100 text-gray-800',
    DISCHARGE: 'bg-amber-100 text-amber-800',
}

const entityIcons: Record<string, any> = {
    case: FileText,
    payment: CreditCard,
    user: User,
    settings: Settings,
}

export default async function AuditPage({ params }: { params: Promise<{ branchId: string }> }) {
    const { branchId } = await params
    const supabase = await createClient()

    // Resolve branch from code or UUID
    const branch = await resolveBranch(branchId)
    if (!branch) notFound()

    // Fetch audit logs for this branch
    const { data: logsData } = await supabase
        .from('audit_logs')
        .select('*, actor:profiles(full_name)')
        .eq('branch_id', branch.id)
        .order('created_at', { ascending: false })
        .limit(100)

    const logs = (logsData || []) as (AuditLog & { actor: { full_name: string } | null })[]

    return (
        <div className="space-y-6 p-8">
            {/* Header */}
            <div>
                <h1 className="text-3xl font-bold tracking-tight">Audit Logs</h1>
                <p className="text-muted-foreground">Track all system activities and changes</p>
            </div>

            {/* Logs Table */}
            <Card>
                <CardHeader className="pb-3">
                    <div className="flex flex-col md:flex-row md:items-center gap-4">
                        <CardTitle className="flex items-center gap-2">
                            <History className="h-5 w-5 text-blue-600" />
                            Activity Log
                        </CardTitle>
                        <div className="flex-1" />
                        <div className="relative w-full md:w-64">
                            <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                            <Input placeholder="Search logs..." className="pl-10" />
                        </div>
                    </div>
                </CardHeader>
                <CardContent className="p-0">
                    <Table>
                        <TableHeader>
                            <TableRow className="bg-slate-50 dark:bg-slate-800">
                                <TableHead className="font-semibold">Timestamp</TableHead>
                                <TableHead className="font-semibold">Actor</TableHead>
                                <TableHead className="font-semibold">Action</TableHead>
                                <TableHead className="font-semibold">Entity</TableHead>
                                <TableHead className="font-semibold">Details</TableHead>
                            </TableRow>
                        </TableHeader>
                        <TableBody>
                            {logs.length === 0 ? (
                                <TableRow>
                                    <TableCell colSpan={5} className="h-32 text-center">
                                        <div className="flex flex-col items-center justify-center text-muted-foreground">
                                            <History className="h-8 w-8 mb-2 opacity-50" />
                                            <p>No audit logs recorded</p>
                                            <p className="text-xs mt-1">System activities will appear here</p>
                                        </div>
                                    </TableCell>
                                </TableRow>
                            ) : (
                                logs.map((log) => {
                                    const EntityIcon = entityIcons[log.entity_type] || FileText
                                    return (
                                        <TableRow key={log.id} className="hover:bg-slate-50 dark:hover:bg-slate-800/50">
                                            <TableCell className="text-sm">
                                                <div className="font-medium">{new Date(log.created_at).toLocaleDateString()}</div>
                                                <div className="text-xs text-muted-foreground">
                                                    {new Date(log.created_at).toLocaleTimeString()}
                                                </div>
                                            </TableCell>
                                            <TableCell>
                                                <div className="flex items-center gap-2">
                                                    <div className="h-8 w-8 rounded-full bg-slate-200 flex items-center justify-center text-xs font-medium">
                                                        {log.actor?.full_name?.split(' ').map(n => n[0]).join('').toUpperCase() || '?'}
                                                    </div>
                                                    <span className="text-sm">{log.actor?.full_name || 'System'}</span>
                                                </div>
                                            </TableCell>
                                            <TableCell>
                                                <Badge className={actionColors[log.action] || 'bg-gray-100 text-gray-800'}>
                                                    {log.action}
                                                </Badge>
                                            </TableCell>
                                            <TableCell>
                                                <div className="flex items-center gap-2">
                                                    <EntityIcon className="h-4 w-4 text-muted-foreground" />
                                                    <span className="text-sm capitalize">{log.entity_type}</span>
                                                </div>
                                            </TableCell>
                                            <TableCell className="max-w-[300px]">
                                                {log.metadata ? (
                                                    <code className="text-xs bg-slate-100 dark:bg-slate-800 px-2 py-1 rounded truncate block">
                                                        {JSON.stringify(log.metadata).slice(0, 50)}...
                                                    </code>
                                                ) : (
                                                    <span className="text-muted-foreground text-sm">-</span>
                                                )}
                                            </TableCell>
                                        </TableRow>
                                    )
                                })
                            )}
                        </TableBody>
                    </Table>
                </CardContent>
            </Card>
        </div>
    )
}
