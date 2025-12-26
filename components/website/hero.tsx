'use client'

import { Button } from "@/components/ui/button"
import Link from "next/link"
import Image from "next/image"
import { ArrowRight, Phone } from "lucide-react"
import { motion } from "framer-motion"

export function Hero() {
    return (
        <section className="relative pt-32 pb-20 md:pt-48 md:pb-32 overflow-hidden bg-slate-900 text-white min-h-[90vh] flex items-center">
            {/* Background Image */}
            <div className="absolute inset-0 z-0">
                <motion.div
                    initial={{ scale: 1.1 }}
                    animate={{ scale: 1 }}
                    transition={{ duration: 10, ease: "easeOut" }}
                    className="relative w-full h-full"
                >
                    <Image
                        src="/images/hero-bg.jpg"
                        alt="Serene Atmosphere"
                        fill
                        className="object-cover opacity-60"
                        priority
                    />
                </motion.div>
            </div>

            {/* Background Gradient & Effects */}
            <div className="absolute inset-0 bg-gradient-to-br from-slate-950/75 via-slate-900/70 to-red-950/60 z-0" />
            <div className="absolute inset-0 bg-[radial-gradient(circle_at_top_right,_var(--tw-gradient-stops))] from-red-500/20 via-transparent to-transparent z-0" />
            <div className="absolute inset-0 bg-grid-white/[0.03] bg-[length:50px_50px] z-0" />

            <div className="container relative mx-auto px-4 text-center max-w-5xl z-10">
                <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ duration: 0.6 }}
                    className="inline-flex items-center rounded-full border border-red-500/30 bg-red-500/10 px-3 py-1 text-sm font-medium text-red-300 mb-8 backdrop-blur-xl"
                >
                    <span className="flex h-2 w-2 rounded-full bg-red-400 mr-2 animate-pulse"></span>
                    Serving Asanteman & Asuom
                </motion.div>

                <motion.h1
                    initial={{ opacity: 0, y: 30 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ duration: 0.8, delay: 0.2 }}
                    className="text-5xl md:text-7xl font-bold tracking-tight mb-8 leading-tight font-serif"
                >
                    Dignity, Respect, & <br className="hidden md:block" />
                    <span className="text-red-400">Compassionate Care.</span>
                </motion.h1>

                <motion.p
                    initial={{ opacity: 0, y: 30 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ duration: 0.8, delay: 0.4 }}
                    className="text-lg md:text-2xl text-slate-300 mb-10 max-w-2xl mx-auto leading-relaxed"
                >
                    We provide professional mortuary services designed to honor your loved ones with the highest standards of hygiene and preservation.
                </motion.p>

                <motion.div
                    initial={{ opacity: 0, y: 30 }}
                    animate={{ opacity: 1, y: 0 }}
                    transition={{ duration: 0.8, delay: 0.6 }}
                    className="flex flex-col sm:flex-row gap-4 justify-center items-center"
                >
                    <Link href="#contact">
                        <Button size="lg" className="bg-red-600 hover:bg-red-700 text-lg h-14 px-8 rounded-full shadow-lg shadow-red-900/20 w-full sm:w-auto transition-all hover:scale-105">
                            <Phone className="mr-2 h-5 w-5" />
                            Contact Us Now
                        </Button>
                    </Link>
                    <Link href="#services">
                        <Button size="lg" variant="outline" className="text-white border-white/30 bg-transparent hover:bg-white/10 hover:border-white/50 text-lg h-14 px-8 rounded-full w-full sm:w-auto backdrop-blur-sm transition-all hover:scale-105">
                            Explore Services
                            <ArrowRight className="ml-2 h-5 w-5" />
                        </Button>
                    </Link>
                </motion.div>
            </div>
        </section>
    )
}
