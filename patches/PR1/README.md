# Patches for automake (z/OS Port)

## Patch Files

### 1. configure.patch
**Purpose:** Remove Perl path validation that checks for spaces/tabs in the Perl interpreter path.

**Why needed:** On z/OS, the Perl path may contain characters that trigger false warnings, causing the configure script to fail unnecessarily.

**What it does:** Removes the `case $PERL in` validation block that checks for spaces/tabs in the Perl path.

**Version compatibility:**
- â automake 1.19 (lines 3683-3705)
- â ï¸ Line numbers may differ in other versions

### 2. distdir.am.patch
**Purpose:** Add file encoding tags for distribution files on z/OS.

**Why needed:** z/OS requires proper file tagging to handle character encoding correctly during the distribution check process.

**What it does:** Adds `chtag -R -tcISO8859-1 $(distdir)/*` before the `chmod` commands in the distcheck target.

**Location:** lib/am/distdir.am

**Version compatibility:**
- â automake 1.19 (line 537)
- â ï¸ Line numbers may differ in other versions

## Application Order

Apply patches in this order during the build process:
1. configure.patch
2. distdir.am.patch

## Verification

After applying patches, verify:

```bash
# Check configure patch applied
grep -A5 "^# Save details about the selected perl interpreter" configure | grep -v "case \$PERL in"

# Check distdir.am patch applied
grep "chtag -R -tcISO8859-1" lib/am/distdir.am
```

## Troubleshooting

If patches fail to apply:
1. Check the automake version - line numbers may have shifted
2. Look for `.rej` files to see what failed
3. Manually inspect the target lines and adjust the patch
4. The code content should be identical, only line numbers change

## Version History

- **v1.19** (2024): Updated line numbers
  - configure.patch: Lines 3683-3705
  - distdir.am.patch: Line 537
  
- **v1.18.1**: Original patches
  - configure.patch: Lines 3771-3793
  - distdir.am.patch: Line 459
