module EightyEighty::Instruction::DataTransfer::StoreHLDirect
  MNEMONIC = "SHLD"

  def self.run(state : State)
    state.memory[state.read_instruction_u16] = state.l
    state.memory[state.read_instruction_u16 + 1] = state.h
    state.pc += 3
    16
  end
end
