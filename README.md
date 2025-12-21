# Mortuary Management System

A comprehensive mortuary management system built with Next.js 15, Supabase, and TypeScript.

## Features

### 🔐 Authentication & Authorization
- Supabase-based authentication
- Role-based access control (Super Admin, Branch Admin, Staff)
- Branch-based data isolation
- Secure session management

### 🏢 Branch Management
- Multi-branch support
- Branch-specific access control
- Super admins can access all branches
- Staff limited to assigned branches

### 📋 Case Management
- Deceased case tracking
- Tag number management
- Financial tracking (embalming, coldroom, storage fees)
- Payment history
- Receipt management
- Case status tracking (In Custody, Discharged, Cancelled, Archived)

### 👥 HR Module
#### Staff Directory
- Employee profiles with positions and departments
- Employment type tracking (Full-time, Part-time, Contract)
- Contact information management

#### Attendance Management
- Daily attendance tracking
- Calendar view with attendance rates
- Multiple status types (Present, Absent, Late, Half-Day, On Leave, Holiday)
- Clock in/out time tracking
- Hours worked calculation

#### Payroll Management
- Monthly payroll runs
- Salary structure management
- Automatic calculation of:
  - Base salary + allowances (housing, transport, meal)
  - Tax deductions
  - SSNIT contributions (Ghana)
  - Net salary
- Payroll status workflow (Draft → Processing → Approved → Paid)
- Payment history tracking

#### Leave Management
- Multiple leave types (Annual, Sick, Maternity, Paternity, etc.)
- Leave request submission
- Approval/rejection workflow
- Leave balance tracking
- Paid/unpaid leave distinction

## Tech Stack

- **Framework**: Next.js 15 (App Router)
- **Language**: TypeScript
- **Database**: Supabase (PostgreSQL)
- **Authentication**: Supabase Auth
- **Styling**: Tailwind CSS
- **UI Components**: shadcn/ui
- **Date Handling**: date-fns
- **Notifications**: Sonner

## Getting Started

### Prerequisites

- Node.js 18+ 
- npm or yarn
- Supabase account

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Drrbarns/moruary.git
   cd moruary
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Set up Supabase**
   
   a. Create a new Supabase project at [supabase.com](https://supabase.com)
   
   b. Run the database schema:
   - Go to SQL Editor in your Supabase dashboard
   - Run `supabase/schema.sql`
   - Run `supabase/hr_module.sql`
   - Run `supabase/fix_rls_policies.sql`
   - Run `supabase/seed.sql` (for test data)

4. **Configure environment variables**
   ```bash
   cp .env.example .env.local
   ```
   
   Update `.env.local` with your Supabase credentials:
   ```env
   NEXT_PUBLIC_SUPABASE_URL=your-project-url
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
   ```

5. **Run the development server**
   ```bash
   npm run dev
   ```

6. **Open the application**
   
   Navigate to [http://localhost:3000](http://localhost:3000)

### Default Login Credentials

After running the seed data:

**Super Admin:**
- Email: `admin@mortuary.com`
- Password: `Admin@123`

**Staff:**
- Email: `staff@mortuary.com`
- Password: `Staff@123`

## Deployment

### Vercel Deployment

1. **Push to GitHub** (already done)

2. **Import to Vercel**
   - Go to [vercel.com](https://vercel.com)
   - Import your GitHub repository
   
3. **Add Environment Variables**
   
   In Vercel project settings → Environment Variables, add:
   ```
   NEXT_PUBLIC_SUPABASE_URL=your-project-url
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
   ```

4. **Deploy**
   
   Vercel will automatically deploy your application.

## Database Schema

### Core Tables
- `branches` - Branch locations
- `profiles` - User profiles (extends Supabase auth.users)
- `user_branch_assignments` - User-to-branch mappings
- `employee_profiles` - Extended employee information

### Case Management
- `deceased_cases` - Main case records
- `case_charges` - Additional charges per case
- `payments` - Payment records
- `receipt_sequences` - Receipt number generation

### HR Tables
- `attendance` - Daily attendance records
- `leave_types` - Leave type definitions
- `leave_requests` - Leave applications
- `salary_structures` - Employee salary details
- `payroll_runs` - Monthly payroll batches
- `payroll_items` - Individual payroll entries
- `deduction_types` - Deduction categories
- `employee_deductions` - Active deductions

### System Tables
- `audit_logs` - System audit trail

## Project Structure

```
├── app/
│   ├── auth/              # Authentication pages
│   ├── dashboard/         # Main application
│   │   └── [branchId]/    # Branch-specific routes
│   │       ├── cases/     # Case management
│   │       ├── hr/        # HR module
│   │       │   ├── attendance/
│   │       │   ├── payroll/
│   │       │   └── leaves/
│   │       ├── finance/
│   │       ├── reports/
│   │       └── settings/
│   └── select-branch/     # Branch selection
├── components/
│   ├── ui/                # shadcn/ui components
│   ├── dashboard/         # Dashboard components
│   └── hr/                # HR-specific components
├── supabase/              # Database schemas and migrations
├── utils/
│   └── supabase/          # Supabase client utilities
└── lib/                   # Utility functions
```

## Security

- Row Level Security (RLS) enabled on all tables
- Branch-based data isolation
- Role-based access control
- Secure session management
- Environment variables for sensitive data

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is proprietary software.

## Support

For support, email support@example.com or open an issue in the GitHub repository.

## Acknowledgments

- Built with [Next.js](https://nextjs.org/)
- Database by [Supabase](https://supabase.com/)
- UI components from [shadcn/ui](https://ui.shadcn.com/)
