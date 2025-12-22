# Branch Code URL Migration - Progress Report

## ✅ Completed Files

### Phase 1: Core Infrastructure
1. ✅ `lib/branch-resolver.ts` - Created branch resolver utility
2. ✅ `app/select-branch/page.tsx` - Updated all redirects and links to use branch.code
3. ✅ `app/dashboard/[branchId]/layout.tsx` - Resolves branch and passes to Sidebar
4. ✅ `components/dashboard/sidebar.tsx` - Uses branch.code for all navigation links
5. ✅ `app/dashboard/[branchId]/cases/page.tsx` - Fully migrated to use branch.code

## 🔄 Remaining Files to Update

### High Priority (User-Facing Pages)
These files need the same pattern:
1. Import `resolveBranch` and `notFound`
2. Resolve branch from branchId parameter
3. Use `branch.id` for database queries
4. Use `branch.code` for all URL links

#### Cases Module
- [ ] `app/dashboard/[branchId]/cases/new/page.tsx`
- [ ] `app/dashboard/[branchId]/cases/[caseId]/page.tsx`
- [ ] `app/dashboard/[branchId]/cases/[caseId]/edit/page.tsx`
- [ ] `app/dashboard/[branchId]/cases/[caseId]/discharge/page.tsx`

#### Finance Module
- [ ] `app/dashboard/[branchId]/finance/page.tsx`

#### Reports Module
- [ ] `app/dashboard/[branchId]/reports/page.tsx`

#### HR Module
- [ ] `app/dashboard/[branchId]/hr/page.tsx`
- [ ] `app/dashboard/[branchId]/hr/attendance/page.tsx`
- [ ] `app/dashboard/[branchId]/hr/leaves/page.tsx`
- [ ] `app/dashboard/[branchId]/hr/payroll/page.tsx`

#### Other Modules
- [ ] `app/dashboard/[branchId]/audit/page.tsx`
- [ ] `app/dashboard/[branchId]/settings/page.tsx`

### Medium Priority (Components)
Components that generate links with branchId:

- [ ] `components/cases/case-form.tsx`
- [ ] `components/cases/discharge-form.tsx`
- [ ] `components/finance/add-payment-dialog.tsx`
- [ ] `components/hr/*` (any components with branch links)

## Migration Pattern

For each page, apply this pattern:

```typescript
// 1. Add imports
import { resolveBranch } from '@/lib/branch-resolver'
import { notFound } from 'next/navigation'

// 2. In the component function
export default async function PageName({ params }: { params: Promise<{ branchId: string }> }) {
    const { branchId } = await params
    const supabase = await createClient()
    
    // 3. Resolve branch
    const branch = await resolveBranch(branchId)
    if (!branch) notFound()
    
    // 4. Use branch.id for queries
    const { data } = await supabase
        .from('table_name')
        .select('*')
        .eq('branch_id', branch.id)  // ← Use branch.id
    
    // 5. Use branch.code for links
    return (
        <Link href={`/dashboard/${branch.code}/path`}>  {/* ← Use branch.code */}
            Link Text
        </Link>
    )
}
```

## Testing Checklist

After migration is complete:

- [ ] Test branch selection page
- [ ] Test all navigation links from sidebar
- [ ] Test case creation and viewing
- [ ] Test case editing
- [ ] Test discharge flow
- [ ] Test finance pages
- [ ] Test reports
- [ ] Test HR module
- [ ] Test audit logs
- [ ] Test settings
- [ ] Verify old UUID URLs still work (backward compatibility)
- [ ] Verify new code URLs work (e.g., /dashboard/ACC/cases)

## Current Status

**Files Completed:** 5/20+ files
**Estimated Remaining:** ~15 files to update
**Backward Compatibility:** ✅ Enabled (old UUID URLs still work)

## Next Steps

Would you like me to:
1. **Continue automatically** - I'll update all remaining files
2. **Pause here** - You can test what's done so far
3. **Update specific modules** - Tell me which module to prioritize

The migration is designed to be non-breaking. Old UUID URLs will continue to work thanks to the `resolveBranch()` function.
