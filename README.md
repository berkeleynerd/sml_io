# sml_io

SML file I/O utilities for the SML core library.

- Spec in SPARK (contracts verified)
- Body uses Ada I/O and is not in SPARK mode

## Usage

```bash
# Link a local core checkout during development
alr develop --use ../sml

# Build library
alr build

# Build and run tests
alr exec -- gprbuild -P test_io.gpr
bin/test_io
```

## Depend on this crate

`alire.toml`:

```toml
[[depends-on]]
sml = "=0.1.0"
```

## Notes
- Max file size is bounded (1 MB by default)
- Paths are bounded to prevent unchecked string growth
- Errors returned via status codes (no exceptions in the public API)
