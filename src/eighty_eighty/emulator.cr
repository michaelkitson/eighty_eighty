require "./instruction/**"
require "./disassembler"

class EightyEighty::Emulator
  include Instruction::Arithmetic
  include Instruction::Branch
  include Instruction::DataTransfer
  include Instruction::Logical
  include Instruction::StackIOControl

  setter input_handler : UInt8 -> UInt8
  setter output_handler : (UInt8, UInt8) -> Nil
  getter state : State

  def initialize(@state : State)
    @input_handler = ->(port : UInt8) { puts "input read from port #{port}"; 0_u8 }
    @output_handler = ->(port : UInt8, val : UInt8) { puts "output written to port #{port} -> #{val}" }
  end

  def run
    loop do
      execute_operation
    end
  end

  def execute_operation : Int
    begin
      op = @state.memory[@state.pc]
      case op
      when 0b11010011 # Output
        @output_handler.call(@state.read_instruction_u8, @state.a)
        @state.pc += 2
        return 10
      when 0b11011011 # Input
        @state.a = @input_handler.call(@state.read_instruction_u8)
        @state.pc += 2
        return 10
      end
      op_class = OP_MAP[op]
      if op_class
        op_class.run(@state)
      else
        puts "Unimplemented Instruction"
        Disassembler.print_disassembly(@state)
        exit(1)
      end
    rescue ex
      puts "Exception in instruction #{ex.message}"
      Disassembler.print_disassembly(@state)
      exit(1)
    end
  end

  def generate_interrupt(number : UInt8)
    raise "Invalid interrupt" unless number < 8
    @state.memory[@state.sp - 1] = (@state.pc >> 8).to_u8
    @state.memory[@state.sp - 2] = @state.pc.to_u8
    @state.sp -= 2
    @state.pc = number.to_u16 << 3
  end

  macro d(op)
    nil
  end

  OP_MAP = [
    NoOperation,                    # "NOP",
    LoadRegisterPairImmediate,      # "LXI    B,D16",
    StoreAccumulatorIndirect,       # "STAX   B",
    IncrementRegisterPair,          # "INX    B",
    IncrementRegister,              # "INR    B",
    DecrementRegister,              # "DCR    B",
    MoveImmediate,                  # "MVI    B,D8",
    RotateLeft,                     # "RLC",
    nil,                            # "UNHANDLED 08",
    AddRegisterPairToHL,            # "DAD    B",
    LoadAccumulatorIndirect,        # "LDAX   B",
    DecrementRegisterPair,          # "DCX    B",
    IncrementRegister,              # "INR    C",
    DecrementRegister,              # "DCR    C",
    MoveImmediate,                  # "MVI    C,D8",
    RotateRight,                    # "RRC",
    nil,                            # "UNHANDLED 10",
    LoadRegisterPairImmediate,      # "LXI    D,D16",
    StoreAccumulatorIndirect,       # "STAX   D",
    IncrementRegisterPair,          # "INX    D",
    IncrementRegister,              # "INR    D",
    DecrementRegister,              # "DCR    D",
    MoveImmediate,                  # "MVI    D,D8",
    RotateLeftThroughCarry,         # "RAL",
    nil,                            # "UNHANDLED 18",
    AddRegisterPairToHL,            # "DAD    D",
    LoadAccumulatorIndirect,        # "LDAX   D",
    DecrementRegisterPair,          # "DCX    D",
    IncrementRegister,              # "INR    E",
    DecrementRegister,              # "DCR    E",
    MoveImmediate,                  # "MVI    E,D8",
    RotateRightThroughCarry,        # "RAR",
    nil,                            # "RIM",
    LoadRegisterPairImmediate,      # "LXI    H,D16",
    StoreHLDirect,                  # "SHLD   adr",
    IncrementRegisterPair,          # "INX    H",
    IncrementRegister,              # "INR    H",
    DecrementRegister,              # "DCR    H",
    MoveImmediate,                  # "MVI    H,D8",
    d(DecimalAdjustAccumulator),    # "DAA",
    nil,                            # "UNHANDLED 28",
    AddRegisterPairToHL,            # "DAD    H",
    LoadHLDirect,                   # "LHLD   adr",
    DecrementRegisterPair,          # "DCX    H",
    IncrementRegister,              # "INR    L",
    DecrementRegister,              # "DCR    L",
    MoveImmediate,                  # "MVI    L,D8",
    ComplementAccumulator,          # "CMA",
    nil,                            # "SIM",
    LoadRegisterPairImmediate,      # "LXI    SP,D16",
    StoreAccumulatorDirect,         # "STA   adr",
    IncrementRegisterPair,          # "INX    SP",
    IncrementMemory,                # "INR    M",
    DecrementMemory,                # "DCR    M",
    MoveToMemoryImmediate,          # "MVI    M,D8",
    SetCarry,                       # "STC",
    nil,                            # "UNHANDLED 38",
    AddRegisterPairToHL,            # "DAD    SP",
    LoadAccumulatorDirect,          # "LDA    adr",
    DecrementRegisterPair,          # "DCX    SP",
    IncrementRegister,              # "INR    A",
    DecrementRegister,              # "DCR    A",
    MoveImmediate,                  # "MVI    A,D8",
    d(ComplementCarry),             # "CMC",
    MoveRegister,                   # "MOV    B,B",
    MoveRegister,                   # "MOV    B,C",
    MoveRegister,                   # "MOV    B,D",
    MoveRegister,                   # "MOV    B,E",
    MoveRegister,                   # "MOV    B,H",
    MoveRegister,                   # "MOV    B,L",
    MoveFromMemory,                 # "MOV    B,M",
    MoveRegister,                   # "MOV    B,A",
    MoveRegister,                   # "MOV    C,B",
    MoveRegister,                   # "MOV    C,C",
    MoveRegister,                   # "MOV    C,D",
    MoveRegister,                   # "MOV    C,E",
    MoveRegister,                   # "MOV    C,H",
    MoveRegister,                   # "MOV    C,L",
    MoveFromMemory,                 # "MOV    C,M",
    MoveRegister,                   # "MOV    C,A",
    MoveRegister,                   # "MOV    D,B",
    MoveRegister,                   # "MOV    D,C",
    MoveRegister,                   # "MOV    D,D",
    MoveRegister,                   # "MOV    D,E",
    MoveRegister,                   # "MOV    D,H",
    MoveRegister,                   # "MOV    D,L",
    MoveFromMemory,                 # "MOV    D,M",
    MoveRegister,                   # "MOV    D,A",
    MoveRegister,                   # "MOV    E,B",
    MoveRegister,                   # "MOV    E,C",
    MoveRegister,                   # "MOV    E,D",
    MoveRegister,                   # "MOV    E,E",
    MoveRegister,                   # "MOV    E,H",
    MoveRegister,                   # "MOV    E,L",
    MoveFromMemory,                 # "MOV    E,M",
    MoveRegister,                   # "MOV    E,A",
    MoveRegister,                   # "MOV    H,B",
    MoveRegister,                   # "MOV    H,C",
    MoveRegister,                   # "MOV    H,D",
    MoveRegister,                   # "MOV    H,E",
    MoveRegister,                   # "MOV    H,H",
    MoveRegister,                   # "MOV    H,L",
    MoveFromMemory,                 # "MOV    H,M",
    MoveRegister,                   # "MOV    H,A",
    MoveRegister,                   # "MOV    L,B",
    MoveRegister,                   # "MOV    L,C",
    MoveRegister,                   # "MOV    L,D",
    MoveRegister,                   # "MOV    L,E",
    MoveRegister,                   # "MOV    L,H",
    MoveRegister,                   # "MOV    L,L",
    MoveFromMemory,                 # "MOV    L,M",
    MoveRegister,                   # "MOV    L,A",
    MoveToMemory,                   # "MOV    M,B",
    MoveToMemory,                   # "MOV    M,C",
    MoveToMemory,                   # "MOV    M,D",
    MoveToMemory,                   # "MOV    M,E",
    MoveToMemory,                   # "MOV    M,H",
    MoveToMemory,                   # "MOV    M,L",
    Halt,                           # "HLT",
    MoveToMemory,                   # "MOV M,   A",
    MoveRegister,                   # "MOV A,   B",
    MoveRegister,                   # "MOV A,   C",
    MoveRegister,                   # "MOV A,   D",
    MoveRegister,                   # "MOV A,   E",
    MoveRegister,                   # "MOV A,   H",
    MoveRegister,                   # "MOV A,   L",
    MoveFromMemory,                 # "MOV A,   M",
    MoveRegister,                   # "MOV A,   A",
    AddRegister,                    # "ADD    B",
    AddRegister,                    # "ADD    C",
    AddRegister,                    # "ADD    D",
    AddRegister,                    # "ADD    E",
    AddRegister,                    # "ADD    H",
    AddRegister,                    # "ADD    L",
    AddMemory,                      # "ADD    M",
    AddRegister,                    # "ADD    A",
    d(AddRegisterWithCarry),        # "ADC    B",
    d(AddRegisterWithCarry),        # "ADC    C",
    d(AddRegisterWithCarry),        # "ADC    D",
    d(AddRegisterWithCarry),        # "ADC    E",
    d(AddRegisterWithCarry),        # "ADC    H",
    d(AddRegisterWithCarry),        # "ADC    L",
    d(AddMemoryWithCarry),          # "ADC    M",
    d(AddRegisterWithCarry),        # "ADC    A",
    SubtractRegister,               # "SUB    B",
    SubtractRegister,               # "SUB    C",
    SubtractRegister,               # "SUB    D",
    SubtractRegister,               # "SUB    E",
    SubtractRegister,               # "SUB    H",
    SubtractRegister,               # "SUB    L",
    SubtractMemory,                 # "SUB    M",
    SubtractRegister,               # "SUB    A",
    SubtractRegisterWithBorrow,     # "SBB    B",
    SubtractRegisterWithBorrow,     # "SBB    C",
    SubtractRegisterWithBorrow,     # "SBB    D",
    SubtractRegisterWithBorrow,     # "SBB    E",
    SubtractRegisterWithBorrow,     # "SBB    H",
    SubtractRegisterWithBorrow,     # "SBB    L",
    SubtractMemoryWithBorrow,       # "SBB    M",
    SubtractRegisterWithBorrow,     # "SBB    A",
    AndRegister,                    # "ANA    B",
    AndRegister,                    # "ANA    C",
    AndRegister,                    # "ANA    D",
    AndRegister,                    # "ANA    E",
    AndRegister,                    # "ANA    H",
    AndRegister,                    # "ANA    L",
    AndMemory,                      # "ANA    M",
    AndRegister,                    # "ANA    A",
    ExclusiveOrRegister,            # "XRA    B",
    ExclusiveOrRegister,            # "XRA    C",
    ExclusiveOrRegister,            # "XRA    D",
    ExclusiveOrRegister,            # "XRA    E",
    ExclusiveOrRegister,            # "XRA    H",
    ExclusiveOrRegister,            # "XRA    L",
    ExclusiveOrMemory,              # "XRA    M",
    ExclusiveOrRegister,            # "XRA    A",
    OrRegister,                     # "ORA    B",
    OrRegister,                     # "ORA    C",
    OrRegister,                     # "ORA    D",
    OrRegister,                     # "ORA    E",
    OrRegister,                     # "ORA    H",
    OrRegister,                     # "ORA    L",
    OrMemory,                       # "ORA    M",
    OrRegister,                     # "ORA    A",
    CompareRegister,                # "CMP    B",
    CompareRegister,                # "CMP    C",
    CompareRegister,                # "CMP    D",
    CompareRegister,                # "CMP    E",
    CompareRegister,                # "CMP    H",
    CompareRegister,                # "CMP    L",
    CompareMemory,                  # "CMP    M",
    CompareRegister,                # "CMP    A",
    ReturnConditional,              # "RNZ",
    Pop,                            # "POP    B",
    JumpConditional,                # "JNZ    adr",
    Jump,                           # "JMP    adr",
    CallConditional,                # "CNZ    adr",
    Push,                           # "PUSH   B",
    AddImmediate,                   # "ADI    D8",
    d(Restart),                     # "RST    0",
    ReturnConditional,              # "RZ",
    Return,                         # "RET",
    JumpConditional,                # "JZ     adr",
    nil,                            # "UNHANDLED cb",
    CallConditional,                # "CZ     adr",
    Call,                           # "CALL   adr",
    d(AddImmediateWithCarry),       # "ACI    D8",
    d(Restart),                     # "RST    1",
    ReturnConditional,              # "RNC",
    Pop,                            # "POP    D",
    JumpConditional,                # "JNC    adr",
    nil, # Handled Manually         # "OUT    D8",
    CallConditional,                # "CNC    adr",
    Push,                           # "PUSH   D",
    SubtractImmediate,              # "SUI    D8",
    d(Restart),                     # "RST    2",
    ReturnConditional,              # "RC",
    nil,                            # "UNHANDLED d9",
    JumpConditional,                # "JC     adr",
    nil, # Handled Manually         # "IN     D8",
    CallConditional,                # "CC     adr",
    nil,                            # "UNHANDLED dd",
    SubtractImmediateWithBorrow,    # "SBI    D8",
    d(Restart),                     # "RST    3",
    ReturnConditional,              # "RPO",
    Pop,                            # "POP    H",
    JumpConditional,                # "JPO    adr",
    ExchangeStackTopWithHL,         # "XTHL",
    CallConditional,                # "CPO    adr",
    Push,                           # "PUSH   H",
    AndImmediate,                   # "ANI    D8",
    d(Restart),                     # "RST    4",
    ReturnConditional,              # "RPE",
    JumpHLIndirect,                 # "PCHL",
    JumpConditional,                # "JPE    adr",
    ExchangeHLWithDE,               # "XCHG",
    CallConditional,                # "CPE    adr",
    nil,                            # "UNHANDLED ed",
    ExclusiveOrImmediate,           # "XRI    D8",
    d(Restart),                     # "RST    5",
    ReturnConditional,              # "RP",
    PopProcessorStatusWord,         # "POP    PSW",
    JumpConditional,                # "JP     adr",
    DisableInterrupts,              # "DI",
    CallConditional,                # "CP     adr",
    PushProcessorStatusWord,        # "PUSH   PSW",
    OrImmediate,                    # "ORI    D8",
    d(Restart),                     # "RST    6",
    ReturnConditional,              # "RM",
    d(MoveHLToSP),                  # "SPHL",
    JumpConditional,                # "JM     adr",
    EnableInterrupts,               # "EI",
    CallConditional,                # "CM     adr",
    nil,                            # "UNHANDLED fd",
    CompareImmediate,               # "CPI    D8",
    d(Restart),                     # "RST    7",
  ]
end
