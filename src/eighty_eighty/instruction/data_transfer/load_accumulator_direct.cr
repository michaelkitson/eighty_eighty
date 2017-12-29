module EightyEighty::Instruction::DataTransfer::LoadAccumulatorDirect
  MNEMONIC = "LDA"

  def self.run(state : State)
    state.a = state.memory[state.read_instruction_u16]
    state.pc += 3
    13
  end
end
