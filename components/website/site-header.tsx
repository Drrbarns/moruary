import Link from "next/link"
import { Button } from "@/components/ui/button"
import { createClient } from "@/utils/supabase/server"

export async function SiteHeader() {
    const supabase = await createClient()
    const { data: { user } } = await supabase.auth.getUser()

    return (
        <header className="fixed top-0 w-full z-50 bg-white/90 backdrop-blur-md border-b border-gray-100 shadow-sm">
            <div className="container mx-auto px-4 h-20 flex items-center justify-between">
                <Link href="/" className="font-bold text-2xl text-slate-900 tracking-tight flex items-center gap-2">
                    <div className="h-8 w-8 bg-blue-600 rounded-lg flex items-center justify-center text-white font-serif">A</div>
                    <span>Ampah Prah <span className="text-blue-600">Mortuary</span></span>
                </Link>

                <nav className="hidden md:flex items-center gap-8 text-sm font-medium text-slate-600">
                    <Link href="#services" className="hover:text-blue-600 transition-colors">Services</Link>
                    <Link href="#branches" className="hover:text-blue-600 transition-colors">Locations</Link>
                    <Link href="#contact" className="hover:text-blue-600 transition-colors">Contact</Link>
                </nav>

                <div className="flex items-center gap-4">
                    <div className="hidden md:block text-sm text-slate-500 text-right pr-4 border-r">
                        <p className="text-xs font-semibold uppercase text-blue-600">Emergency</p>
                        <p className="font-mono font-bold text-black">+233 55 042 0202</p>
                    </div>
                    {user ? (
                        <Link href="/select-branch">
                            <Button className="bg-slate-900 hover:bg-slate-800">Go to Dashboard</Button>
                        </Link>
                    ) : (
                        <Link href="/auth/login">
                            <Button className="bg-blue-600 hover:bg-blue-700">Staff Login</Button>
                        </Link>
                    )}
                </div>
            </div>
        </header>
    )
}
