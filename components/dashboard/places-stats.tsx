"use client"

interface PlacesStatsProps {
    data: { place: string; count: number }[]
}

export function PlacesStats({ data }: PlacesStatsProps) {
    const maxCount = Math.max(...data.map(d => d.count), 1)

    return (
        <div className="bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-100 dark:border-gray-700 p-6 h-full flex flex-col">
            <h3 className="font-semibold mb-4 shrink-0">Cases by Location</h3>
            <div className="space-y-4 flex-1 overflow-y-auto pr-2 custom-scrollbar min-h-0">
                {data.length === 0 ? (
                    <div className="h-full flex items-center justify-center text-muted-foreground border-dashed border-2 rounded-lg">
                        No location data available
                    </div>
                ) : (
                    data.map((item, index) => (
                        <div key={index} className="space-y-2">
                            <div className="flex items-center justify-between text-sm">
                                <span className="font-medium text-gray-700 dark:text-gray-200">{item.place || 'Unknown Location'}</span>
                                <span className="text-gray-500 font-mono">{item.count}</span>
                            </div>
                            <div className="h-2 w-full bg-gray-100 dark:bg-gray-700 rounded-full overflow-hidden">
                                <div
                                    className="h-full bg-blue-500 rounded-full transition-all duration-500"
                                    style={{ width: `${(item.count / maxCount) * 100}%` }}
                                />
                            </div>
                        </div>
                    ))
                )}
            </div>
        </div>
    )
}
