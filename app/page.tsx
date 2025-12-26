import { SiteHeader } from '@/components/website/site-header'
import { Hero } from '@/components/website/hero'
import { ServicesSection } from '@/components/website/services-section'
import { BranchesSection } from '@/components/website/branches-section'
import { LocationsContact } from '@/components/website/locations-contact'
import { SiteFooter } from '@/components/website/site-footer'

export default function Home() {
  return (
    <div className="min-h-screen flex flex-col font-sans bg-white">
      {/* Navigation */}
      <SiteHeader />

      <main className="flex-1">
        {/* Hero Section */}
        <Hero />

        {/* Services */}
        <ServicesSection />

        {/* Branches */}
        <BranchesSection />

        {/* Locations & Contact */}
        <LocationsContact />
      </main>

      {/* Footer */}
      <SiteFooter />
    </div>
  )
}
