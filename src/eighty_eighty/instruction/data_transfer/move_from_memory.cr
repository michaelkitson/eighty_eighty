module EightyEighty::Instruction::DataTransfer::MoveFromMemory
  MNEMONIC = "MOV"

  def self.run(state : State)
    state.destination_register = state.memory[state.hl]
    state.pc += 1
    7
  end
end
