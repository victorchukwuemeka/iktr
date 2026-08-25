# CipherOS

A privacy-first operating system built from scratch in Rust.

## What Is This?

Not another Linux distro. Not a wrapper. A from-skill OS where privacy is architecture, not a feature.

Every syscall, every driver, every byte of memory is designed with one question: **does this leak data?**

## Why?

- Windows phones home. macOS analytics. Android tracks you.
- Existing "private" OSes are either clunky (Tails), complex (Qubes), or incomplete.
- There's no elegant, usable, privacy-first OS. We're building it.

## What You'll Learn

Building this means touching real systems programming:

- Memory management & ownership (Rust's model applied to kernels)
- Secure boot chain & measured boot
- Capability-based security (not Unix permissions)
- Encryption at rest and in transit by default
- Sandboxing & process isolation
- Minimal syscall surface

## Tech Stack

- **Language:** Rust (no C, no unsafe unless absolutely necessary)
- **Target:** x86_64 (initially)
- **Build:** Cargo + custom target specs

## Project Status

- [x] Bootloader (Lab 1.1 - BIOS int 0x10)
- [ ] Protected mode transition
- [ ] Kernel entry point
- [ ] Memory management
- [ ] Process scheduler
- [ ] Encrypted filesystem
- [ ] Network stack with Tor integration

## Building

```bash
# Build the bootloader
cargo build --target x86_64-cipheros.json

# Run in QEMU
qemu-system-x86_64 -drive format=raw,target=read-only,file=target/cipheros.bin
```

## References

- [Writing an OS in Rust](https://os.phil-opp.com/)
- [xv6 teaching OS](https://pdos.csail.mit.edu/6.828/2023/xv6.html)
- [Qubes OS architecture](https://www.qubes-os.org/architecture/)

---

*Built at Peira Lab. Ship fast, learn faster.*
