import Link from "next/link"

export function SiteFooter() {
    return (
        <footer className="bg-slate-950 text-slate-400 py-12 border-t border-slate-900">
            <div className="container mx-auto px-4">
                <div className="grid md:grid-cols-4 gap-8 mb-8">
                    <div className="col-span-1 md:col-span-2">
                        <h2 className="text-white text-xl font-bold mb-4">Ampah Prah Mortuary</h2>
                        <p className="max-w-md">
                            Providing dignified, professional, and compassionate mortuary services to families in Asanteman, Asuom, and beyond. We are here to support you in your time of need.
                        </p>
                    </div>
                    <div>
                        <h3 className="text-white font-semibold mb-4">Quick Links</h3>
                        <ul className="space-y-2">
                            <li><Link href="/" className="hover:text-red-400">Home</Link></li>
                            <li><Link href="#services" className="hover:text-red-400">Services</Link></li>
                            <li><Link href="#contact" className="hover:text-red-400">Contact Us</Link></li>
                            <li><Link href="/auth/login" className="hover:text-red-400">Staff Portal</Link></li>
                        </ul>
                    </div>
                    <div>
                        <h3 className="text-white font-semibold mb-4">Contact</h3>
                        <ul className="space-y-2">
                            <li><a href="tel:+233550420202" className="hover:text-red-400">+233 55 042 0202</a></li>
                            <li><a href="tel:0208360777" className="hover:text-red-400">0208 360 777</a></li>
                            <li>Asanteman & Asuom</li>
                        </ul>
                    </div>
                </div>
                <div className="border-t border-slate-900 pt-8 text-sm text-center md:text-left flex flex-col md:flex-row justify-between items-center">
                    <p>&copy; {new Date().getFullYear()} Ampah Prah Mortuary. All rights reserved.</p>
                </div>
            </div>
        </footer>
    )
}
