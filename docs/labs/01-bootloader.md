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

## Solutions Applied
- Fixed segment setup (`cli`, zeroed `ax`, loaded `ds`, `es`, `ss`, set `sp` to `0x7C00`, `sti`)
- Replaced `textb` typo with `testb %al, %al`
- Completed teletype printing loop calling `int $0x10` and looping until null byte
- Added infinite halt loop (`cli`, `hlt`, `jmp .Lhang`)
- Added null-terminated message string: `"Booting iktr OS...\r\n"`
- Added padding with `.fill 510 - (. - _start), 1, 0` and boot signature `.byte 0x55, 0xAA`
- Verified assembled binary `boot_sector.bin` is exactly 512 bytes with `55 aa` signature
- Created `Makefile` for streamlined building (`make build`)

## Next Steps
- Lab 1.2 / 1.3: Enter 32-bit Protected Mode (disable interrupts, load GDT, enable A20, set CR0 PE bit, far jump to 32-bit code)

## Status
- [x] Started
- [x] Completed
