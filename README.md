# sml_io

SML file I/O utilities for the SML core library.

- Spec in SPARK (contracts verified)
- Body uses Ada I/O and is not in SPARK mode

## Usage

```bash
# Link local core during development (path dependency)
alr develop --use ../sml

# Build library
alr build

# Build and run tests
alr test

# Or manually
alr exec -- gprbuild -P test/test_all.gpr
bin/test_io
```

## Depend on this crate

alire.toml:

```toml
[depends-on]
sml = "^0.1.0"
```

## Notes
- Max file size is bounded (1 MB by default)
- Paths are bounded to prevent unchecked string growth
- Errors returned via status codes (no exceptions in the public API)
