SRC_DIR := circuits
BUILD_DIR := build
MODULES := $(shell find $(SRC_DIR) -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)
VERILOG_FILES := $(foreach module,$(MODULES),$(wildcard $(SRC_DIR)/$(module)/*.v))
SIM ?=
VIEW ?=

all: $(MODULES)

$(MODULES):
	mkdir -p $(BUILD_DIR)
	iverilog -o $(BUILD_DIR)/$@.vvp $(SRC_DIR)/$@/*.v

run:
	@if [ "$(SIM)" != "" ]; then \
		vvp $(BUILD_DIR)/$(SIM).vvp; \
	else \
		echo "Specify SIM=<module> to run, e.g. make run SIM=adder"; \
	fi

view:
	@if [ "$(VIEW)" != "" ]; then \
		gtkwave build/$(VIEW)_tb.vcd & \
	else \
		echo "Specify VIEW=<module> to view, e.g. make view VIEW=adder"; \
	fi

clean:
	rm -rf $(BUILD_DIR)

