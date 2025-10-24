# Mega-8
Mega-8 is a computer architecture made from scratch int Varilog, for educational porposes.

## Instruction Set
```assembly
MOV reg, reg ; Copy something from a register to register
MOV reg, [addr] ; Copy something from a register to memory
MOV [addr], reg ; Copy something from a memory to register
PUSH reg
POP reg
ADD reg, reg/addr
SUB reg, reg/addr
INC reg
DEC reg
AND reg, reg
OR reg, reg
XOR reg, reg
NOT reg
SHL reg, imm ; Shift to left
SHR reg, imm ; Shift to Right
JMP addr ; Jump to a instruction(addr) 
CMP reg/addr, reg/addr ; Compare 2 values and sets flags in the CPU
JNZ addr ; Jump if flag zero is not set
JZ addr ; Jump if flag zero is set
JC addr ; Jump if flag carry is set
CALL addr ; Jump to specific instruction storing next instruction in the stack
RET ; Return to the addr stored in the stack by the CALL
```

## Registers
```assembly
SP ; Stack Pointer: stores the addr of the stack's top
PC ; Program Counter: Stores the addr of the next instruction in memory
IR(16 bits) ; Instruction Register: Stores the current instruction being executed
MIR ; MicroInstruction Register: Stores the current microinstruction being executed
AC ; Acumulator: Register that stores the intermidiete result of ALU operations
FLAGS ; Stores flags coming from ALU operations, e.g. carry flag, zero flag etc
A ; General purpose register
B ; General purpose register
C ; General purpose register
D ; General purpose register
E ; General purpose register
```

## IR division
- Opcode: 4 bits;
- Destiny Register: 4 bits;
- Origin (register/Address): 8 bits.

## flags
- Z: Zero flag;
- C: Carry flag.

## Data Bus and Address Bus
- 8 bits Data Bus;
- 16 bits Address Bus.

## Memory
- Little Endian;
- 1 byte words;
- 2KB
### Memory Mapping
- ROM (program): 0x0000–0x03FF 1024 bytes
- RAM (data): 0x0400–0x0BFF 2048 bytes
- Pilha: 0x0C00–0x0FFF 1024 bytes, begining on 0x0FFF, grows down
### Microinstructions ROM
- 512 bytes

## Microinstructions

### Signal conventions
- BUS <- X : place value on the bus
- REG_EN : enables register to write to the bus
- ALU_OP : ALU operation (ADD, SUB, AND, OR, XOR, NOT, SHL, SHR)
- AC_EN : enables AC to receive value from ALU
- MEM_READ / MEM_WRITE : memory read/write
- FLAGS_LOAD : updates Z and C flags
- PC_LOAD / PC_INC : update PC
- SP_INC / SP_DEC : update SP

---

### ADD reg, reg
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | BUS <- source, AC_EN = 1 |
| 2          | BUS <- destination, ALU_OP=add, ALU_EN = 1, BUS -> destination(REG_EN)
| 3          | FLAGS_LOAD = 1, PC_INC |

### ADD reg, addr
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | BUS <- source (register or memory), ALU_OP = ADD, AC_EN = 1 |
| 2          | FLAGS_LOAD = 1, AC -> destination (if different from AC) |
| 3          | PC_INC |

### SUB reg, reg/addr
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | BUS <- source, ALU_OP = SUB, AC_EN = 1 |
| 2          | FLAGS_LOAD = 1, AC -> destination (if different from AC) |
| 3          | PC_INC |

### MOV reg, reg
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | BUS <- source, REG_EN(destination) = 1 |
| 2          | PC_INC |

### MOV reg, [addr]
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | ADDR_BUS <- IR[origin], MEM_READ = 1 |
| 2          | BUS -> destination |
| 3          | PC_INC |

### MOV [addr], reg
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | ADDR_BUS <- IR[origin], BUS <- source register, MEM_WRITE = 1 |
| 2          | PC_INC |

### PUSH reg
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | SP_DEC |
| 2          | ADDR_BUS <- SP, BUS <- register, MEM_WRITE = 1 |
| 3          | PC_INC |

### POP reg
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | ADDR_BUS <- SP, MEM_READ = 1 |
| 2          | BUS -> destination, SP_INC |
| 3          | PC_INC |

### INC reg
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | BUS <- reg, ALU_OP = INC, PC_INC = 1, AC_EN = 1 |
| 2          | FLAGS_LOAD = 1, BUS -> reg, PC_INC = 1 |


### DEC reg
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | BUS <- reg, ALU_OP = DEC, PC_INC = 1, AC_EN = 1 |
| 2          | FLAGS_LOAD = 1, BUS -> reg, PC_INC = 1 |

### AND / OR / XOR reg, reg
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | BUS <- source, BUS -> AC |
| 2          | destiny -> BUS, ALU_OP = AND/OR/XOR, ALU_EN = 1, FLAGS_LOAD = 1, AC -> destination, PC_INC = 1 |

### NOT reg
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | BUS <- reg, ALU_OP = NOT, ALU_EN = 1, AC_EN = 1 |
| 2          | FLAGS_LOAD = 1, BUS -> reg, PC_INC = 1 |

### SHL / SHR reg, imm
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | BUS <- reg, ALU_OP = SHL/SHR, AC_EN = 1, imm as shift amount |
| 2          | FLAGS_LOAD = 1, AC -> reg |
| 3          | PC_INC |

### JMP addr
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | IR_ADDR_BUS = 1, PC_LOAD_ADDR = 1 |

### JNZ addr
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | IR_ADDR_BUS = 1, PC_LOAD_ADDR = 1, if Z=0, PC_LOAD = addr; else PC_INC |

### JZ addr
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | IR_ADDR_BUS = 1, PC_LOAD_ADDR = 1, if Z=1, PC_LOAD = addr; else PC_INC |

### JC addr
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | IR_ADDR_BUS = 1, PC_LOAD_ADDR = 1, if C=1, PC_LOAD = addr; else PC_INC |

### CALL addr
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | SP_DEC = 1|
| 2          | SP_ADDR_BUS = 1, PC_INC,BUS <- PC, MEM_WRITE = 1 |
| 3          | IR_ADDR_BUS = 1, PC_LOAD_ADDR = 1 |

### RET
| Microcycle | Action / Control Signals |
|------------|-------------------------|
| 1          | SP_ADDR_BUS = 1, MEM_READ = 1, BUS -> PC |
| 2          | SP_INC = 1|

## UC Microinstructions flags:
- ALU_OP: 4 bits;
- ALU_EN: 1 bit;
- AC_EN: 1 bit;
- REG_SEL_SOURCE: 3 bits;
- REG_RE_SOURCE: 1 bit;
- SP_ADDR_BUS: 1 bit;
- REG_SEL_DEST: 3 bits;
- REG_WE_DEST: 1 bit;
- MEM_WRITE: 1 bit;
- MEM_READ: 1bit;
- PC_INC: 1 bit;
- SP_INC: 1 bit;
- SP_DEC: 1 bit;
- FLAGS_LOAD: 1 bit;
- IR_ADDR_BUS: 1 bit;
- PC_LOAD_ADDR: 1 bit;
- SHIFT_AMOUNT: 3 bits;
- JNZ: 1 bit;
- JZ: 1 bit;
- JC: 1 bit;

## Extra Circuits:
- PC Incrementer: Specific circuit that increments PC when PC_INC = 1;
- SP Incrementer: Specific circuit that increments SP when SP_INC = 1;
- SP Decrementer: Specific circuit that decrements SP when SP_DEC = 1;
- Conditional MUX: MUX that will consider current flags when J* flags are enable;

