"use client"

import * as React from "react"
import { useRouter, useSearchParams } from "next/navigation"
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"

export function DashboardDateFilter() {
    const router = useRouter()
    const searchParams = useSearchParams()
    const period = searchParams.get("period") || "month"

    const handleValueChange = (value: string) => {
        const params = new URLSearchParams(searchParams.toString())
        params.set("period", value)
        router.push(`?${params.toString()}`)
    }

    return (
        <Select value={period} onValueChange={handleValueChange}>
            <SelectTrigger className="w-[180px] bg-white dark:bg-gray-800">
                <SelectValue placeholder="Select period" />
            </SelectTrigger>
            <SelectContent>
                <SelectItem value="month">This Month</SelectItem>
                <SelectItem value="year">This Year</SelectItem>
                <SelectItem value="all">All Time</SelectItem>
            </SelectContent>
        </Select>
    )
}
