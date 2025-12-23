import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card"
import { Snowflake, User, Truck, Flower2, ShieldCheck, Clock } from "lucide-react"

const services = [
    {
        title: "Cold Storage",
        description: "State-of-the-art refrigeration units ensuring optimal preservation in a hygienic environment.",
        icon: Snowflake,
        color: "text-blue-500",
        bg: "bg-blue-50"
    },
    {
        title: "Professional Embalming",
        description: "Expert embalming services to restore a peaceful appearance for viewing and long-term preservation.",
        icon: User,
        color: "text-emerald-500",
        bg: "bg-emerald-50"
    },
    {
        title: "Hearse Services",
        description: "Dignified transportation for your loved ones with our fleet of well-maintained hearses.",
        icon: Truck,
        color: "text-amber-500",
        bg: "bg-amber-50"
    },
    {
        title: "Bathing & Dressing",
        description: "Respectful preparation of the deceased, including bathing, dressing, and casket placement.",
        icon: Flower2,
        color: "text-purple-500",
        bg: "bg-purple-50"
    },
    {
        title: "Secure Facilities",
        description: "24/7 security and controlled access to ensure the safety and dignity of all in our care.",
        icon: ShieldCheck,
        color: "text-slate-500",
        bg: "bg-slate-50"
    },
    {
        title: "24/7 Reception",
        description: "Our compassionate staff is available around the clock to assist you during emergencies.",
        icon: Clock,
        color: "text-red-500",
        bg: "bg-red-50"
    }
]

export function ServicesSection() {
    return (
        <section id="services" className="py-24 bg-white">
            <div className="container mx-auto px-4">
                <div className="text-center max-w-3xl mx-auto mb-16">
                    <h2 className="text-blue-600 font-semibold tracking-wide uppercase text-sm mb-2">Our Services</h2>
                    <h3 className="text-3xl md:text-4xl font-bold text-slate-900 mb-4">Comprehensive Care Solutions</h3>
                    <p className="text-lg text-slate-600">
                        We offer a full range of mortuary services tailored to meet the cultural and personal needs of every family we serve.
                    </p>
                </div>

                <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                    {services.map((service, index) => (
                        <Card key={index} className="border-slate-100 shadow-sm hover:shadow-lg transition-all duration-300 hover:-translate-y-1">
                            <CardHeader>
                                <div className={`w-12 h-12 rounded-xl flex items-center justify-center mb-4 ${service.bg}`}>
                                    <service.icon className={`h-6 w-6 ${service.color}`} />
                                </div>
                                <CardTitle className="text-xl">{service.title}</CardTitle>
                            </CardHeader>
                            <CardContent>
                                <CardDescription className="text-base text-slate-600 leading-relaxed">
                                    {service.description}
                                </CardDescription>
                            </CardContent>
                        </Card>
                    ))}
                </div>
            </div>
        </section>
    )
}
