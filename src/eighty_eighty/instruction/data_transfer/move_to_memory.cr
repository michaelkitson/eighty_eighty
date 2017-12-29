module EightyEighty::Instruction::DataTransfer::MoveToMemory
  MNEMONIC = "MOV"

  def self.run(state : State)
    state.memory[state.hl] = state.source_register
    state.pc += 1
    7
  end
end
