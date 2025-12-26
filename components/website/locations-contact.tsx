import { Button } from "@/components/ui/button"
import { MapPin, Phone, Mail, Clock } from "lucide-react"

export function LocationsContact() {
    return (
        <section id="contact" className="py-24 bg-slate-50">
            <div className="container mx-auto px-4">
                <div className="grid lg:grid-cols-2 gap-16">
                    {/* Left: Contact Info */}
                    <div>
                        <h2 className="text-red-600 font-semibold tracking-wide uppercase text-sm mb-2" id="branches">Our Locations</h2>
                        <h3 className="text-3xl md:text-4xl font-bold text-slate-900 mb-6">Visit Our Facilities</h3>
                        <p className="text-lg text-slate-600 mb-10">
                            We operate modern facilities in Asanteman and Asuom. Contact us anytime for assistance or to schedule a visit.
                        </p>

                        <div className="space-y-8">
                            <div className="flex items-start gap-4">
                                <div className="w-10 h-10 rounded-full bg-red-100 flex items-center justify-center shrink-0">
                                    <MapPin className="h-5 w-5 text-red-600" />
                                </div>
                                <div>
                                    <h4 className="font-bold text-slate-900 text-lg">Asanteman Branch</h4>
                                    <p className="text-slate-600">Main Road, Asanteman</p>
                                    <p className="text-sm text-slate-500 mt-1">Full Service Facility</p>
                                </div>
                            </div>

                            <div className="flex items-start gap-4">
                                <div className="w-10 h-10 rounded-full bg-red-100 flex items-center justify-center shrink-0">
                                    <MapPin className="h-5 w-5 text-red-600" />
                                </div>
                                <div>
                                    <h4 className="font-bold text-slate-900 text-lg">Asuom Branch</h4>
                                    <p className="text-slate-600">Near the Community Center, Asuom</p>
                                    <p className="text-sm text-slate-500 mt-1">Full Service Facility</p>
                                </div>
                            </div>

                            <div className="w-full h-px bg-slate-200 my-8" />

                            <div className="flex items-start gap-4">
                                <div className="w-10 h-10 rounded-full bg-green-100 flex items-center justify-center shrink-0">
                                    <Phone className="h-5 w-5 text-green-600" />
                                </div>
                                <div>
                                    <h4 className="font-bold text-slate-900 text-lg">24/7 Support Lines</h4>
                                    <p className="text-slate-600 text-lg">
                                        <a href="tel:+233550420202" className="hover:text-red-600 transition-colors">+233 55 042 0202</a>
                                    </p>
                                    <p className="text-slate-600 text-lg">
                                        <a href="tel:0208360777" className="hover:text-red-600 transition-colors">0208 360 777</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* Right: Contact Form / Map Placeholder */}
                    <div className="bg-white p-8 rounded-2xl shadow-sm border border-slate-100">
                        <h4 className="text-xl font-bold text-slate-900 mb-6">Send us a Message</h4>
                        <form className="space-y-4">
                            <div className="grid md:grid-cols-2 gap-4">
                                <div className="space-y-2">
                                    <label className="text-sm font-medium text-slate-700">Name</label>
                                    <input type="text" className="w-full p-3 rounded-lg border border-slate-200 focus:outline-none focus:ring-2 focus:ring-red-500/20 focus:border-red-500" placeholder="Your name" />
                                </div>
                                <div className="space-y-2">
                                    <label className="text-sm font-medium text-slate-700">Phone</label>
                                    <input type="tel" className="w-full p-3 rounded-lg border border-slate-200 focus:outline-none focus:ring-2 focus:ring-red-500/20 focus:border-red-500" placeholder="Your phone number" />
                                </div>
                            </div>
                            <div className="space-y-2">
                                <label className="text-sm font-medium text-slate-700">Message</label>
                                <textarea className="w-full p-3 rounded-lg border border-slate-200 focus:outline-none focus:ring-2 focus:ring-red-500/20 focus:border-red-500 h-32 resize-none" placeholder="How can we help you?" />
                            </div>
                            <Button className="w-full bg-red-600 hover:bg-red-700 h-12 text-lg">
                                Send Message
                            </Button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    )
}
