# Lab 1.1 — Bootloader: BIOS int 0x10

## Goal
Boot from a 512-byte sector and print a message to screen.

## What We Learned
- BIOS loads boot sector to 0x7C00
- Real mode: 16-bit, segmented memory
- BIOS interrupts (int 0x10 for video)
- Teletype output (AH=0x0E)

## What We Built
- `bootloader.asm` — prints text using BIOS int 0x10

## Issues Found
- Line 28: stray comma after %ax
- Line 38: `textb` should be `testb`
- Line 39: `jz` needs a label
- No message string defined
- No 0x55AA boot signature

## Next Steps
- Fix the above issues
- Pad to 512 bytes with boot signature
- Test in QEMU

## Status
- [x] Started
- [ ] Completed
