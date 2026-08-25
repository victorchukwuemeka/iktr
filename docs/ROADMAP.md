# iktr OS — Development Roadmap

## Phase 1: Boot
- [ ] Lab 1.1 — Bootloader (BIOS int 0x10)
- [ ] Lab 1.2 — Fix bootloader, add boot signature
- [ ] Lab 1.3 — Protected mode transition

## Phase 2: Kernel
- [ ] Lab 2.1 — Kernel entry point
- [ ] Lab 2.2 — GDT setup
- [ ] Lab 2.3 — Basic console output

## Phase 3: Memory
- [ ] Lab 3.1 — Physical memory detection
- [ ] Lab 3.2 — Page tables
- [ ] Lab 3.3 — Kernel heap

## Phase 4: Processes
- [ ] Lab 4.1 — TSS setup
- [ ] Lab 4.2 — Process structure
- [ ] Lab 4.3 — Simple scheduler

## Phase 5: Filesystem
- [ ] Lab 5.1 — FAT12 read
- [ ] Lab 5.2 — Encrypted partition

## Phase 6: Network
- [ ] Lab 6.1 — NIC driver
- [ ] Lab 6.2 — TCP/IP stack
- [ ] Lab 6.3 — Tor integration

---

## Lab Directory
```
docs/labs/
├── 01-bootloader.md
├── 02-protected-mode.md
├── 03-kernel-entry.md
└── ...
```

## Conventions
- One lab per file
- Each lab has: Goal, What We Learned, What We Built, Issues, Next Steps
- Update roadmap after completing a lab
