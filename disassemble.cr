opcodes = [
  {"code" => 0x00, "len" => 1, "text" => "NOP"},
  {"code" => 0x01, "len" => 3, "text" => "LXI    B,D16"},
  {"code" => 0x02, "len" => 1, "text" => "STAX   B"},
  {"code" => 0x03, "len" => 1, "text" => "INX    B"},
  {"code" => 0x04, "len" => 1, "text" => "INR    B"},
  {"code" => 0x05, "len" => 1, "text" => "DCR    B"},
  {"code" => 0x06, "len" => 2, "text" => "MVI    B,D8"},
  {"code" => 0x07, "len" => 1, "text" => "RLC"},
  {"code" => 0x08, "len" => 1, "text" => "UNHANDLED 08"},
  {"code" => 0x09, "len" => 1, "text" => "DAD    B"},
  {"code" => 0x0a, "len" => 1, "text" => "LDAX   B"},
  {"code" => 0x0b, "len" => 1, "text" => "DCX    B"},
  {"code" => 0x0c, "len" => 1, "text" => "INR    C"},
  {"code" => 0x0d, "len" => 1, "text" => "DCR    C"},
  {"code" => 0x0e, "len" => 2, "text" => "MVI    C,D8"},
  {"code" => 0x0f, "len" => 1, "text" => "RRC"},
  {"code" => 0x10, "len" => 1, "text" => "UNHANDLED 10"},
  {"code" => 0x11, "len" => 3, "text" => "LXI    D,D16"},
  {"code" => 0x12, "len" => 1, "text" => "STAX   D"},
  {"code" => 0x13, "len" => 1, "text" => "INX    D"},
  {"code" => 0x14, "len" => 1, "text" => "INR    D"},
  {"code" => 0x15, "len" => 1, "text" => "DCR    D"},
  {"code" => 0x16, "len" => 2, "text" => "MVI    D,D8"},
  {"code" => 0x17, "len" => 1, "text" => "RAL"},
  {"code" => 0x18, "len" => 1, "text" => "UNHANDLED 18"},
  {"code" => 0x19, "len" => 1, "text" => "DAD    D"},
  {"code" => 0x1a, "len" => 1, "text" => "LDAX   D"},
  {"code" => 0x1b, "len" => 1, "text" => "DCX    D"},
  {"code" => 0x1c, "len" => 1, "text" => "INR    E"},
  {"code" => 0x1d, "len" => 1, "text" => "DCR    E"},
  {"code" => 0x1e, "len" => 2, "text" => "MVI    E,D8"},
  {"code" => 0x1f, "len" => 1, "text" => "RAR"},
  {"code" => 0x20, "len" => 1, "text" => "RIM"},
  {"code" => 0x21, "len" => 3, "text" => "LXI    H,D16"},
  {"code" => 0x22, "len" => 3, "text" => "SHLD   adr"},
  {"code" => 0x23, "len" => 1, "text" => "INX    H"},
  {"code" => 0x24, "len" => 1, "text" => "INR    H"},
  {"code" => 0x25, "len" => 1, "text" => "DCR    H"},
  {"code" => 0x26, "len" => 2, "text" => "MVI    H,D8"},
  {"code" => 0x27, "len" => 1, "text" => "DAA"},
  {"code" => 0x28, "len" => 1, "text" => "UNHANDLED 28"},
  {"code" => 0x29, "len" => 1, "text" => "DAD    H"},
  {"code" => 0x2a, "len" => 3, "text" => "LHLD   adr"},
  {"code" => 0x2b, "len" => 1, "text" => "DCX    H"},
  {"code" => 0x2c, "len" => 1, "text" => "INR    L"},
  {"code" => 0x2d, "len" => 1, "text" => "DCR    L"},
  {"code" => 0x2e, "len" => 2, "text" => "MVI    L,D8"},
  {"code" => 0x2f, "len" => 1, "text" => "CMA"},
  {"code" => 0x30, "len" => 1, "text" => "SIM"},
  {"code" => 0x31, "len" => 3, "text" => "LXI    SP,D16"},
  {"code" => 0x32, "len" => 3, "text" => "STA    adr"},
  {"code" => 0x33, "len" => 1, "text" => "INX    SP"},
  {"code" => 0x34, "len" => 1, "text" => "INR    M"},
  {"code" => 0x35, "len" => 1, "text" => "DCR    M"},
  {"code" => 0x36, "len" => 2, "text" => "MVI    M,D8"},
  {"code" => 0x37, "len" => 1, "text" => "STC"},
  {"code" => 0x38, "len" => 1, "text" => "UNHANDLED 38"},
  {"code" => 0x39, "len" => 1, "text" => "DAD    SP"},
  {"code" => 0x3a, "len" => 3, "text" => "LDA    adr"},
  {"code" => 0x3b, "len" => 1, "text" => "DCX    SP"},
  {"code" => 0x3c, "len" => 1, "text" => "INR    A"},
  {"code" => 0x3d, "len" => 1, "text" => "DCR    A"},
  {"code" => 0x3e, "len" => 2, "text" => "MVI    A,D8"},
  {"code" => 0x3f, "len" => 1, "text" => "CMC"},
  {"code" => 0x40, "len" => 1, "text" => "MOV    B,B"},
  {"code" => 0x41, "len" => 1, "text" => "MOV    B,C"},
  {"code" => 0x42, "len" => 1, "text" => "MOV    B,D"},
  {"code" => 0x43, "len" => 1, "text" => "MOV    B,E"},
  {"code" => 0x44, "len" => 1, "text" => "MOV    B,H"},
  {"code" => 0x45, "len" => 1, "text" => "MOV    B,L"},
  {"code" => 0x46, "len" => 1, "text" => "MOV    B,M"},
  {"code" => 0x47, "len" => 1, "text" => "MOV    B,A"},
  {"code" => 0x48, "len" => 1, "text" => "MOV    C,B"},
  {"code" => 0x49, "len" => 1, "text" => "MOV    C,C"},
  {"code" => 0x4a, "len" => 1, "text" => "MOV    C,D"},
  {"code" => 0x4b, "len" => 1, "text" => "MOV    C,E"},
  {"code" => 0x4c, "len" => 1, "text" => "MOV    C,H"},
  {"code" => 0x4d, "len" => 1, "text" => "MOV    C,L"},
  {"code" => 0x4e, "len" => 1, "text" => "MOV    C,M"},
  {"code" => 0x4f, "len" => 1, "text" => "MOV    C,A"},
  {"code" => 0x50, "len" => 1, "text" => "MOV    D,B"},
  {"code" => 0x51, "len" => 1, "text" => "MOV    D,C"},
  {"code" => 0x52, "len" => 1, "text" => "MOV    D,D"},
  {"code" => 0x53, "len" => 1, "text" => "MOV    D,E"},
  {"code" => 0x54, "len" => 1, "text" => "MOV    D,H"},
  {"code" => 0x55, "len" => 1, "text" => "MOV    D,L"},
  {"code" => 0x56, "len" => 1, "text" => "MOV    D,M"},
  {"code" => 0x57, "len" => 1, "text" => "MOV    D,A"},
  {"code" => 0x58, "len" => 1, "text" => "MOV    E,B"},
  {"code" => 0x59, "len" => 1, "text" => "MOV    E,C"},
  {"code" => 0x5a, "len" => 1, "text" => "MOV    E,D"},
  {"code" => 0x5b, "len" => 1, "text" => "MOV    E,E"},
  {"code" => 0x5c, "len" => 1, "text" => "MOV    E,H"},
  {"code" => 0x5d, "len" => 1, "text" => "MOV    E,L"},
  {"code" => 0x5e, "len" => 1, "text" => "MOV    E,M"},
  {"code" => 0x5f, "len" => 1, "text" => "MOV    E,A"},
  {"code" => 0x60, "len" => 1, "text" => "MOV    H,B"},
  {"code" => 0x61, "len" => 1, "text" => "MOV    H,C"},
  {"code" => 0x62, "len" => 1, "text" => "MOV    H,D"},
  {"code" => 0x63, "len" => 1, "text" => "MOV    H,E"},
  {"code" => 0x64, "len" => 1, "text" => "MOV    H,H"},
  {"code" => 0x65, "len" => 1, "text" => "MOV    H,L"},
  {"code" => 0x66, "len" => 1, "text" => "MOV    H,M"},
  {"code" => 0x67, "len" => 1, "text" => "MOV    H,A"},
  {"code" => 0x68, "len" => 1, "text" => "MOV    L,B"},
  {"code" => 0x69, "len" => 1, "text" => "MOV    L,C"},
  {"code" => 0x6a, "len" => 1, "text" => "MOV    L,D"},
  {"code" => 0x6b, "len" => 1, "text" => "MOV    L,E"},
  {"code" => 0x6c, "len" => 1, "text" => "MOV    L,H"},
  {"code" => 0x6d, "len" => 1, "text" => "MOV    L,L"},
  {"code" => 0x6e, "len" => 1, "text" => "MOV    L,M"},
  {"code" => 0x6f, "len" => 1, "text" => "MOV    L,A"},
  {"code" => 0x70, "len" => 1, "text" => "MOV    M,B"},
  {"code" => 0x71, "len" => 1, "text" => "MOV    M,C"},
  {"code" => 0x72, "len" => 1, "text" => "MOV    M,D"},
  {"code" => 0x73, "len" => 1, "text" => "MOV    M,E"},
  {"code" => 0x74, "len" => 1, "text" => "MOV    M,H"},
  {"code" => 0x75, "len" => 1, "text" => "MOV    M,L"},
  {"code" => 0x76, "len" => 1, "text" => "HLT"},
  {"code" => 0x77, "len" => 1, "text" => "MOV M,   A"},
  {"code" => 0x78, "len" => 1, "text" => "MOV A,   B"},
  {"code" => 0x79, "len" => 1, "text" => "MOV A,   C"},
  {"code" => 0x7a, "len" => 1, "text" => "MOV A,   D"},
  {"code" => 0x7b, "len" => 1, "text" => "MOV A,   E"},
  {"code" => 0x7c, "len" => 1, "text" => "MOV A,   H"},
  {"code" => 0x7d, "len" => 1, "text" => "MOV A,   L"},
  {"code" => 0x7e, "len" => 1, "text" => "MOV A,   M"},
  {"code" => 0x7f, "len" => 1, "text" => "MOV A,   A"},
  {"code" => 0x80, "len" => 1, "text" => "ADD    B"},
  {"code" => 0x81, "len" => 1, "text" => "ADD    C"},
  {"code" => 0x82, "len" => 1, "text" => "ADD    D"},
  {"code" => 0x83, "len" => 1, "text" => "ADD    E"},
  {"code" => 0x84, "len" => 1, "text" => "ADD    H"},
  {"code" => 0x85, "len" => 1, "text" => "ADD    L"},
  {"code" => 0x86, "len" => 1, "text" => "ADD    M"},
  {"code" => 0x87, "len" => 1, "text" => "ADD    A"},
  {"code" => 0x88, "len" => 1, "text" => "ADC    B"},
  {"code" => 0x89, "len" => 1, "text" => "ADC    C"},
  {"code" => 0x8a, "len" => 1, "text" => "ADC    D"},
  {"code" => 0x8b, "len" => 1, "text" => "ADC    E"},
  {"code" => 0x8c, "len" => 1, "text" => "ADC    H"},
  {"code" => 0x8d, "len" => 1, "text" => "ADC    L"},
  {"code" => 0x8e, "len" => 1, "text" => "ADC    M"},
  {"code" => 0x8f, "len" => 1, "text" => "ADC    A"},
  {"code" => 0x90, "len" => 1, "text" => "SUB    B"},
  {"code" => 0x91, "len" => 1, "text" => "SUB    C"},
  {"code" => 0x92, "len" => 1, "text" => "SUB    D"},
  {"code" => 0x93, "len" => 1, "text" => "SUB    E"},
  {"code" => 0x94, "len" => 1, "text" => "SUB    H"},
  {"code" => 0x95, "len" => 1, "text" => "SUB    L"},
  {"code" => 0x96, "len" => 1, "text" => "SUB    M"},
  {"code" => 0x97, "len" => 1, "text" => "SUB    A"},
  {"code" => 0x98, "len" => 1, "text" => "SBB    B"},
  {"code" => 0x99, "len" => 1, "text" => "SBB    C"},
  {"code" => 0x9a, "len" => 1, "text" => "SBB    D"},
  {"code" => 0x9b, "len" => 1, "text" => "SBB    E"},
  {"code" => 0x9c, "len" => 1, "text" => "SBB    H"},
  {"code" => 0x9d, "len" => 1, "text" => "SBB    L"},
  {"code" => 0x9e, "len" => 1, "text" => "SBB    M"},
  {"code" => 0x9f, "len" => 1, "text" => "SBB    A"},
  {"code" => 0xa0, "len" => 1, "text" => "ANA    B"},
  {"code" => 0xa1, "len" => 1, "text" => "ANA    C"},
  {"code" => 0xa2, "len" => 1, "text" => "ANA    D"},
  {"code" => 0xa3, "len" => 1, "text" => "ANA    E"},
  {"code" => 0xa4, "len" => 1, "text" => "ANA    H"},
  {"code" => 0xa5, "len" => 1, "text" => "ANA    L"},
  {"code" => 0xa6, "len" => 1, "text" => "ANA    M"},
  {"code" => 0xa7, "len" => 1, "text" => "ANA    A"},
  {"code" => 0xa8, "len" => 1, "text" => "XRA    B"},
  {"code" => 0xa9, "len" => 1, "text" => "XRA    C"},
  {"code" => 0xaa, "len" => 1, "text" => "XRA    D"},
  {"code" => 0xab, "len" => 1, "text" => "XRA    E"},
  {"code" => 0xac, "len" => 1, "text" => "XRA    H"},
  {"code" => 0xad, "len" => 1, "text" => "XRA    L"},
  {"code" => 0xae, "len" => 1, "text" => "XRA    M"},
  {"code" => 0xaf, "len" => 1, "text" => "XRA    A"},
  {"code" => 0xb0, "len" => 1, "text" => "ORA    B"},
  {"code" => 0xb1, "len" => 1, "text" => "ORA    C"},
  {"code" => 0xb2, "len" => 1, "text" => "ORA    D"},
  {"code" => 0xb3, "len" => 1, "text" => "ORA    E"},
  {"code" => 0xb4, "len" => 1, "text" => "ORA    H"},
  {"code" => 0xb5, "len" => 1, "text" => "ORA    L"},
  {"code" => 0xb6, "len" => 1, "text" => "ORA    M"},
  {"code" => 0xb7, "len" => 1, "text" => "ORA    A"},
  {"code" => 0xb8, "len" => 1, "text" => "CMP    B"},
  {"code" => 0xb9, "len" => 1, "text" => "CMP    C"},
  {"code" => 0xba, "len" => 1, "text" => "CMP    D"},
  {"code" => 0xbb, "len" => 1, "text" => "CMP    E"},
  {"code" => 0xbc, "len" => 1, "text" => "CMP    H"},
  {"code" => 0xbd, "len" => 1, "text" => "CMP    L"},
  {"code" => 0xbe, "len" => 1, "text" => "CMP    M"},
  {"code" => 0xbf, "len" => 1, "text" => "CMP    A"},
  {"code" => 0xc0, "len" => 1, "text" => "RNZ"},
  {"code" => 0xc1, "len" => 1, "text" => "POP    B"},
  {"code" => 0xc2, "len" => 3, "text" => "JNZ    adr"},
  {"code" => 0xc3, "len" => 3, "text" => "JMP    adr"},
  {"code" => 0xc4, "len" => 3, "text" => "CNZ    adr"},
  {"code" => 0xc5, "len" => 1, "text" => "PUSH   B"},
  {"code" => 0xc6, "len" => 2, "text" => "ADI    D8"},
  {"code" => 0xc7, "len" => 1, "text" => "RST    0"},
  {"code" => 0xc8, "len" => 1, "text" => "RZ"},
  {"code" => 0xc9, "len" => 1, "text" => "RET"},
  {"code" => 0xca, "len" => 3, "text" => "JZ     adr"},
  {"code" => 0xcb, "len" => 1, "text" => "UNHANDLED cb"},
  {"code" => 0xcc, "len" => 3, "text" => "CZ     adr"},
  {"code" => 0xcd, "len" => 3, "text" => "CALL   adr"},
  {"code" => 0xce, "len" => 2, "text" => "ACI    D8"},
  {"code" => 0xcf, "len" => 1, "text" => "RST    1"},
  {"code" => 0xd0, "len" => 1, "text" => "RNC"},
  {"code" => 0xd1, "len" => 1, "text" => "POP    D"},
  {"code" => 0xd2, "len" => 3, "text" => "JNC    adr"},
  {"code" => 0xd3, "len" => 2, "text" => "OUT    D8"},
  {"code" => 0xd4, "len" => 3, "text" => "CNC    adr"},
  {"code" => 0xd5, "len" => 1, "text" => "PUSH   D"},
  {"code" => 0xd6, "len" => 2, "text" => "SUI    D8"},
  {"code" => 0xd7, "len" => 1, "text" => "RST    2"},
  {"code" => 0xd8, "len" => 1, "text" => "RC"},
  {"code" => 0xd9, "len" => 1, "text" => "UNHANDLED d9"},
  {"code" => 0xda, "len" => 3, "text" => "JC     adr"},
  {"code" => 0xdb, "len" => 2, "text" => "IN     D8"},
  {"code" => 0xdc, "len" => 3, "text" => "CC     adr"},
  {"code" => 0xdd, "len" => 1, "text" => "UNHANDLED dd"},
  {"code" => 0xde, "len" => 2, "text" => "SBI    D8"},
  {"code" => 0xdf, "len" => 1, "text" => "RST    3"},
  {"code" => 0xe0, "len" => 1, "text" => "RPO"},
  {"code" => 0xe1, "len" => 1, "text" => "POP    H"},
  {"code" => 0xe2, "len" => 3, "text" => "JPO    adr"},
  {"code" => 0xe3, "len" => 1, "text" => "XTHL"},
  {"code" => 0xe4, "len" => 3, "text" => "CPO    adr"},
  {"code" => 0xe5, "len" => 1, "text" => "PUSH   H"},
  {"code" => 0xe6, "len" => 2, "text" => "ANI    D8"},
  {"code" => 0xe7, "len" => 1, "text" => "RST    4"},
  {"code" => 0xe8, "len" => 1, "text" => "RPE"},
  {"code" => 0xe9, "len" => 1, "text" => "PCHL"},
  {"code" => 0xea, "len" => 3, "text" => "JPE    adr"},
  {"code" => 0xeb, "len" => 1, "text" => "XCHG"},
  {"code" => 0xec, "len" => 3, "text" => "CPE    adr"},
  {"code" => 0xed, "len" => 1, "text" => "UNHANDLED ed"},
  {"code" => 0xee, "len" => 2, "text" => "XRI    D8"},
  {"code" => 0xef, "len" => 1, "text" => "RST    5"},
  {"code" => 0xf0, "len" => 1, "text" => "RP"},
  {"code" => 0xf1, "len" => 1, "text" => "POP    PSW"},
  {"code" => 0xf2, "len" => 3, "text" => "JP     adr"},
  {"code" => 0xf3, "len" => 1, "text" => "DI"},
  {"code" => 0xf4, "len" => 3, "text" => "CP     adr"},
  {"code" => 0xf5, "len" => 1, "text" => "PUSH   PSW"},
  {"code" => 0xf6, "len" => 2, "text" => "ORI    D8"},
  {"code" => 0xf7, "len" => 1, "text" => "RST    6"},
  {"code" => 0xf8, "len" => 1, "text" => "RM"},
  {"code" => 0xf9, "len" => 1, "text" => "SPHL"},
  {"code" => 0xfa, "len" => 3, "text" => "JM     adr"},
  {"code" => 0xfb, "len" => 1, "text" => "EI"},
  {"code" => 0xfc, "len" => 3, "text" => "CM     adr"},
  {"code" => 0xfd, "len" => 1, "text" => "UNHANDLED fd"},
  {"code" => 0xfe, "len" => 2, "text" => "CPI    D8"},
  {"code" => 0xff, "len" => 1, "text" => "RST    7"},
]

map = Hash.zip(opcodes.map { |op| op["code"] }, opcodes)
op_count = 0
byte_count = 0

iter = STDIN.each_byte
byte = iter.next
while byte != iter.stop
  printf "%04x %02x ", byte_count, byte
  op = map[byte]
  len = op["len"].to_i - 1
  arg_bytes = (1..len).map {iter.next}

  arg_bytes.each { |arg_byte| printf "%02x ", arg_byte }
  printf " " * 3 * (2 - arg_bytes.size)

  printf op["text"].to_s.sub(/adr/, "$%02x%02x").sub(/D16/, "0x%02x%02x").sub(/D8/, "0x%02x"), arg_bytes.reverse
  puts
  op_count += 1
  byte_count += 1 + len
  byte = iter.next
end

p "opcount: #{op_count}"