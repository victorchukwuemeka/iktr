.code16

.section .text 


# ============================================================
# BOOTLOADER — Lab 1.1
# A 512-byte boot sector that prints a message using BIOS int 0x10.
#
# WHY 512 bytes: the BIOS reads exactly one sector (512 bytes)
# from disk into RAM at 0x7C00, then jumps to it. The last two
# bytes must be the magic signature 0x55 0xAA or the BIOS
# refuses to boot it.
#
# BUILD (3 steps):
#   1. gcc -m32 -c bootloader.asm  -o boot.o   # assemble to object file
#   2. ld -m elf_i386 -Ttext 0x7C00 boot.o -o boot.elf
#                                            # link at address 0x7C00
#   3. objcopy -O binary boot.elf boot_sector.bin
#                                            # strip ELF headers → raw binary
# ============================================================



.globl _start 
_start:
     # Clear interrupts and initialize segments
     cli
     xorw %ax, %ax
     movw %ax, %ds
     movw %ax, %es
     movw %ax, %ss
     movw $0x7C00, %sp
     sti

     movw $msg, %si      # SI = pointer to message 
     movb $0x0E, %ah     # AH = teletype output 
     xorw %bx, %bx       # page 0, black bg white fg

print_loop:
     lodsb               # AL = [DS:SI], SI = SI + 1
     testb %al, %al      # end of null-terminated string?
     jz halt
     int $0x10           # BIOS video service: print char in AL
     jmp print_loop

halt:
     cli
.Lhang:
     hlt
     jmp .Lhang

msg:
     .asciz "Booting iktr OS...\r\n"

# Sector padding and boot signature (must be exactly 512 bytes)
.fill 510 - (. - _start), 1, 0
.byte 0x55, 0xAA
