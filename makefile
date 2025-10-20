SRC_DIR := circuits
BUILD_DIR := build
MODULES := $(shell find $(SRC_DIR) -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)
SIM ?=
VIEW ?=

all:
	mkdir -p $(BUILD_DIR)
	iverilog -o $(BUILD_DIR)/all.vvp $(SRC_DIR)/**/*.v

run:
	mkdir -p $(BUILD_DIR); \
	iverilog -o $(BUILD_DIR)/all.vvp $(SRC_DIR)/**/*.v 
	vvp $(BUILD_DIR)/all.vvp

view:
	gtkwave dump.vcd
clean:
	rm -rf $(BUILD_DIR)

