# Docker Build Improvement Proposals

## Problem

Docker build for `Dockerfile.setup` fails when building `aiokafka==0.13.0` on Alpine with Python 3.12.

### Root Cause

`aiokafka==0.13.0` (released 2019) does not have pre-built wheels for Python 3.12. The build requires compiling C extensions, which needs `zlib.h` (from `zlib-dev` package) - currently missing from build dependencies.

```
fatal error: zlib.h: No such file or directory
```

### Build Error Summary

- Stage: `[5/7]`
- Package: `aiokafka==0.13.0`
- Missing: `zlib-dev`
- Triggered by: `uv sync --frozen --extra setup`

---

## Solution Options

### Option 1: Nâng cấp aiokafka lên version mới hơn (Recommended)

Upgrade `aiokafka` to `>=0.10.0` which provides pre-built wheels for Python 3.12, eliminating the need to compile from source.

**Pros:**
- No compilation required
- Faster build
- Smaller image (no gcc, musl-dev, python3-dev needed at runtime)
- Better maintained version

**Cons:**
- Potential API changes between versions

### Option 2: Dùng `aiokafka-bin`

Use the pre-built `aiokafka-bin` package instead of `aiokafka`.

**Pros:**
- Pre-built, no compilation
- Drop-in replacement

**Cons:**
- Separate package to manage

### Option 3: Thêm `zlib-dev` vào build deps (Quick Fix)

Add `zlib-dev` to the Alpine packages in `Dockerfile.setup`.

**Pros:**
- Minimal change
- Fixes immediate issue

**Cons:**
- Still compiles from source (slow build)
- Temporary workaround, not addressing outdated dependency

```dockerfile
# Current (broken)
RUN apk add --no-cache --virtual .build-deps gcc musl-dev python3-dev && \
    uv sync --frozen --extra setup && \
    apk del .build-deps

# Fixed
RUN apk add --no-cache --virtual .build-deps gcc musl-dev python3-dev zlib-dev && \
    uv sync --frozen --extra setup && \
    apk del .build-deps
```

---

## Recommendation

**Option 1** (upgrade aiokafka) is the best long-term solution. It eliminates build complexity and uses modern, maintained packages.

If backward compatibility with legacy code is required, use **Option 2** (`aiokafka-bin`).

**Option 3** should only be used as a temporary workaround while planning the migration.