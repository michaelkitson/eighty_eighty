module EightyEighty::Instruction::DataTransfer::LoadHLDirect
  MNEMONIC = "LHLD"

  def self.run(state : State)
    state.l = state.memory[state.read_instruction_u16]
    state.h = state.memory[state.read_instruction_u16 + 1]
    state.pc += 3
    16
  end
end
