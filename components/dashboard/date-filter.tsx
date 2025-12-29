"use client"

import * as React from "react"
import { useRouter, useSearchParams } from "next/navigation"
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
    SelectGroup,
    SelectLabel,
    SelectSeparator,
} from "@/components/ui/select"

// Generate list of months (current + past 11 months)
function getMonthOptions() {
    const months: { value: string; label: string }[] = []
    const now = new Date()

    for (let i = 0; i < 12; i++) {
        const date = new Date(now.getFullYear(), now.getMonth() - i, 1)
        const year = date.getFullYear()
        const month = date.getMonth() + 1 // 1-indexed
        const monthName = date.toLocaleString('default', { month: 'long' })

        months.push({
            value: `${year}-${month.toString().padStart(2, '0')}`,
            label: `${monthName} ${year}`
        })
    }

    return months
}

export function DashboardDateFilter() {
    const router = useRouter()
    const searchParams = useSearchParams()
    const period = searchParams.get("period") || "month"

    const monthOptions = React.useMemo(() => getMonthOptions(), [])

    // Get display value - show the actual month name if it's a specific month
    const getDisplayValue = () => {
        if (period === 'month') return 'This Month'
        if (period === 'year') return 'This Year'
        if (period === 'all') return 'All Time'

        // Check if it's a specific month (format: YYYY-MM)
        const monthMatch = period.match(/^(\d{4})-(\d{2})$/)
        if (monthMatch) {
            const date = new Date(parseInt(monthMatch[1]), parseInt(monthMatch[2]) - 1, 1)
            return date.toLocaleString('default', { month: 'long', year: 'numeric' })
        }

        return 'Select period'
    }

    const handleValueChange = (value: string) => {
        const params = new URLSearchParams(searchParams.toString())
        params.set("period", value)
        router.push(`?${params.toString()}`)
    }

    return (
        <Select value={period} onValueChange={handleValueChange}>
            <SelectTrigger className="w-[180px] bg-white dark:bg-gray-800">
                <SelectValue placeholder="Select period">
                    {getDisplayValue()}
                </SelectValue>
            </SelectTrigger>
            <SelectContent>
                <SelectGroup>
                    <SelectLabel className="text-xs text-muted-foreground">Quick Filters</SelectLabel>
                    <SelectItem value="month">This Month</SelectItem>
                    <SelectItem value="year">This Year</SelectItem>
                    <SelectItem value="all">All Time</SelectItem>
                </SelectGroup>
                <SelectSeparator />
                <SelectGroup>
                    <SelectLabel className="text-xs text-muted-foreground">By Month</SelectLabel>
                    {monthOptions.map((option) => (
                        <SelectItem key={option.value} value={option.value}>
                            {option.label}
                        </SelectItem>
                    ))}
                </SelectGroup>
            </SelectContent>
        </Select>
    )
}
