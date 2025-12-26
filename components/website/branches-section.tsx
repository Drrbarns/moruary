'use client'

import Image from 'next/image'
import { MapPin, ArrowRight, Clock } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { motion } from 'framer-motion'

export function BranchesSection() {
    return (
        <section className="py-24 bg-white relative overflow-hidden">
            {/* Background Decorative Elements */}
            <div className="absolute top-0 left-0 w-full h-full overflow-hidden pointer-events-none">
                <div className="absolute top-0 right-0 w-1/3 h-1/3 bg-red-50/50 rounded-bl-[100px] -z-10" />
                <div className="absolute bottom-0 left-0 w-1/4 h-1/4 bg-slate-50/50 rounded-tr-[100px] -z-10" />
            </div>

            <div className="container mx-auto px-4 relative z-10">
                <motion.div
                    initial={{ opacity: 0, y: 20 }}
                    whileInView={{ opacity: 1, y: 0 }}
                    viewport={{ once: true }}
                    transition={{ duration: 0.6 }}
                    className="text-center max-w-3xl mx-auto mb-16"
                >
                    <h2 className="text-red-600 font-semibold tracking-wide uppercase text-sm mb-3">Our Locations</h2>
                    <h3 className="text-3xl md:text-5xl font-bold text-slate-900 mb-6 font-serif">World-Class Facilities</h3>
                    <p className="text-lg text-slate-600">
                        We operate superior mortuary facilities designed to provide comfort, dignity, and peace of mind.
                        Visit our branches in Asanteman and Asuom.
                    </p>
                </motion.div>

                <div className="grid md:grid-cols-2 gap-8 lg:gap-12">
                    {/* Asanteman Branch Card */}
                    <motion.div
                        initial={{ opacity: 0, x: -50 }}
                        whileInView={{ opacity: 1, x: 0 }}
                        viewport={{ once: true }}
                        transition={{ duration: 0.8 }}
                        className="group relative bg-white rounded-3xl overflow-hidden shadow-lg hover:shadow-2xl transition-all duration-300 border border-slate-100 flex flex-col"
                    >
                        <div className="relative h-64 md:h-80 w-full overflow-hidden">
                            <Image
                                src="/images/asanteman-branch.jpg"
                                alt="Asanteman Branch"
                                fill
                                className="object-cover transition-transform duration-700 group-hover:scale-105"
                            />
                            <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent opacity-60" />
                            <div className="absolute bottom-0 left-0 p-6">
                                <span className="inline-block px-3 py-1 bg-red-600 text-white text-xs font-bold uppercase tracking-wider rounded-full mb-2">
                                    Main Branch
                                </span>
                                <h4 className="text-white text-2xl font-bold font-serif">Asanteman Branch</h4>
                            </div>
                        </div>

                        <div className="p-8 flex-1 flex flex-col">
                            <div className="space-y-4 mb-8 flex-1">
                                <div className="flex items-start gap-4">
                                    <div className="w-10 h-10 rounded-full bg-red-50 flex items-center justify-center shrink-0">
                                        <MapPin className="h-5 w-5 text-red-600" />
                                    </div>
                                    <div>
                                        <h5 className="font-semibold text-slate-900">Location</h5>
                                        <p className="text-slate-600">Main Road, Asanteman</p>
                                    </div>
                                </div>

                                <div className="flex items-start gap-4">
                                    <div className="w-10 h-10 rounded-full bg-red-50 flex items-center justify-center shrink-0">
                                        <Clock className="h-5 w-5 text-red-600" />
                                    </div>
                                    <div>
                                        <h5 className="font-semibold text-slate-900">Hours</h5>
                                        <p className="text-slate-600">Open 24/7 for intake</p>
                                    </div>
                                </div>
                            </div>

                            <Button className="w-full bg-slate-900 hover:bg-slate-800 text-white gap-2 group-hover:bg-red-600 transition-colors">
                                Get Directions <ArrowRight className="w-4 h-4" />
                            </Button>
                        </div>
                    </motion.div>

                    {/* Asuom Branch Card */}
                    <motion.div
                        initial={{ opacity: 0, x: 50 }}
                        whileInView={{ opacity: 1, x: 0 }}
                        viewport={{ once: true }}
                        transition={{ duration: 0.8 }}
                        className="group relative bg-white rounded-3xl overflow-hidden shadow-lg hover:shadow-2xl transition-all duration-300 border border-slate-100 flex flex-col"
                    >
                        <div className="relative h-64 md:h-80 w-full overflow-hidden">
                            <Image
                                src="/images/asuom-branch.jpg"
                                alt="Asuom Branch"
                                fill
                                className="object-cover transition-transform duration-700 group-hover:scale-105"
                            />
                            <div className="absolute inset-0 bg-gradient-to-t from-black/60 to-transparent opacity-60" />
                            <div className="absolute bottom-0 left-0 p-6">
                                <span className="inline-block px-3 py-1 bg-green-600 text-white text-xs font-bold uppercase tracking-wider rounded-full mb-2">
                                    Garden Facility
                                </span>
                                <h4 className="text-white text-2xl font-bold font-serif">Asuom Branch</h4>
                            </div>
                        </div>

                        <div className="p-8 flex-1 flex flex-col">
                            <div className="space-y-4 mb-8 flex-1">
                                <div className="flex items-start gap-4">
                                    <div className="w-10 h-10 rounded-full bg-red-50 flex items-center justify-center shrink-0">
                                        <MapPin className="h-5 w-5 text-red-600" />
                                    </div>
                                    <div>
                                        <h5 className="font-semibold text-slate-900">Location</h5>
                                        <p className="text-slate-600">Near Community Center, Asuom</p>
                                    </div>
                                </div>

                                <div className="flex items-start gap-4">
                                    <div className="w-10 h-10 rounded-full bg-red-50 flex items-center justify-center shrink-0">
                                        <Clock className="h-5 w-5 text-red-600" />
                                    </div>
                                    <div>
                                        <h5 className="font-semibold text-slate-900">Hours</h5>
                                        <p className="text-slate-600">Open 24/7 for intake</p>
                                    </div>
                                </div>
                            </div>

                            <Button className="w-full bg-slate-900 hover:bg-slate-800 text-white gap-2 group-hover:bg-red-600 transition-colors">
                                Get Directions <ArrowRight className="w-4 h-4" />
                            </Button>
                        </div>
                    </motion.div>
                </div>
            </div>
        </section>
    )
}
