module EightyEighty::Instruction::DataTransfer::StoreAccumulatorDirect
  MNEMONIC = "STA"

  def self.run(state : State)
    state.memory[state.read_instruction_u16] = state.a
    state.pc += 3
  end
end
