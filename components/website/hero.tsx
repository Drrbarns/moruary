import { Button } from "@/components/ui/button"
import Link from "next/link"
import { ArrowRight, Phone } from "lucide-react"

export function Hero() {
    return (
        <section className="relative pt-32 pb-20 md:pt-48 md:pb-32 overflow-hidden bg-slate-900 text-white min-h-[85vh] flex items-center">
            {/* Background Gradient & Effects */}
            <div className="absolute inset-0 bg-gradient-to-br from-slate-950 via-slate-900 to-blue-950" />
            <div className="absolute inset-0 bg-[radial-gradient(circle_at_top_right,_var(--tw-gradient-stops))] from-blue-500/10 via-transparent to-transparent" />
            <div className="absolute inset-0 bg-grid-white/[0.02] bg-[length:50px_50px]" />

            <div className="container relative mx-auto px-4 text-center max-w-5xl">
                <div className="inline-flex items-center rounded-full border border-blue-500/30 bg-blue-500/10 px-3 py-1 text-sm font-medium text-blue-300 mb-8 backdrop-blur-xl">
                    <span className="flex h-2 w-2 rounded-full bg-blue-400 mr-2 animate-pulse"></span>
                    Serving Asanteman & Asuom
                </div>

                <h1 className="text-5xl md:text-7xl font-bold tracking-tight mb-8 leading-tight">
                    Dignity, Respect, & <br className="hidden md:block" />
                    <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-emerald-400">Compassionate Care.</span>
                </h1>

                <p className="text-lg md:text-2xl text-slate-300 mb-10 max-w-2xl mx-auto leading-relaxed">
                    We provide professional mortuary services designed to honor your loved ones with the highest standards of hygiene and preservation.
                </p>

                <div className="flex flex-col sm:flex-row gap-4 justify-center items-center">
                    <Link href="#contact">
                        <Button size="lg" className="bg-blue-600 hover:bg-blue-700 text-lg h-14 px-8 rounded-full shadow-lg shadow-blue-900/20 w-full sm:w-auto">
                            <Phone className="mr-2 h-5 w-5" />
                            Contact Us Now
                        </Button>
                    </Link>
                    <Link href="#services">
                        <Button size="lg" variant="outline" className="text-white border-slate-700 hover:bg-slate-800 hover:text-white text-lg h-14 px-8 rounded-full w-full sm:w-auto">
                            Explore Services
                            <ArrowRight className="ml-2 h-5 w-5" />
                        </Button>
                    </Link>
                </div>

                {/* Stats / Trust Indicators */}
                <div className="mt-20 grid grid-cols-2 md:grid-cols-4 gap-8 border-t border-slate-800 pt-10 text-slate-400">
                    <div>
                        <div className="text-3xl font-bold text-white mb-1">24/7</div>
                        <div className="text-sm">Service Availability</div>
                    </div>
                    <div>
                        <div className="text-3xl font-bold text-white mb-1">Premier</div>
                        <div className="text-sm">Facilities</div>
                    </div>
                    <div>
                        <div className="text-3xl font-bold text-white mb-1">Expert</div>
                        <div className="text-sm">Staff Care</div>
                    </div>
                    <div>
                        <div className="text-3xl font-bold text-white mb-1">Trusted</div>
                        <div className="text-sm">Community Partner</div>
                    </div>
                </div>
            </div>
        </section>
    )
}
