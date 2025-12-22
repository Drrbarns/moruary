# Branch Code URL Migration Guide

## Overview
This guide explains how to migrate from UUID-based URLs to branch code-based URLs.

**Current URL:** `http://localhost:3000/dashboard/11111111-1111-1111-1111-111111111111/cases`  
**New URL:** `http://localhost:3000/dashboard/ACC/cases`

## Why This Change?
- **Cleaner URLs**: `ACC` is much more readable than a UUID
- **User-friendly**: Easier to remember and share
- **Professional**: Looks better in browser address bar
- **SEO-friendly**: Better for search engines (if public-facing)

## Important Considerations

### ⚠️ Breaking Changes
This migration will:
1. **Break existing bookmarks** - Users with bookmarked UUID URLs will need to update them
2. **Break shared links** - Any shared links with UUIDs will stop working
3. **Require code updates** - All pages and components need to be updated

### ✅ What Stays the Same
- Database structure (no schema changes needed)
- All data relationships (foreign keys still use UUIDs internally)
- Branch IDs in the database remain as UUIDs
- Only the URL routing changes

## Migration Steps

### Step 1: Update Branch Codes (If Needed)
If you want custom 3-letter codes, run `supabase/update_branch_codes.sql` first.

### Step 2: Choose Migration Strategy

#### Option A: Full Migration (Recommended for New Systems)
Replace all UUID references in URLs with branch codes.

**Pros:**
- Clean, consistent URLs
- Better user experience
- No confusion

**Cons:**
- All existing links break
- Requires updating all files
- One-time migration effort

#### Option B: Hybrid Approach (Backward Compatible)
Support both UUIDs and codes in URLs during transition period.

**Pros:**
- Old links still work
- Gradual migration
- No immediate breakage

**Cons:**
- More complex code
- Temporary solution
- Need to maintain both

## Files That Need Updates

### 1. Route Parameters
The `[branchId]` folder can stay the same, but we'll treat it as `[branchCode]` in logic.

### 2. Pages to Update (27 files)
All pages under `app/dashboard/[branchId]/` need to:
- Import `resolveBranch` from `@/lib/branch-resolver`
- Resolve the branch from the code/ID parameter
- Use `branch.id` for database queries
- Use `branch.code` for generating new URLs

Example:
```typescript
// BEFORE
const { branchId } = await params
const { data } = await supabase
    .from('deceased_cases')
    .select('*')
    .eq('branch_id', branchId)

// AFTER
const { branchId } = await params
const branch = await resolveBranch(branchId)
if (!branch) notFound()

const { data } = await supabase
    .from('deceased_cases')
    .select('*')
    .eq('branch_id', branch.id)  // Still use UUID for queries
```

### 3. Links to Update
All `<Link>` components and `redirect()` calls need to use `branch.code`:

```typescript
// BEFORE
<Link href={`/dashboard/${branchId}/cases`}>

// AFTER
<Link href={`/dashboard/${branch.code}/cases`}>
```

### 4. Key Files to Update:
1. `app/select-branch/page.tsx` - Update links to use `branch.code`
2. `app/dashboard/[branchId]/page.tsx` - Resolve branch from code
3. `app/dashboard/[branchId]/cases/page.tsx` - Resolve branch
4. `app/dashboard/[branchId]/cases/[caseId]/page.tsx` - Resolve branch
5. `app/dashboard/[branchId]/finance/page.tsx` - Resolve branch
6. `app/dashboard/[branchId]/reports/page.tsx` - Resolve branch
7. `app/dashboard/[branchId]/hr/page.tsx` - Resolve branch
8. All other pages under `[branchId]`
9. All components that generate links (navigation, etc.)

## Implementation Example

### Before (UUID-based):
```typescript
// app/dashboard/[branchId]/cases/page.tsx
export default async function CasesPage({ 
    params 
}: { 
    params: Promise<{ branchId: string }> 
}) {
    const { branchId } = await params
    const supabase = await createClient()
    
    const { data: cases } = await supabase
        .from('deceased_cases')
        .select('*')
        .eq('branch_id', branchId)
    
    return (
        <Link href={`/dashboard/${branchId}/cases/new`}>
            New Case
        </Link>
    )
}
```

### After (Code-based with backward compatibility):
```typescript
// app/dashboard/[branchId]/cases/page.tsx
import { resolveBranch } from '@/lib/branch-resolver'
import { notFound } from 'next/navigation'

export default async function CasesPage({ 
    params 
}: { 
    params: Promise<{ branchId: string }> 
}) {
    const { branchId } = await params
    const supabase = await createClient()
    
    // Resolve branch (works with both UUID and code)
    const branch = await resolveBranch(branchId)
    if (!branch) notFound()
    
    // Use branch.id for database queries
    const { data: cases } = await supabase
        .from('deceased_cases')
        .select('*')
        .eq('branch_id', branch.id)
    
    // Use branch.code for URLs
    return (
        <Link href={`/dashboard/${branch.code}/cases/new`}>
            New Case
        </Link>
    )
}
```

## Testing Checklist

After migration, test:
- [ ] Branch selection page links
- [ ] Dashboard navigation
- [ ] Case management pages
- [ ] Finance pages
- [ ] Reports pages
- [ ] HR pages
- [ ] Settings pages
- [ ] All internal links
- [ ] Breadcrumbs
- [ ] Back buttons

## Rollback Plan

If issues occur:
1. The `resolveBranch()` function supports both formats
2. Old UUID links will continue to work
3. You can gradually update links over time
4. No database changes needed to rollback

## Recommendation

**For a new system or small user base:** Do the full migration now.

**For a system with existing users:** Use the hybrid approach:
1. Update all new links to use codes
2. Keep `resolveBranch()` to support old UUID links
3. Gradually phase out UUID support
4. Eventually remove UUID support after transition period

## Next Steps

Would you like me to:
1. **Automatically update all files** to use branch codes?
2. **Create a migration script** to do it step by step?
3. **Implement the hybrid approach** for backward compatibility?

Let me know which approach you prefer!
