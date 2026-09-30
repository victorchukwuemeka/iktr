AS = as
LD = ld
QEMU = qemu-system-x86_64

ASFLAGS = --32
LDFLAGS = -m elf_i386 -Ttext 0x7C00 --oformat binary

BUILD_DIR = target
BIN = $(BUILD_DIR)/boot_sector.bin
OBJ = $(BUILD_DIR)/boot.o

.PHONY: all clean run

all: $(BIN)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(OBJ): bootloader.asm | $(BUILD_DIR)
	$(AS) $(ASFLAGS) $< -o $@

$(BIN): $(OBJ)
	$(LD) $(LDFLAGS) $< -o $@

run: $(BIN)
	$(QEMU) -drive format=raw,file=$(BIN)

clean:
	rm -rf $(BUILD_DIR) boot.o boot_sector.bin
